<?php

require __DIR__.'/vendor/autoload.php';

$app = require_once __DIR__.'/bootstrap/app.php';
$app->make('Illuminate\Contracts\Console\Kernel')->bootstrap();

use App\Models\Collection;
use App\Models\Category;
use App\Models\CollectionCategory;

$collection = Collection::find(12);

if (!$collection) {
    echo "Collection not found\n";
    exit(1);
}

// Add Silver Bangles
$silverBangles = Category::find(56);
if ($silverBangles) {
    CollectionCategory::updateOrCreate(
        [
            'collection_id' => $collection->id,
            'category_id' => $silverBangles->id
        ],
        [
            'title' => 'SILVER BANGLES FOR MOM',
            'description' => 'Elegant silver bangles perfect for any occasion',
            'display_order' => 2,
            'status' => 1,
            'images' => []
        ]
    );
    echo "Added Silver Bangles category\n";
}

// Add Fashion Bangles
$fashionBangles = Category::find(57);
if ($fashionBangles) {
    CollectionCategory::updateOrCreate(
        [
            'collection_id' => $collection->id,
            'category_id' => $fashionBangles->id
        ],
        [
            'title' => 'FASHION BANGLES',
            'description' => 'Trendy fashion bangles to complete any look',
            'display_order' => 3,
            'status' => 1,
            'images' => []
        ]
    );
    echo "Added Fashion Bangles category\n";
}

// Add 4th category as "Most Gifted"
$fourthCategory = Category::find(59);
if ($fourthCategory) {
    CollectionCategory::updateOrCreate(
        [
            'collection_id' => $collection->id,
            'category_id' => $fourthCategory->id
        ],
        [
            'title' => 'THE GIFT GUIDE',
            'description' => 'She does it all and she deserves it all. Find the perfect gift for Mom.',
            'display_order' => 4,
            'status' => 1,
            'images' => []
        ]
    );
    echo "Added Most Gifted category\n";
}

echo "Done! Collection now has " . $collection->collectionCategories()->count() . " categories\n";
