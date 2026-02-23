<?php

require __DIR__.'/vendor/autoload.php';
$app = require_once __DIR__.'/bootstrap/app.php';
$app->make('Illuminate\Contracts\Console\Kernel')->bootstrap();

echo "=== Available Products ===\n\n";

$products = DB::table('products')
    ->whereNull('deleted_at')
    ->select('id', 'name', 'sku', 'price', 'weight', 'weight_unit', 'country_of_origin', 'hs_code')
    ->take(10)
    ->get();

foreach ($products as $product) {
    echo "ID: {$product->id}\n";
    echo "Name: {$product->name}\n";
    echo "SKU: {$product->sku}\n";
    echo "Price: \${$product->price}\n";
    echo "Weight: {$product->weight} {$product->weight_unit}\n";
    echo "Country: {$product->country_of_origin}\n";
    echo "HS Code: {$product->hs_code}\n";
    echo "---\n";
}

echo "\nTotal products: " . $products->count() . "\n";
