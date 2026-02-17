<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\Order;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;

class ShippingController extends Controller
{
    public function postRates(Request $request)
    {
        \Log::info('=== postRates called ===', [
            'request_data' => $request->all(),
            'headers' => $request->headers->all()
        ]);
        
        try {
            $validated = $request->validate([
                'to_address.name' => 'required|string',
                'to_address.address1' => 'required|string',
                'to_address.city' => 'required|string',
                'to_address.postal_code' => 'nullable|string',
                'to_address.country_code' => 'required|string',
                'to_address.province_code' => 'nullable|string',
                'to_address.phone' => 'nullable|string',
                'to_address.email' => 'nullable|email',
                'weight' => 'required|numeric',
                'weight_unit' => 'required|string|in:lbs,kg,g,oz',
                'length' => 'required|numeric|min:0.01',
                'width' => 'required|numeric|min:0.01',
                'height' => 'required|numeric|min:0.01',
                'size_unit' => 'nullable|string|in:cm,in',
                'items' => 'required|array|min:1',
                'items.*.description' => 'required|string',
                'items.*.sku' => 'nullable|string',
                'items.*.quantity' => 'required|integer|min:1',
                'items.*.value' => 'nullable|numeric|min:0',
                'items.*.currency' => 'nullable|string|in:USD,CAD,EUR,AUD,GBP',
                'items.*.country_of_origin' => 'nullable|string',
                'items.*.hs_code' => 'nullable|string',
            ]);
            
            // ✅ Build payload for Stallion Express v4 API
            $payload = [
                'to_address' => [
                    'name' => $validated['to_address']['name'] ?? 'Customer',
                    'company' => null,
                    'address1' => $validated['to_address']['address1'],
                    'address2' => null,
                    'city' => $validated['to_address']['city'],
                    'province_code' => $validated['to_address']['province_code'] ?? null,
                    'postal_code' => $validated['to_address']['postal_code'] ?? null,
                    'country_code' => $validated['to_address']['country_code'],
                    'phone' => $validated['to_address']['phone'] ?? null,
                    'email' => $validated['to_address']['email'] ?? null,
                    'is_residential' => true,
                ],
                'weight_unit' => $validated['weight_unit'],
                'weight' => (float) $validated['weight'],
                'length' => (float) $validated['length'],
                'width' => (float) $validated['width'],
                'height' => (float) $validated['height'],
                'size_unit' => $validated['size_unit'] ?? 'cm',
                'items' => array_map(function($item) {
                    return [
                        'description' => $item['description'],
                        'sku' => $item['sku'] ?? null,
                        'quantity' => (int) $item['quantity'],
                        'value' => (float) ($item['value'] ?? 0),
                        'currency' => $item['currency'] ?? 'CAD',
                        'country_of_origin' => $item['country_of_origin'] ?? 'CA',
                        'hs_code' => $item['hs_code'] ?? '7117.90.7500', // Valid US HTS code for jewelry
                    ];
                }, $validated['items']),
                'package_type' => 'Parcel',
            ];
            
            $base = rtrim(config('services.stallion.base_url', 'https://ship.stallionexpress.ca/api/v4'), '/');
            $token = config('services.stallion.api_token');
            
            if (empty($token)) {
                return response()->json([
                    'success' => false,
                    'errors' => ['Stallion Express API token is not configured. Please contact administrator.'],
                ], 500);
            }
            
            \Log::info('Calling Stallion API', [
                'url' => $base . '/rates',
                'payload' => $payload
            ]);
            
            $response = Http::withHeaders([
                'Authorization' => 'Bearer ' . $token,
                'Accept' => 'application/json',
                'Content-Type' => 'application/json',
            ])->retry(3, 5000)
                ->post($base . '/rates', $payload);

            $resp = $response;
            $data = $response->json();
            
            \Log::info('Stallion API Response', [
                'status' => $resp->status(),
                'body' => $data
            ]);
            
            if (!$resp->successful()) {
                \Log::error('Stallion API Error', [
                    'status' => $resp->status(),
                    'response' => $data,
                    'body' => $resp->body()
                ]);
                
                return response()->json([
                    'success' => false,
                    'errors' => $data['errors'] ?? ['Failed to call Stallion API'],
                ], $resp->status());
            }

            return response()->json([
                'success' => true,
                'rates' => $data['rates'] ?? [],
            ]);
        } catch (\Illuminate\Validation\ValidationException $e) {
            \Log::error('Validation failed', [
                'errors' => $e->errors()
            ]);
            return response()->json([
                'success' => false,
                'errors' => $e->errors(),
            ], 422);
        } catch (\Throwable $e) {
            \Log::error('postRates exception', [
                'message' => $e->getMessage(),
                'trace' => $e->getTraceAsString()
            ]);
            return response()->json([
                'success' => false,
                'errors' => [$e->getMessage()],
            ], 500);
        }
    }

    public function BuyLabel(Request $request)
    {
        \Log::info('=== BuyLabel called ===', [
            'request_data' => $request->all()
        ]);

        $validated = $request->validate([
            'order_id' => 'required|integer',
            'to_address.name' => 'required|string|max:40',
            'to_address.company' => 'nullable|string|max:40',
            'to_address.address1' => 'required|string|max:50',
            'to_address.address2' => 'nullable|string|max:50',
            'to_address.city' => 'required|string|max:35',
            'to_address.postal_code' => 'required|string|max:10',
            'to_address.country_code' => 'required|string|size:2',
            'to_address.province_code' => 'required|string|size:2',
            'to_address.phone' => 'nullable|string|max:20',
            'to_address.email' => 'nullable|email|max:50',
            'to_address.is_residential' => 'nullable|boolean',
            'weight' => 'required|numeric',
            'weight_unit' => 'required|string|in:lbs,kg,g,oz',
            'length' => 'required|numeric|min:0.01',
            'width' => 'required|numeric|min:0.01',
            'height' => 'required|numeric|min:0.01',
            'size_unit' => 'required|string|in:cm,in',
            'package_type' => 'required|string',
            'postage_type' => 'required|string',
            'signature_confirmation' => 'nullable|boolean',
            'insured' => 'nullable|boolean',
            'label_format' => 'nullable|string|in:pdf,zpl,png',
            'is_draft' => 'nullable|boolean',
            'items' => 'required|array|min:1',
            'items.*.description' => 'required|string',
            'items.*.sku' => 'nullable|string',
            'items.*.quantity' => 'required|integer|min:1',
            'items.*.value' => 'required|numeric|min:0',
            'items.*.currency' => 'required|string|in:USD,CAD,EUR,AUD,GBP',
        ]);

        // ✅ Add required fields to items
        foreach ($validated['items'] as &$item) {
            $item['country_of_origin'] = $item['country_of_origin'] ?? 'CA';
            $item['hs_code'] = $item['hs_code'] ?? '7117.90.7500';
        }

        // ✅ Build payload for Stallion API
        $payload = [
            'to_address' => [
                'name' => $validated['to_address']['name'],
                'company' => $validated['to_address']['company'] ?? null,
                'address1' => $validated['to_address']['address1'],
                'address2' => $validated['to_address']['address2'] ?? null,
                'city' => $validated['to_address']['city'],
                'province_code' => $validated['to_address']['province_code'],
                'postal_code' => $validated['to_address']['postal_code'],
                'country_code' => $validated['to_address']['country_code'],
                'phone' => $validated['to_address']['phone'] ?? null,
                'email' => $validated['to_address']['email'] ?? null,
                'is_residential' => $validated['to_address']['is_residential'] ?? true,
            ],
            'weight_unit' => $validated['weight_unit'],
            'weight' => (float) $validated['weight'],
            'length' => (float) $validated['length'],
            'width' => (float) $validated['width'],
            'height' => (float) $validated['height'],
            'size_unit' => $validated['size_unit'],
            'items' => $validated['items'],
            'package_type' => $validated['package_type'],
            'postage_type' => $validated['postage_type'],
            'signature_confirmation' => $validated['signature_confirmation'] ?? false,
            'insured' => $validated['insured'] ?? false,
            'label_format' => $validated['label_format'] ?? 'pdf',
            'is_draft' => $validated['is_draft'] ?? false,
            'is_fba' => false,
        ];

        $base = rtrim(config('services.stallion.base_url', 'https://ship.stallionexpress.ca/api/v4'), '/');
        $token = config('services.stallion.api_token');

        if (empty($token)) {
            return response()->json([
                'success' => false,
                'errors' => ['Stallion Express API token is not configured.'],
            ], 500);
        }

        \Log::info('Creating shipment', [
            'url' => $base . '/shipments',
            'payload' => $payload
        ]);

        try {
            $response = Http::withHeaders([
                'Authorization' => 'Bearer ' . $token,
                'Accept' => 'application/json',
                'Content-Type' => 'application/json',
                'Idempotency-Key' => 'order_' . $validated['order_id'] . '_' . time(),
            ])->timeout(30)
                ->post($base . '/shipments', $payload);

            $data = $response->json();

            \Log::info('Stallion shipment response', [
                'status' => $response->status(),
                'data' => $data
            ]);

            if (!$response->successful()) {
                \Log::error('Failed to create shipment', [
                    'status' => $response->status(),
                    'errors' => $data['errors'] ?? [],
                    'body' => $response->body()
                ]);
                
                return response()->json([
                    'success' => false,
                    'errors' => $data['errors'] ?? ['Failed to create shipping label'],
                ], $response->status());
            }

            // ✅ Update order status and save shipment data
            $order = Order::find($validated['order_id']);
            if ($order) {
                $updateData = [
                    'status' => 'processing',
                    'shipping_label_data' => json_encode($data),
                ];
                
                // Extract tracking number and label URL from response
                if (isset($data['tracking_number'])) {
                    $updateData['tracking_number'] = $data['tracking_number'];
                }
                if (isset($data['label_url'])) {
                    $updateData['label_url'] = $data['label_url'];
                }
                
                $order->update($updateData);
            }

            return response()->json([
                'success' => true,
                'shipment' => $data,
            ]);
        } catch (\Throwable $e) {
            \Log::error('BuyLabel exception', [
                'message' => $e->getMessage(),
                'trace' => $e->getTraceAsString()
            ]);
            
            return response()->json([
                'success' => false,
                'errors' => [$e->getMessage()],
            ], 500);
        }
    }
}
