<?php

require __DIR__.'/vendor/autoload.php';

$app = require_once __DIR__.'/bootstrap/app.php';
$app->make('Illuminate\Contracts\Console\Kernel')->bootstrap();

use App\Models\Collection;
use App\Models\Product;
use App\Models\CollectionProduct;

$collection = Collection::find(12);

if (!$collection) {
    echo "Collection not found\n";
    exit(1);
}

$products = Product::where('status', 1)->take(8)->get();

foreach ($products as $product) {
    CollectionProduct::firstOrCreate([
        'collection_id' => $collection->id,
        'product_id' => $product->id
    ]);
}

echo "Linked " . $products->count() . " products to collection: " . $collection->name . "\n";
