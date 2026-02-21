<?php

require __DIR__ . '/vendor/autoload.php';

$app = require_once __DIR__ . '/bootstrap/app.php';
$app->make('Illuminate\Contracts\Console\Kernel')->bootstrap();

use App\Models\Product;
use App\Models\Order;
use App\Models\User;
use App\Models\Address;

echo "=== Checking Products with Complete Shipping Data ===\n\n";

$products = Product::whereNotNull('weight')
    ->whereNotNull('country_of_origin')
    ->whereNotNull('hs_code')
    ->where('weight', '>', 0)
    ->where('price', '>', 0)
    ->where('quantity', '>', 0)
    ->limit(5)
    ->get();

if ($products->isEmpty()) {
    echo "❌ No products found with complete shipping data!\n";
    echo "Products need: weight, country_of_origin, hs_code, price, quantity\n";
    exit(1);
}

echo "✅ Found " . $products->count() . " products with complete shipping data:\n\n";

foreach ($products as $product) {
    echo "ID: {$product->id}\n";
    echo "Name: {$product->name}\n";
    echo "SKU: {$product->sku}\n";
    echo "Price: \${$product->price}\n";
    echo "Weight: {$product->weight} {$product->weight_unit}\n";
    echo "Country: {$product->country_of_origin}\n";
    echo "HS Code: {$product->hs_code}\n";
    echo "Quantity: {$product->quantity}\n";
    echo "---\n\n";
}

// Get or create a test user
$user = User::where('email', 'test@example.com')->first();
if (!$user) {
    $user = User::create([
        'name' => 'Test Customer',
        'email' => 'test@example.com',
        'password' => bcrypt('password'),
        'phone' => '4165551234',
    ]);
    echo "✅ Created test user: test@example.com\n\n";
} else {
    echo "✅ Using existing test user: test@example.com\n\n";
}

// Skip address creation - not needed for orders
echo "✅ Skipping address creation (not required for orders)\n\n";

echo "=== Creating Test Orders ===\n\n";

// Delete existing test orders
Order::where('email', 'test@example.com')->delete();
echo "🗑️  Deleted old test orders\n\n";

// Create 3 test orders
for ($i = 1; $i <= 3; $i++) {
    $product = $products->random();
    $quantity = rand(1, 2);
    
    $subtotal = $product->price * $quantity;
    $tax = round($subtotal * 0.13, 2); // 13% HST
    $total = $subtotal + $tax;
    
    $productsMetaData = [
        'Products' => [[
            'product_id' => $product->id,
            'product' => [
                'id' => $product->id,
                'name' => $product->name,
                'sku' => $product->sku,
                'price' => $product->price,
                'images' => is_array($product->images) ? $product->images : json_decode($product->images ?? '[]', true),
                'weight' => $product->weight,
                'weight_unit' => $product->weight_unit,
                'country_of_origin' => $product->country_of_origin,
                'hs_code' => $product->hs_code,
            ],
            'qty' => $quantity,
            'quantity' => $quantity,
            'price' => $product->price,
            'final_price' => $product->price,
            'line_total' => $product->price * $quantity,
            'weight' => $product->weight,
            'weight_unit' => $product->weight_unit,
        ]]
    ];
    
    $deliveryMetaData = [
        'address' => '123 Main Street',
        'street' => '123 Main Street',
        'formatted_address' => '123 Main Street, Toronto, ON M5H 2N2, Canada',
        'city' => 'Toronto',
        'state_province' => 'Ontario',
        'province_code' => 'ON',
        'country' => 'Canada',
        'country_iso' => 'CA',
        'postal_code' => 'M5H 2N2',
    ];
    
    $userMetaData = [
        'name' => 'John',
        'last_name' => 'Doe',
        'phone' => '4165551234',
        'email' => 'test@example.com',
    ];
    
    $order = Order::create([
        'user_id' => $user->id,
        'email' => 'test@example.com',
        'phone' => '4165551234',
        'subtotal' => $subtotal,
        'sub_total' => $subtotal,  // Both formats for compatibility
        'tax' => $tax,
        'total' => $total,
        'total_amount' => $total,  // Both formats for compatibility
        'currency' => 'CAD',
        'status' => 'pending',
        'payment_status' => 'paid',
        'payment_method' => 'test',
        'products_meta_data' => json_encode($productsMetaData),
        'delivery_meta_data' => json_encode($deliveryMetaData),
        'user_meta_data' => json_encode($userMetaData),
        'bangle_meta_data' => json_encode([]),
        'applied_gift_card_meta_data' => json_encode([]),
    ]);
    
    echo "✅ Order #{$order->id} created\n";
    echo "   Product: {$product->name}\n";
    echo "   Quantity: {$quantity}\n";
    echo "   Total: \${$total} CAD\n";
    echo "   Weight: {$product->weight} {$product->weight_unit}\n";
    echo "   Country: {$product->country_of_origin}\n";
    echo "   HS Code: {$product->hs_code}\n\n";
}

echo "\n=== Summary ===\n";
echo "✅ Created 3 test orders with complete shipping data\n";
echo "✅ All products have: weight, country_of_origin, hs_code\n";
echo "✅ Orders are ready for label creation testing\n";
echo "\nYou can now test label creation in the admin panel!\n";
