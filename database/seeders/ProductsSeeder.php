<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Product;
use App\Models\Category;
use Illuminate\Support\Str;

class ProductsSeeder extends Seeder
{
    public function run()
    {
        $categories = $this->ensureCategories();

        $products = [
            ['name' => 'Gold Plated Bangle Set', 'description' => 'Beautiful set of 4 gold-plated bangles with intricate designs.', 'price' => 89.99, 'compare_price' => 129.99, 'member_price' => 79.99, 'sku' => 'BNG-GOLD-001', 'quantity' => 50, 'images' => ['product-1.png'], 'status' => 1, 'is_featured' => 1, 'is_top_listed' => 1, 'weight' => '0.3', 'weight_unit' => 'lbs', 'country_of_origin' => 'IN', 'hs_code' => '7117907500'],
            ['name' => 'Silver Crystal Bangles', 'description' => 'Elegant silver bangles adorned with sparkling crystals.', 'price' => 69.99, 'compare_price' => 99.99, 'member_price' => 59.99, 'sku' => 'BNG-SILV-002', 'quantity' => 75, 'images' => ['product-2.png'], 'status' => 1, 'is_featured' => 1, 'is_top_listed' => 0, 'weight' => '0.25', 'weight_unit' => 'lbs', 'country_of_origin' => 'IN', 'hs_code' => '7117907500'],
            ['name' => 'Rose Gold Charm Bangles', 'description' => 'Trendy rose gold bangles with removable charms.', 'price' => 79.99, 'compare_price' => 119.99, 'member_price' => 69.99, 'sku' => 'BNG-ROSE-003', 'quantity' => 60, 'images' => ['product-3.png'], 'status' => 1, 'is_featured' => 0, 'is_top_listed' => 1, 'weight' => '0.28', 'weight_unit' => 'lbs', 'country_of_origin' => 'IN', 'hs_code' => '7117907500'],
            ['name' => 'Traditional Kundan Bangles', 'description' => 'Authentic Kundan work bangles with traditional craftsmanship.', 'price' => 149.99, 'compare_price' => 199.99, 'member_price' => 134.99, 'sku' => 'BNG-KUND-004', 'quantity' => 30, 'images' => ['product-4.png'], 'status' => 1, 'is_featured' => 1, 'is_top_listed' => 1, 'weight' => '0.4', 'weight_unit' => 'lbs', 'country_of_origin' => 'IN', 'hs_code' => '7117907500'],
            ['name' => 'Minimalist Steel Bangles', 'description' => 'Modern minimalist design in stainless steel.', 'price' => 39.99, 'compare_price' => 59.99, 'member_price' => 34.99, 'sku' => 'BNG-STEEL-005', 'quantity' => 100, 'images' => ['product-1.png'], 'status' => 1, 'is_featured' => 0, 'is_top_listed' => 0, 'weight' => '0.2', 'weight_unit' => 'lbs', 'country_of_origin' => 'CN', 'hs_code' => '7117907500'],
            ['name' => 'Pearl Embellished Bangles', 'description' => 'Luxurious bangles with genuine freshwater pearls.', 'price' => 129.99, 'compare_price' => 179.99, 'member_price' => 114.99, 'sku' => 'BNG-PEARL-006', 'quantity' => 40, 'images' => ['product-2.png'], 'status' => 1, 'is_featured' => 1, 'is_top_listed' => 0, 'weight' => '0.35', 'weight_unit' => 'lbs', 'country_of_origin' => 'IN', 'hs_code' => '7117907500'],
            ['name' => 'Colorful Enamel Bangles', 'description' => 'Vibrant enamel bangles in rainbow colors.', 'price' => 49.99, 'compare_price' => 69.99, 'member_price' => 44.99, 'sku' => 'BNG-ENAM-007', 'quantity' => 80, 'images' => ['product-3.png'], 'status' => 1, 'is_featured' => 0, 'is_top_listed' => 1, 'weight' => '0.22', 'weight_unit' => 'lbs', 'country_of_origin' => 'IN', 'hs_code' => '7117907500'],
            ['name' => 'Antique Brass Bangles', 'description' => 'Vintage-inspired brass bangles with oxidized finish.', 'price' => 59.99, 'compare_price' => 89.99, 'member_price' => 52.99, 'sku' => 'BNG-BRASS-008', 'quantity' => 55, 'images' => ['product-4.png'], 'status' => 1, 'is_featured' => 0, 'is_top_listed' => 0, 'weight' => '0.32', 'weight_unit' => 'lbs', 'country_of_origin' => 'IN', 'hs_code' => '7117907500'],
            ['name' => 'Diamond Cut Gold Bangles', 'description' => 'Sophisticated diamond-cut pattern gold bangles.', 'price' => 199.99, 'compare_price' => 279.99, 'member_price' => 179.99, 'sku' => 'BNG-DIAM-009', 'quantity' => 25, 'images' => ['product-1.png'], 'status' => 1, 'is_featured' => 1, 'is_top_listed' => 1, 'weight' => '0.45', 'weight_unit' => 'lbs', 'country_of_origin' => 'IN', 'hs_code' => '7117907500'],
            ['name' => 'Wooden Beaded Bangles', 'description' => 'Natural wooden bangles with colorful beads.', 'price' => 29.99, 'compare_price' => 44.99, 'member_price' => 26.99, 'sku' => 'BNG-WOOD-010', 'quantity' => 90, 'images' => ['product-2.png'], 'status' => 1, 'is_featured' => 0, 'is_top_listed' => 0, 'weight' => '0.15', 'weight_unit' => 'lbs', 'country_of_origin' => 'IN', 'hs_code' => '7117907500'],
        ];

        foreach ($products as $data) {
            $data['category_id'] = $categories->random()->id;
            $data['slug'] = Str::slug($data['name']);
            Product::create($data);
        }

        $this->command->info('✅ Created ' . count($products) . ' products!');
    }

    private function ensureCategories()
    {
        $categories = Category::all();
        if ($categories->isEmpty()) {
            $cats = [
                ['name' => 'Gold Bangles', 'slug' => 'gold-bangles', 'status' => 1],
                ['name' => 'Silver Bangles', 'slug' => 'silver-bangles', 'status' => 1],
                ['name' => 'Fashion Bangles', 'slug' => 'fashion-bangles', 'status' => 1],
            ];
            foreach ($cats as $cat) Category::create($cat);
            $categories = Category::all();
        }
        return $categories;
    }
}
