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

        $validated = $request->validate([
            'to_address.name' => 'required|string',
            'to_address.address1' => 'nullable|string',
            'to_address.city' => 'required|string',
            'to_address.postal_code' => 'nullable|string',
            'to_address.country_code' => 'required|string',
            'to_address.province_code' => 'nullable|string',
            'to_address.phone' => 'nullable|string',
            'to_address.email' => 'nullable|email',
            'to_address.is_residential' => 'nullable|boolean',
            'to_address.lat' => 'nullable|numeric',
            'to_address.lng' => 'nullable|numeric',
            'weight' => 'required|numeric',
            'weight_unit' => 'required|string',
            'length' => 'required|numeric|min:0.01',
            'width' => 'required|numeric|min:0.01',
            'height' => 'required|numeric|min:0.01',
            'size_unit' => 'nullable|string|in:cm,in',
            'package_type' => 'required|string',
            'postage_type' => 'required|string',
            'package_contents' => 'nullable|string',
            'items' => 'required|array|min:1',
            'items.*.description' => 'required|string',
            'items.*.quantity' => 'required|integer|min:1',
            'items.*.value' => 'required|numeric|min:0',
            'items.*.currency' => 'required|string|in:USD,CAD',

        ]);
        $validated['package_contents'] = $validated['package_contents'] ?? 'Merchandise';

        // ✅ Always use jewellery defaults
        foreach ($validated['items'] as &$item) {
            $item['country_of_origin'] = 'CA';
            $item['hs_code'] = '7117.90.7500'; // Valid US HTS code for jewelry
            $item['description'] = $item['description'] ?? 'Jewellery';
        }
$provinceCode = $validated['to_address']['province_code'] ?? null;
            //    dd($validated['to_address']);

if (strlen($provinceCode) > 2 && !empty($validated['to_address']['lat']) && !empty($validated['to_address']['lng'])) {
    try {

            $geoResponse = Http::withHeaders([
                'User-Agent' => 'MyLaravelApp/1.0 (tahir@example.com)',
            ])->get('https://nominatim.openstreetmap.org/reverse', [
                'lat' => $validated['to_address']['lat'],
                'lon' => $validated['to_address']['lng'],
                'format' => 'json',
            ]);

            if ($geoResponse->successful()) {
                $geoData = $geoResponse->json();
                $isoCode = $geoData['address']['ISO3166-2-lvl4'] ?? null;
                // dd($isoCode);
                // ✅ Extract last 2 letters if code is valid (e.g. "PK-SD" → "SD")
                if (!empty($isoCode) && strlen($isoCode) > 2) {
                    $parts = explode('-', $isoCode);
                    $provinceCode = strtoupper(end($parts)); // e.g. "SD"
                }
            }
        } catch (\Throwable $e) {
            // just skip if lookup fails
        }
    }
        // ✅ Build payload

        $payload = [
            'to_address' => [
                'name' => $validated['to_address']['name'],
                // 'address1' => $validated['to_address']['address1'],
                'city' => $validated['to_address']['city'],
                'province_code' => $provinceCode ?? null,
                'postal_code' => $validated['to_address']['postal_code'] ?? null,
                'country_code' => $validated['to_address']['country_code'],
                'phone' => $validated['to_address']['phone'] ?? '0000000000',
                'email' => $validated['to_address']['email'] ?? 'no-reply@banglez.ca',
                'is_residential' => true,
            ],
            'weight_unit' => $validated['weight_unit'],
            'weight' => (float) $validated['weight'],
            'length' => (float) $validated['length'],
            'width' => (float) $validated['width'],
            'height' => (float) $validated['height'],
            'size_unit' => $validated['size_unit'] ?? 'cm',
            'package_type' => $validated['package_type'],
            'package_contents' => $validated['package_contents'] ?? 'Jewellery',
            'items' => $validated['items'],
            'postage_type' => $validated['postage_type'],
        ];
        // dd($payload);
        // ✅ Stallion Production URL
        $base = rtrim(config('services.stallion.base_url', 'https://ship.stallionexpress.ca/api/v4'), '/');
        $token = config('services.stallion.api_token');

        try {
            $response = Http::withHeaders([
                'Authorization' => 'Bearer ' . $token,
                'Accept' => 'application/json',
                'Content-Type' => 'application/json',
                'Idempotency-Key' => uniqid('label_', true),
            ])->retry(3, 5000)
                ->post($base . '/shipments', $payload);

            $data = $response->json();

            if (!$response->successful()) {
                return response()->json([
                    'success' => false,
                    'errors' => $data['errors'] ?? ['Failed to create label'],
                ], $response->status());
            }
$order=Order::where('id','=',$request['order_id'])->first();
            $order->update([
                'status' => 'processing',
            ]);
            return response()->json([
                'success' => true,
                'shipment' => $data,
            ]);
        } catch (\Throwable $e) {
            return response()->json([
                'success' => false,
                'errors' => [$e->getMessage()],
            ], 500);
        }
    }
}
