<?php

require __DIR__.'/vendor/autoload.php';

$app = require_once __DIR__.'/bootstrap/app.php';
$app->make('Illuminate\Contracts\Console\Kernel')->bootstrap();

use App\Models\Product;
use App\Models\Category;

echo "Checking for products with no catalog and no subcategory...\n\n";

$products = Product::with(['category', 'collection'])->get();

$orphanProducts = [];

foreach ($products as $product) {
    $hasNoCollection = $product->collection->isEmpty();
    $categoryIsParent = $product->category && $product->category->parent_id === null;
    
    if ($hasNoCollection && $categoryIsParent) {
        $orphanProducts[] = $product;
    }
}

echo "Found " . count($orphanProducts) . " products with no catalog and belonging to parent category:\n\n";

foreach ($orphanProducts as $product) {
    echo "ID: " . $product->id . "\n";
    echo "Name: " . $product->name . "\n";
    echo "Category: " . ($product->category ? $product->category->name : 'None') . "\n";
    echo "Status: " . ($product->status ? 'Active' : 'Inactive') . "\n";
    echo "---\n";
}

echo "\nThese products are accessible via Shop All page for their category.\n";
echo "Example: /shop-all/" . ($orphanProducts[0]->category->slug ?? 'category-slug') . "\n";
