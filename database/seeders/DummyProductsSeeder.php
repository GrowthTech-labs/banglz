<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Product;
use App\Models\Category;
use Illuminate\Support\Str;

class DummyProductsSeeder extends Seeder
{
    public function run()
    {
        // First, ensure we have categories
        $categories = $this->ensureCategories();

        // Create dummy products
        $products = [
            [
                'name' => 'Gold Plated Bangle Set',
                'description' => 'Beautiful set of 4 gold-plated bangles with intricate designs. Perfect for special occasions and daily wear.',
                'price' => 89.99,
                'compare_price' => 129.99,
                'member_price' => 79.99,
                'sku' => 'BNG-GOLD-001',
                'quantity' => 50,
                'images' => ['product-1.png'],
                'status' => 1,
                'is_featured' => 1,
                'is_top_listed' => 1,
                'care' => 'Wipe with soft cloth. Avoid water and chemicals.',
                'sustainability' => 'Made with recycled metals',
                'shipping' => 'Free shipping on orders over $50',
                'returns' => '30-day return policy',
                'weight' => '0.3',
                'weight_unit' => 'lbs',
                'country_of_origin' => 'IN',
                'hs_code' => '7117.90.7500',
            ],
            [
                'name' => 'Silver Crystal Bangles',
                'description' => 'Elegant silver bangles adorned with sparkling crystals. Set of 6 bangles in various sizes.',
                'price' => 69.99,
                'compare_price' => 99.99,
                'member_price' => 59.99,
                'sku' => 'BNG-SILV-002',
                'quantity' => 75,
                'images' => ['product-2.png'],
                'status' => 1,
                'is_featured' => 1,
                'is_top_listed' => 0,
                'care' => 'Clean with jewelry cleaner. Store in dry place.',
                'sustainability' => 'Ethically sourced materials',
                'shipping' => 'Standard shipping available',
                'returns' => '30-day return policy',
                'weight' => '0.25',
                'weight_unit' => 'lbs',
                'country_of_origin' => 'IN',
                'hs_code' => '7117.90.7500',
            ],
