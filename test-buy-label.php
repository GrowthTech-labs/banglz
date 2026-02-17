<?php
// Test Buy Label endpoint
// Run: docker exec banglz_app php test-buy-label.php

require __DIR__ . '/vendor/autoload.php';

$app = require_once __DIR__ . '/bootstrap/app.php';
$kernel = $app->make('Illuminate\Contracts\Http\Kernel');

$payload = [
    'order_id' => 21,
    'to_address' => [
        'name' => 'John Smith',
        'company' => null,
        'address1' => '123 Main Street',
        'address2' => 'Apt 4B',
        'city' => 'New York',
        'province_code' => 'NY',
        'postal_code' => '10001',
        'country_code' => 'US',
        'phone' => '+1-555-123-4567',
        'email' => 'john.smith@example.com',
        'is_residential' => true,
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
    'postage_type' => 'PostNL International Packet Tracked',
    'signature_confirmation' => false,
    'insured' => false,
    'label_format' => 'pdf',
    'is_draft' => false,
];

echo "📤 Testing Buy Label endpoint\n";
echo "Payload:\n";
echo json_encode($payload, JSON_PRETTY_PRINT) . "\n\n";

$request = Illuminate\Http\Request::create(
    '/admin/buy/shipping/rates',
    'POST',
    $payload,
    [],
    [],
    ['CONTENT_TYPE' => 'application/json']
);

try {
    $response = $kernel->handle($request);
    
    echo "HTTP Status: " . $response->getStatusCode() . "\n";
    echo "Response:\n";
    $content = $response->getContent();
    
    $data = json_decode($content, true);
    if ($data) {
        echo json_encode($data, JSON_PRETTY_PRINT) . "\n";
    } else {
        echo $content . "\n";
    }
    
    $kernel->terminate($request, $response);
} catch (\Exception $e) {
    echo "❌ Exception: " . $e->getMessage() . "\n";
    echo "Trace:\n" . $e->getTraceAsString() . "\n";
}
