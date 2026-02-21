<?php

namespace App\Http\Controllers;

use App\Models\Bundle;
use App\Models\BundleProduct;
use App\Models\Cart;
use App\Models\Product;
use App\Models\ProductVariation;
use App\Models\UserReward;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class BundleController extends Controller
{

    public function addProductToBundle(Request $request)
    {
        $request->validate([
            'product_id' => 'required|exists:products,id',
        ]);

        $productId   = $request->input('product_id');
        $variationId = $request->input('variation_id');
        $userId      = Auth::check() ? Auth::id() : null;

        // Stock validation BEFORE adding to bundle
        $availableStock = 0;
        $productName = '';
        
        if ($variationId) {
            $variation = ProductVariation::with('product')->find($variationId);
            if (!$variation) {
                return response()->json([
                    'message' => 'Product variation not found.',
                ], 404);
            }
            $availableStock = $variation->quantity - ($variation->unavailable_quantity ?? 0);
            $productName = $variation->product->name . ' (' . $variation->size . ')';
        } else {
            $product = Product::find($productId);
            if (!$product) {
                return response()->json([
                    'message' => 'Product not found.',
                ], 404);
            }
            $availableStock = $product->quantity - ($product->unavailable_quantity ?? 0);
            $productName = $product->name;
        }

        if ($availableStock <= 0) {
            return response()->json([
                'message' => "'{$productName}' is out of stock and cannot be added to bundle.",
            ], 422);
        }

        // Always ensure we have a session_id
        $sessionId = session()->get('bundle_session_id');
        if (!$sessionId) {
            $sessionId = Str::uuid()->toString();
            session()->put('bundle_session_id', $sessionId);
        }

        $result = DB::transaction(function () use ($userId, $sessionId, $productId, $variationId) {
            // ✅ Find existing pending bundle by user OR session, not both
            $bundle = Bundle::where('status', 'pending')
                ->when($userId, function ($q) use ($userId) {
                    $q->where('user_id', $userId);
                })
                ->when(!$userId, function ($q) use ($sessionId) {
                    $q->where('session_id', $sessionId);
                })
                ->first();

            // If no bundle found, create a new one
            if (!$bundle) {
                $bundle = Bundle::create([
                    'user_id'    => $userId,
                    'session_id' => $sessionId,
                    'status'     => 'pending',
                ]);
            } else {
                // If user logs in later, make sure user_id is set
                if ($userId && !$bundle->user_id) {
                    $bundle->update(['user_id' => $userId]);
                }
            }

            $currentCount = $bundle->bundleProducts()->count();

            if ($currentCount >= 3) {
                return [
                    'code'    => 422,
                    'message' => 'This bundle is already complete. Please add it to your cart or proceed to checkout.',
                    'bundle'  => $bundle->fresh(),
                    'total'   => $currentCount,
                ];
            }

            // Add product to bundle
            BundleProduct::create([
                'bundle_id'    => $bundle->id,
                'product_id'   => $productId,
                'variation_id' => $variationId,
            ]);

            return [
                'code'    => 200,
                'message' => 'Product added to bundle.',
                'bundle'  => $bundle->fresh(),
                'total'   => $currentCount + 1, // since we just added one
            ];
        });

        return response()->json([
            'message'        => $result['message'],
            'bundle_id'      => $result['bundle']->id,
            'total_products' => $result['total'],
            'status'         => $result['bundle']->status,
        ], $result['code']);
    }


    public function getPendingBundle()
    {
        $userId    = Auth::check() ? Auth::id() : null;
        $sessionId = session('bundle_session_id');

        $bundle = Bundle::with(['bundleProducts.product', 'bundleProducts.variation'])
            ->where('status', 'pending')
            ->where(function ($q) use ($userId, $sessionId) {
                if ($userId) {
                    $q->where('user_id', $userId);
                } else {
                    $q->where('session_id', $sessionId);
                }
            })
            ->first();

        // If bundle belongs only to session but user is now logged in → update user_id
        if ($bundle && $userId && !$bundle->user_id) {
            $bundle->update(['user_id' => $userId]);
        }

        if (!$bundle || $bundle->bundleProducts->isEmpty()) {
            return response()->json([
                'status'  => 'empty',
                'message' => 'No product in bundle.',
            ]);
        }

        return response()->json([
            'status'  => 'ok',
            'bundle'  => $bundle,
            'total'   => $bundle->bundleProducts->count(),
        ]);
    }



    public function addToCart(Request $request)
    {
        $request->validate([
            'type'         => 'required_without:id|in:product,bundle,gift-card',
            'type_id'      => 'required_without:id|integer',
            'id'           => 'required_without:type|integer|exists:carts,id',
            'qty'          => 'nullable|integer|min:1',
            'variation_id' => 'nullable|exists:product_variations,id',
        ]);

        // 🔹 Case 1: Update existing cart item by ID
        if ($request->filled('id')) {
            $cartItem = Cart::find($request->input('id'));
            if (!$cartItem) {
                return response()->json([
                    'status'  => 'error',
                    'message' => 'Cart item not found.',
                ], 404);
            }

            $newQty = (int) $request->input('qty', 1);

            // Stock validation for update
            if ($cartItem->type === 'product') {
                $availableStock = 0;
                if ($cartItem->variation_id) {
                    $variation = ProductVariation::find($cartItem->variation_id);
                    $availableStock = $variation ? ($variation->quantity - ($variation->unavailable_quantity ?? 0)) : 0;
                } else {
                    $product = Product::find($cartItem->type_id);
                    $availableStock = $product ? ($product->quantity - ($product->unavailable_quantity ?? 0)) : 0;
                }

                if ($availableStock <= 0) {
                    return response()->json([
                        'status'  => 'error',
                        'message' => 'This product is out of stock.',
                    ], 422);
                }

                if ($newQty > $availableStock) {
                    return response()->json([
                        'status'  => 'error',
                        'message' => "Only {$availableStock} items available in stock.",
                    ], 422);
                }
            }

            $cartItem->qty = $newQty;
            $cartItem->save();

            return response()->json([
                'status'    => 'ok',
                'message'   => 'Cart updated',
                'cartItem'  => $cartItem,
            ]);
        }

        // 🔹 Case 2: Add new item - Stock validation BEFORE adding
        $qtyFromRequest = (int) $request->input('qty', 1);
        
        // Validate stock for products
        if ($request->type === 'product') {
            $availableStock = 0;
            
            if ($request->filled('variation_id')) {
                $variation = ProductVariation::find($request->variation_id);
                if (!$variation) {
                    return response()->json([
                        'status'  => 'error',
                        'message' => 'Product variation not found.',
                    ], 404);
                }
                $availableStock = $variation->quantity - ($variation->unavailable_quantity ?? 0);
            } else {
                $product = Product::find($request->type_id);
                if (!$product) {
                    return response()->json([
                        'status'  => 'error',
                        'message' => 'Product not found.',
                    ], 404);
                }
                $availableStock = $product->quantity - ($product->unavailable_quantity ?? 0);
            }

            if ($availableStock <= 0) {
                return response()->json([
                    'status'  => 'error',
                    'message' => 'This product is out of stock.',
                ], 422);
            }

            if ($qtyFromRequest > $availableStock) {
                return response()->json([
                    'status'  => 'error',
                    'message' => "Only {$availableStock} items available in stock.",
                ], 422);
            }
        }
        
        // Validate stock for bundles
        if ($request->type === 'bundle') {
            $bundle = Bundle::with('bundleProducts.product', 'bundleProducts.variation')->find($request->type_id);
            
            if (!$bundle) {
                return response()->json([
                    'status'  => 'error',
                    'message' => 'Bundle not found.',
                ], 404);
            }
            
            if ($bundle->bundleProducts->count() < 3) {
                return response()->json([
                    'status'  => 'error',
                    'message' => 'Bundle must have 3 products before adding to cart.',
                ], 422);
            }
            
            // Check stock for each product in bundle
            foreach ($bundle->bundleProducts as $bundleProduct) {
                $availableStock = 0;
                
                if ($bundleProduct->variation_id && $bundleProduct->variation) {
                    $availableStock = $bundleProduct->variation->quantity - ($bundleProduct->variation->unavailable_quantity ?? 0);
                    $productName = $bundleProduct->product->name . ' (' . $bundleProduct->variation->size . ')';
                } else if ($bundleProduct->product) {
                    $availableStock = $bundleProduct->product->quantity - ($bundleProduct->product->unavailable_quantity ?? 0);
                    $productName = $bundleProduct->product->name;
                } else {
                    continue;
                }
                
                if ($availableStock <= 0) {
                    return response()->json([
                        'status'  => 'error',
                        'message' => "Product '{$productName}' in this bundle is out of stock.",
                    ], 422);
                }
                
                if ($qtyFromRequest > $availableStock) {
                    return response()->json([
                        'status'  => 'error',
                        'message' => "Only {$availableStock} units of '{$productName}' available.",
                    ], 422);
                }
            }
        }

        $userId    = Auth::check() ? Auth::id() : null;
        $sessionId = session()->get('cart_session_id');
        if ($userId) {
            $rewardType = $request->input('reward_type');
            $rewardValue = $request->input('reward_value');
            if ($request->type === 'bundle' && $rewardType) {
                UserReward::create([
                    'user_id'   => auth()->id(),
                    'bundle_id' => $request->type_id,
                    'type'      => $rewardType,
                    'type_value' => $rewardValue,
                    'status'    => 'pending',
                ]);
                $user = auth()->user();
                if ($rewardType == 'points') {
                    $user->increment('total_points', $rewardValue);
                } elseif ($rewardType == 'shipping') {
                    $user->increment('total_shippings');
                }
            }
        }
        if (!$sessionId) {
            $sessionId = Str::uuid()->toString();
            session()->put('cart_session_id', $sessionId);
        }

        // Ensure bundle is complete before adding
        if ($request->type == 'bundle') {
            $bundle = Bundle::with('bundleProducts')->findOrFail($request->type_id);
            // Mark bundle as complete
            Bundle::where('user_id', $bundle->user_id)
                ->orWhere('session_id', $bundle->session_id)
                ->where('status', 'pending')
                ->where('id', '!=', $bundle->id)
                ->update(['status' => 'cancelled']);
            $bundle->update(['status' => 'complete']);
        }

        // 🔹 Find existing cart (isolation: user_id OR session_id, not both)
        $existingCart = Cart::where('type', $request->type)
            ->where('type_id', $request->type_id)
            ->when($request->type === 'product', function ($q) use ($request) {
                $q->where('variation_id', $request->input('variation_id', null));
            })
            ->where(function ($q) use ($userId, $sessionId) {
                if ($userId) {
                    $q->where('user_id', $userId);
                } else {
                    $q->where('session_id', $sessionId);
                }
            })
            ->first();

         if ($request->type === 'gift-card') {
        $giftCardOptions = config('services.gift_cards'); // comes from services.php
        $priceId = $request->type_id;

        if (!array_key_exists($priceId, $giftCardOptions)) {
            return response()->json([
                'status'  => 'error',
                'message' => 'Invalid gift card option selected.',
            ], 422);
        }

        // Check if already exists in cart
        $existingCart = Cart::where('type', 'gift-card')
            ->where('type_id', $priceId)
            ->where(function ($q) use ($userId, $sessionId) {
                if ($userId) {
                    $q->where('user_id', $userId);
                } else {
                    $q->where('session_id', $sessionId);
                }
            })
            ->first();

        if ($existingCart) {
            $existingCart->qty += $qtyFromRequest;
            if ($userId && !$existingCart->user_id) {
                $existingCart->user_id = $userId; // merge guest → user
            }
            $existingCart->save();
            $cartItem = $existingCart;
        } else {
            $cartItem = Cart::create([
                'type'           => 'gift-card',
                'type_id'        => $priceId,
                'user_id'        => $userId,
                'session_id'     => $sessionId,
                'qty'            => $qtyFromRequest,
                'recipient_email'=> $request->input('recipient_email', null),
            ]);
        }

        return response()->json([
            'status'   => 'ok',
            'message'  => 'Gift Card added to cart',
            'cartItem' => $cartItem,
        ]);
    }

        if ($existingCart) {
            // Check if adding more would exceed stock
            $newTotalQty = $existingCart->qty + $qtyFromRequest;
            
            if ($request->type === 'product') {
                $availableStock = 0;
                if ($existingCart->variation_id) {
                    $variation = ProductVariation::find($existingCart->variation_id);
                    $availableStock = $variation ? ($variation->quantity - ($variation->unavailable_quantity ?? 0)) : 0;
                } else {
                    $product = Product::find($existingCart->type_id);
                    $availableStock = $product ? ($product->quantity - ($product->unavailable_quantity ?? 0)) : 0;
                }
                
                if ($newTotalQty > $availableStock) {
                    return response()->json([
                        'status'  => 'error',
                        'message' => "Cannot add more. Only {$availableStock} items available (you already have {$existingCart->qty} in cart).",
                    ], 422);
                }
            }
            
            $existingCart->qty = $newTotalQty;
            if ($userId && !$existingCart->user_id) {
                $existingCart->user_id = $userId; // Merge guest → user
            }
            $existingCart->save();
            $cartItem = $existingCart;
        } else {
            $cartItem = Cart::create([
                'type'         => $request->type,
                'type_id'      => $request->type_id,
                'user_id'      => $userId,
                'session_id'   => $sessionId,
                'variation_id' => $request->input('variation_id', null),
                'qty'          => $qtyFromRequest,
            ]);
        }

        return response()->json([
            'status'    => 'ok',
            'message'   => ucfirst($request->type) . ' added to cart',
            'cartItem'  => $cartItem,
        ]);
    }






 public function getCart()
{
    $userId    = Auth::check() ? Auth::id() : null;
    $sessionId = session()->get('cart_session_id');
   
    $query = Cart::query();
    $topListedProducts = Product::where('is_top_listed', true)->get();

    if ($userId) {
        $query->where('user_id', $userId);
    } elseif ($sessionId) {
        $query->where('session_id', $sessionId);
    } else {
        // No user and no session → return empty
        $products   = collect();
        $bundles    = collect();
        $giftCards  = collect();
        $bangleBoxCartItems = collect();
        return view('pages.cart', compact('products', 'bundles', 'giftCards', 'bangleBoxCartItems', 'topListedProducts'));
    }

    // Products
    $products = (clone $query)
        ->where('type', 'product')
        ->with(['product', 'variation'])
        ->get();

    // Bundles
    $bundles = (clone $query)
        ->where('type', 'bundle')
        ->with([
            'bundle.bundleProducts.product',
            'bundle.bundleProducts.variation'
        ])
        ->get();

    // Gift Cards
    $giftCardConfig = config('services.gift_cards'); // id => price mapping
    $giftCards = (clone $query)
        ->where('type', 'gift-card')
        ->get()
        ->map(function ($cartItem) use ($giftCardConfig) {
            $giftCardId = (int) $cartItem->type_id;
            $cartItem->gift_card_price = $giftCardConfig[$giftCardId] ?? 0;
            return $cartItem;
        });
 $bangleBoxCartItems = (clone $query)
        ->where('type', 'bangle_box')
        ->with('bangleBox', 'bangleSize', 'bangleCartColors.color')
        ->get();

    return view('pages.cart', compact('products', 'bundles', 'bangleBoxCartItems','giftCards', 'topListedProducts'));
}






    public function removeFromCart(Request $request)
    {
        $id        = $request->input('id');
        $userId    = Auth::check() ? Auth::id() : null;
        $sessionId = session()->get('cart_session_id');

        $cartItem = Cart::where('id', $id)
            ->when($userId, function ($q) use ($userId) {
                $q->where('user_id', $userId);
            }, function ($q) use ($sessionId) {
                $q->where('session_id', $sessionId);
            })
            ->first();

        if (!$cartItem) {
            return response()->json([
                'status'  => 'error',
                'message' => 'Cart item not found.',
            ], 404);
        }

        // If it's a bundle → delete its products too
        if ($cartItem->type == 'bundle') {
            $bundle = $cartItem->bundle;
            if ($bundle) {
                $userRewards = UserReward::where('bundle_id', $bundle->id)->get();

                foreach ($userRewards as $reward) {
                    $user = $reward->user;
                    if ($reward->type == 'points') {
                        $user->decrement('total_points', $reward->type_value);
                    } elseif ($reward->type === 'shipping') {
                        if ($user->total_shippings > 0) {
                            $user->decrement('total_shippings');
                        }
                    }
                }
                UserReward::where('bundle_id', $bundle->id)->delete();
                $bundle->bundleProducts()->delete();
                $bundle->delete();
            }
        }

        $cartItem->delete();

        return response()->json([
            'status'  => 'ok',
            'message' => 'Item removed from cart.',
        ]);
    }
    public function removeProductFromBundle(Request $request)
        {
            $bundleProductId = $request->input('bundle_product_id');

            $bundleProduct = BundleProduct::find($bundleProductId);

            if (!$bundleProduct) {
                return response()->json([
                    'status'  => 'error',
                    'message' => 'Bundle product not found.',
                ], 404);
            }

            $bundle = $bundleProduct->bundle;

            // Delete the bundle product
            $bundleProduct->delete();

            // Check if bundle is now empty
            $remainingProducts = BundleProduct::where('bundle_id', $bundle->id)->count();

            if ($remainingProducts === 0) {
                // Delete the bundle if no products left
                $bundle->delete();
            }

            return response()->json([
                'status'  => 'ok',
                'message' => 'Product removed from bundle.',
            ]);
        }
}
