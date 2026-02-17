<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Order;
use App\Models\User;
use Illuminate\Support\Facades\DB;

class TestOrdersSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Get admin user or create one if doesn't exist
        $user = User::where('email', 'admin@admin.com')->first();
        
        if (!$user) {
            $user = User::create([
                'name' => 'Admin User',
                'email' => 'admin@admin.com',
                'password' => bcrypt('admin'),
                'type' => 'admin',
            ]);
        }

        // Sample products metadata
        $productsMetaData = [
            [
                'id' => 1,
                'name' => 'Gold Bangle Set',
                'sku' => 'BGL-001',
                'price' => 89.99,
                'quantity' => 2,
                'image' => 'gold-bangle.jpg',
                'weight' => 45.5, // grams
            ],
            [
                'id' => 2,
                'name' => 'Silver Necklace',
                'sku' => 'NCK-002',
                'price' => 129.99,
                'quantity' => 1,
                'image' => 'silver-necklace.jpg',
                'weight' => 32.0, // grams
            ],
        ];

        // Test Order 1 - US Address
        Order::create([
            'user_id' => $user->id,
            'session_id' => 'test_session_' . uniqid(),
            'products_meta_data' => json_encode($productsMetaData),
            'delivery_meta_data' => json_encode([
                'name' => 'John Smith',
                'address1' => '123 Main Street',
                'address2' => 'Apt 4B',
                'city' => 'New York',
                'province_code' => 'NY',
                'postal_code' => '10001',
                'country_code' => 'US',
                'phone' => '+1-555-123-4567',
                'email' => 'john.smith@example.com',
            ]),
            'user_meta_data' => json_encode([
                'name' => 'John Smith',
                'email' => 'john.smith@example.com',
                'phone' => '+1-555-123-4567',
            ]),
            'sub_total' => 209.97,
            'tax' => 18.90,
            'shipping_fee' => 15.00,
            'total_amount' => 243.87,
            'status' => 'pending',
            'payment_status' => 'paid',
            'email' => 'john.smith@example.com',
        ]);

        // Test Order 2 - Canadian Address
        Order::create([
            'user_id' => $user->id,
            'session_id' => 'test_session_' . uniqid(),
            'products_meta_data' => json_encode([
                [
                    'id' => 3,
                    'name' => 'Diamond Earrings',
                    'sku' => 'EAR-003',
                    'price' => 199.99,
                    'quantity' => 1,
                    'image' => 'diamond-earrings.jpg',
                    'weight' => 12.5,
                ],
            ]),
            'delivery_meta_data' => json_encode([
                'name' => 'Sarah Johnson',
                'address1' => '456 Queen Street West',
                'address2' => '',
                'city' => 'Toronto',
                'province_code' => 'ON',
                'postal_code' => 'M5V 2A8',
                'country_code' => 'CA',
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

        // Test Order 3 - UK Address (International)
        Order::create([
            'user_id' => $user->id,
            'session_id' => 'test_session_' . uniqid(),
            'products_meta_data' => json_encode([
                [
                    'id' => 4,
                    'name' => 'Pearl Bracelet',
                    'sku' => 'BRC-004',
                    'price' => 149.99,
                    'quantity' => 1,
                    'image' => 'pearl-bracelet.jpg',
                    'weight' => 28.0,
                ],
                [
                    'id' => 5,
                    'name' => 'Gold Ring',
                    'sku' => 'RNG-005',
                    'price' => 299.99,
                    'quantity' => 1,
                    'image' => 'gold-ring.jpg',
                    'weight' => 8.5,
                ],
            ]),
            'delivery_meta_data' => json_encode([
                'name' => 'Emma Wilson',
                'address1' => '10 Downing Street',
                'address2' => '',
                'city' => 'London',
                'province_code' => 'LND',
                'postal_code' => 'SW1A 2AA',
                'country_code' => 'GB',
                'phone' => '+44-20-7946-0958',
                'email' => 'emma.wilson@example.com',
            ]),
            'user_meta_data' => json_encode([
                'name' => 'Emma Wilson',
                'email' => 'emma.wilson@example.com',
                'phone' => '+44-20-7946-0958',
            ]),
            'sub_total' => 449.98,
            'tax' => 0.00, // International - no local tax
            'shipping_fee' => 35.00,
            'total_amount' => 484.98,
            'status' => 'pending',
            'payment_status' => 'paid',
            'email' => 'emma.wilson@example.com',
        ]);

        // Test Order 4 - California Address (for testing different US state)
        Order::create([
            'user_id' => $user->id,
            'session_id' => 'test_session_' . uniqid(),
            'products_meta_data' => json_encode([
                [
                    'id' => 6,
                    'name' => 'Ruby Pendant',
                    'sku' => 'PND-006',
                    'price' => 179.99,
                    'quantity' => 1,
                    'image' => 'ruby-pendant.jpg',
                    'weight' => 15.0,
                ],
            ]),
            'delivery_meta_data' => json_encode([
                'name' => 'Michael Chen',
                'address1' => '789 Market Street',
                'address2' => 'Suite 200',
                'city' => 'San Francisco',
                'province_code' => 'CA',
                'postal_code' => '94103',
                'country_code' => 'US',
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

        // Test Order 5 - Already Processing (to show button doesn't appear)
        Order::create([
            'user_id' => $user->id,
            'session_id' => 'test_session_' . uniqid(),
            'products_meta_data' => json_encode([
                [
                    'id' => 7,
                    'name' => 'Sapphire Ring',
                    'sku' => 'RNG-007',
                    'price' => 399.99,
                    'quantity' => 1,
                    'image' => 'sapphire-ring.jpg',
                    'weight' => 10.0,
                ],
            ]),
            'delivery_meta_data' => json_encode([
                'name' => 'Lisa Anderson',
                'address1' => '321 Oak Avenue',
                'address2' => '',
                'city' => 'Chicago',
                'province_code' => 'IL',
                'postal_code' => '60601',
                'country_code' => 'US',
                'phone' => '+1-312-555-4321',
                'email' => 'lisa.anderson@example.com',
            ]),
            'user_meta_data' => json_encode([
                'name' => 'Lisa Anderson',
                'email' => 'lisa.anderson@example.com',
                'phone' => '+1-312-555-4321',
            ]),
            'sub_total' => 399.99,
            'tax' => 36.00,
            'shipping_fee' => 15.00,
            'total_amount' => 450.99,
            'status' => 'processing', // This one won't show "Create Label" button
            'payment_status' => 'paid',
            'email' => 'lisa.anderson@example.com',
        ]);

        $this->command->info('✅ Created 5 test orders successfully!');
        $this->command->info('📦 Orders 1-4 have status "pending" - Create Label button will appear');
        $this->command->info('🚫 Order 5 has status "processing" - Create Label button will NOT appear');
    }
}
