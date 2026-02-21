<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Tag;
use App\Models\Collection;
use Illuminate\Support\Str;

class TagsAndCollectionsSeeder extends Seeder
{
    public function run()
    {
        // Create Materials (type = 'material')
        $materials = [
            ['name' => 'Gold', 'description' => 'Gold plated or gold-toned jewelry'],
            ['name' => 'Silver', 'description' => 'Silver plated or sterling silver jewelry'],
            ['name' => 'Rose Gold', 'description' => 'Rose gold plated jewelry'],
            ['name' => 'Brass', 'description' => 'Brass metal jewelry'],
            ['name' => 'Stainless Steel', 'description' => 'Stainless steel jewelry'],
            ['name' => 'Wood', 'description' => 'Wooden bangles and jewelry'],
            ['name' => 'Acrylic', 'description' => 'Acrylic and plastic jewelry'],
            ['name' => 'Enamel', 'description' => 'Enamel coated jewelry'],
            ['name' => 'Pearl', 'description' => 'Pearl embellished jewelry'],
            ['name' => 'Crystal', 'description' => 'Crystal and rhinestone jewelry'],
        ];

        foreach ($materials as $material) {
            Tag::create([
                'name' => $material['name'],
                'slug' => Str::slug($material['name'] . '-' . uniqid()),
                'type' => 'material',
                'description' => $material['description'],
                'status' => 1,
                'top_listed' => 0,
            ]);
        }

        // Create Styles (type = 'style')
        $styles = [
            ['name' => 'Traditional', 'description' => 'Traditional and ethnic designs'],
            ['name' => 'Modern', 'description' => 'Contemporary and modern styles'],
            ['name' => 'Minimalist', 'description' => 'Simple and minimalist designs'],
            ['name' => 'Bohemian', 'description' => 'Boho and free-spirited styles'],
            ['name' => 'Vintage', 'description' => 'Vintage and antique inspired'],
            ['name' => 'Bridal', 'description' => 'Wedding and bridal jewelry'],
            ['name' => 'Casual', 'description' => 'Everyday casual wear'],
            ['name' => 'Party Wear', 'description' => 'Party and occasion wear'],
            ['name' => 'Elegant', 'description' => 'Elegant and sophisticated'],
            ['name' => 'Statement', 'description' => 'Bold statement pieces'],
        ];

        foreach ($styles as $style) {
            Tag::create([
                'name' => $style['name'],
                'slug' => Str::slug($style['name'] . '-' . uniqid()),
                'type' => 'style',
                'description' => $style['description'],
                'status' => 1,
                'top_listed' => 0,
            ]);
        }

        // Create Collections
        $collections = [
            ['name' => 'New Arrivals', 'description' => 'Latest products added to our collection'],
            ['name' => 'Best Sellers', 'description' => 'Our most popular products'],
            ['name' => 'Summer Collection', 'description' => 'Bright and colorful summer jewelry'],
            ['name' => 'Winter Collection', 'description' => 'Elegant winter jewelry pieces'],
            ['name' => 'Wedding Collection', 'description' => 'Perfect for weddings and special occasions'],
            ['name' => 'Everyday Essentials', 'description' => 'Simple pieces for daily wear'],
            ['name' => 'Gift Sets', 'description' => 'Perfect gift sets for loved ones'],
            ['name' => 'Clearance Sale', 'description' => 'Discounted items - limited stock'],
        ];

        foreach ($collections as $collection) {
            Collection::create([
                'name' => $collection['name'],
                'slug' => Str::slug($collection['name'] . '-' . uniqid()),
                'description' => $collection['description'],
                'status' => 1,
                'images' => json_encode([]),
            ]);
        }

        $this->command->info('✅ Created ' . count($materials) . ' materials');
        $this->command->info('✅ Created ' . count($styles) . ' styles');
        $this->command->info('✅ Created ' . count($collections) . ' collections');
    }
}
