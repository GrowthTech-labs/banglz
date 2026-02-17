<?php
// Run this with: docker exec banglz_app php create_test_orders.php

require __DIR__ . '/vendor/autoload.php';

$app = require_once __DIR__ . '/bootstrap/app.php';
$app->make('Illuminate\Contracts\Console\Kernel')->bootstrap();

use App\Models\Order;
use App\Models\User;

// Get admin user
$user = User::where('email', 'admin@admin.com')->first();

if (!$user) {
    echo "❌ Admin user not found!\n";
    exit(1);
}

echo "✅ Found admin user: {$user->email}\n";

// Test Order 1 - US Address
$order1 = Order::create([
    'user_id' => $user->id,
    'session_id' => 'test_session_' . uniqid(),
    'products_meta_data' => json_encode([
        'Products' => [
            [
                'product' => [
                    'id' => 1,
                    'name' => 'Gold Bangle Set',
                    'sku' => 'BGL-001',
                    'price' => 89.99,
                    'images' => ['product-1.png'],
                    'weight' => 45.5,
                    'weight_unit' => 'g',
                ],
                'qty' => 2,
                'quantity' => 2,
                'weight' => 45.5,
                'weight_unit' => 'g',
            ],
        ],
    ]),
    'delivery_meta_data' => json_encode([
        'name' => 'John Smith',
        'address' => '123 Main Street',
        'address1' => '123 Main Street',
        'address2' => 'Apt 4B',
        'street' => '123 Main Street, Apt 4B',
        'city' => 'New York',
        'state_province' => 'New York',
        'province_code' => 'NY',
        'postal_code' => '10001',
        'country' => 'United States',
        'country_iso' => 'US',
        'phone' => '+1-555-123-4567',
        'email' => 'john.smith@example.com',
    ]),
    'user_meta_data' => json_encode([
        'name' => 'John Smith',
        'email' => 'john.smith@example.com',
        'phone' => '+1-555-123-4567',
    ]),
    'sub_total' => 179.98,
    'tax' => 16.20,
    'shipping_fee' => 15.00,
    'total_amount' => 211.18,
    'status' => 'pending',
    'payment_status' => 'paid',
    'email' => 'john.smith@example.com',
]);

echo "✅ Created Order 1: {$order1->order_id} - New York, US\n";

// Test Order 2 - Canadian Address
$order2 = Order::create([
    'user_id' => $user->id,
    'session_id' => 'test_session_' . uniqid(),
    'products_meta_data' => json_encode([
        'Products' => [
            [
                'product' => [
                    'id' => 3,
                    'name' => 'Diamond Earrings',
                    'sku' => 'EAR-003',
                    'price' => 199.99,
                    'images' => ['product-2.png'],
                    'weight' => 12.5,
                    'weight_unit' => 'g',
                ],
                'qty' => 1,
                'quantity' => 1,
                'weight' => 12.5,
                'weight_unit' => 'g',
            ],
        ],
    ]),
    'delivery_meta_data' => json_encode([
        'name' => 'Sarah Johnson',
        'address' => '456 Queen Street West',
        'address1' => '456 Queen Street West',
        'address2' => '',
        'street' => '456 Queen Street West',
        'city' => 'Toronto',
        'state_province' => 'Ontario',
        'province_code' => 'ON',
        'postal_code' => 'M5V 2A8',
        'country' => 'Canada',
        'country_iso' => 'CA',
        'phone' => '+1-416-555-7890',
        'email' => 'sarah.johnson@example.com',
    ]),
    'user_meta_data' => json_encode([
        'name' => 'Sarah Johnson',
        'email' => 'sarah.johnson@example.com',
        'phone' => '+1-416-555-7890',
    ]),
    'sub_total' => 199.99,
    'tax' => 26.00,
    'shipping_fee' => 12.00,
    'total_amount' => 237.99,
    'status' => 'pending',
    'payment_status' => 'paid',
    'email' => 'sarah.johnson@example.com',
]);

echo "✅ Created Order 2: {$order2->order_id} - Toronto, CA\n";

// Test Order 3 - UK Address
$order3 = Order::create([
    'user_id' => $user->id,
    'session_id' => 'test_session_' . uniqid(),
    'products_meta_data' => json_encode([
        'Products' => [
            [
                'product' => [
                    'id' => 4,
                    'name' => 'Pearl Bracelet',
                    'sku' => 'BRC-004',
                    'price' => 149.99,
                    'images' => ['product-3.png'],
                    'weight' => 28.0,
                    'weight_unit' => 'g',
                ],
                'qty' => 1,
                'quantity' => 1,
                'weight' => 28.0,
                'weight_unit' => 'g',
            ],
        ],
    ]),
    'delivery_meta_data' => json_encode([
        'name' => 'Emma Wilson',
        'address' => '10 Downing Street',
        'address1' => '10 Downing Street',
        'address2' => '',
        'street' => '10 Downing Street',
        'city' => 'London',
        'state_province' => 'London',
        'province_code' => 'LND',
        'postal_code' => 'SW1A 2AA',
        'country' => 'United Kingdom',
        'country_iso' => 'GB',
        'phone' => '+44-20-7946-0958',
        'email' => 'emma.wilson@example.com',
    ]),
    'user_meta_data' => json_encode([
        'name' => 'Emma Wilson',
        'email' => 'emma.wilson@example.com',
        'phone' => '+44-20-7946-0958',
    ]),
    'sub_total' => 149.99,
    'tax' => 0.00,
    'shipping_fee' => 35.00,
    'total_amount' => 184.99,
    'status' => 'pending',
    'payment_status' => 'paid',
    'email' => 'emma.wilson@example.com',
]);

echo "✅ Created Order 3: {$order3->order_id} - London, GB\n";

// Test Order 4 - California
$order4 = Order::create([
    'user_id' => $user->id,
    'session_id' => 'test_session_' . uniqid(),
    'products_meta_data' => json_encode([
        'Products' => [
            [
                'product' => [
                    'id' => 6,
                    'name' => 'Ruby Pendant',
                    'sku' => 'PND-006',
                    'price' => 179.99,
                    'images' => ['product-4.png'],
                    'weight' => 15.0,
                    'weight_unit' => 'g',
                ],
                'qty' => 1,
                'quantity' => 1,
                'weight' => 15.0,
                'weight_unit' => 'g',
            ],
        ],
    ]),
    'delivery_meta_data' => json_encode([
        'name' => 'Michael Chen',
        'address' => '789 Market Street',
        'address1' => '789 Market Street',
        'address2' => 'Suite 200',
        'street' => '789 Market Street, Suite 200',
        'city' => 'San Francisco',
        'state_province' => 'California',
        'province_code' => 'CA',
        'postal_code' => '94103',
        'country' => 'United States',
        'country_iso' => 'US',
        'phone' => '+1-415-555-9876',
        'email' => 'michael.chen@example.com',
    ]),
    'user_meta_data' => json_encode([
        'name' => 'Michael Chen',
        'email' => 'michael.chen@example.com',
        'phone' => '+1-415-555-9876',
    ]),
    'sub_total' => 179.99,
    'tax' => 16.20,
    'shipping_fee' => 12.00,
    'total_amount' => 208.19,
    'status' => 'pending',
    'payment_status' => 'paid',
    'email' => 'michael.chen@example.com',
]);

echo "✅ Created Order 4: {$order4->order_id} - San Francisco, US\n";

echo "\n🎉 Successfully created 4 test orders!\n";
echo "📦 All orders have status 'pending' - Create Label button will appear\n";
echo "\n🔗 Go to: http://localhost:8000/admin/orders\n";
