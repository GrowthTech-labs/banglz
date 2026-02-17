<?php
// Test the Laravel shipping endpoint
// Run: docker exec banglz_app php test-laravel-endpoint.php

require __DIR__ . '/vendor/autoload.php';

$app = require_once __DIR__ . '/bootstrap/app.php';
$kernel = $app->make('Illuminate\Contracts\Http\Kernel');

// Create a test request
$request = Illuminate\Http\Request::create(
    '/admin/shipping/rates',
    'POST',
    [
        'to_address' => [
            'name' => 'John Smith',
            'address1' => '123 Main Street',
            'city' => 'New York',
            'province_code' => 'NY',
            'postal_code' => '10001',
            'country_code' => 'US',
            'phone' => '+1-555-123-4567',
            'email' => 'john.smith@example.com',
        ],
        'weight_unit' => 'lbs',
        'weight' => 0.1,
        'length' => 9,
        'width' => 12,
        'height' => 1,
        'size_unit' => 'cm',
        'items' => [
            [
                'description' => 'Gold Bangle Set',
                'sku' => 'BGL-001',
                'quantity' => 2,
                'value' => 89.99,
                'currency' => 'CAD',
                'country_of_origin' => 'CA',
                'hs_code' => '7117.90.7500',
            ],
        ],
        'package_type' => 'Parcel',
    ],
    [],
    [],
    ['CONTENT_TYPE' => 'application/json']
);

echo "📤 Testing Laravel endpoint: /admin/shipping/rates\n\n";

try {
    $response = $kernel->handle($request);
    
    echo "HTTP Status: " . $response->getStatusCode() . "\n";
    echo "Response:\n";
    echo $response->getContent() . "\n";
    
    $data = json_decode($response->getContent(), true);
    
    if (isset($data['success']) && $data['success']) {
        echo "\n✅ SUCCESS! Found " . count($data['rates'] ?? []) . " rates\n";
        if (!empty($data['rates'])) {
            echo "\nFirst rate:\n";
            echo "  - Service: " . $data['rates'][0]['postage_type'] . "\n";
            echo "  - Price: " . $data['rates'][0]['total'] . " " . $data['rates'][0]['currency'] . "\n";
            echo "  - Delivery: " . ($data['rates'][0]['delivery_days'] ?? 'N/A') . " days\n";
        }
    } else {
        echo "\n❌ FAILED\n";
        if (isset($data['errors'])) {
            echo "Errors:\n";
            print_r($data['errors']);
        }
    }
    
    $kernel->terminate($request, $response);
} catch (\Exception $e) {
    echo "❌ Exception: " . $e->getMessage() . "\n";
    echo "Trace:\n" . $e->getTraceAsString() . "\n";
}
