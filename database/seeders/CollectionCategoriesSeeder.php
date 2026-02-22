<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Collection;
use App\Models\Category;
use App\Models\CollectionCategory;

class CollectionCategoriesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Get first collection (or create one if none exists)
        $collection = Collection::first();
        
        if (!$collection) {
            $collection = Collection::create([
                'name' => 'Mother\'s Day Guide',
                'slug' => 'mothers-day-guide',
                'description' => 'Perfect gifts for Mom',
                'status' => 1,
                'images' => ['default.jpg']
            ]);
        }

        // Get parent categories
        $bangles = Category::where('name', 'LIKE', '%Bangle%')->whereNull('parent_id')->first();
        $necklaces = Category::where('name', 'LIKE', '%Necklace%')->whereNull('parent_id')->first();
        $earrings = Category::where('name', 'LIKE', '%Earring%')->whereNull('parent_id')->first();

        // Create sample configurations
        if ($bangles) {
            CollectionCategory::updateOrCreate(
                [
                    'collection_id' => $collection->id,
                    'category_id' => $bangles->id
                ],
                [
                    'title' => 'BANGLES FOR MOM',
                    'description' => 'Beautiful bangles perfect for Mother\'s Day',
                    'display_order' => 1,
                    'status' => 1,
                    'images' => []
                ]
            );
        }

        if ($necklaces) {
            CollectionCategory::updateOrCreate(
                [
                    'collection_id' => $collection->id,
                    'category_id' => $necklaces->id
                ],
                [
                    'title' => 'NECKLACES FOR MOM',
                    'description' => 'Elegant necklaces she\'ll love',
                    'display_order' => 2,
                    'status' => 1,
                    'images' => []
                ]
            );
        }

        if ($earrings) {
            CollectionCategory::updateOrCreate(
                [
                    'collection_id' => $collection->id,
                    'category_id' => $earrings->id
                ],
                [
                    'title' => 'EARRINGS FOR MOM',
                    'description' => 'Stunning earrings for every occasion',
                    'display_order' => 3,
                    'status' => 1,
                    'images' => []
                ]
            );
        }

        $this->command->info('Collection categories seeded successfully!');
    }
}
