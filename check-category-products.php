<?php

require __DIR__.'/vendor/autoload.php';
$app = require_once __DIR__.'/bootstrap/app.php';
$app->make('Illuminate\Contracts\Console\Kernel')->bootstrap();

echo "=== Checking Category Products ===\n\n";

// Find parent category
$parent = DB::table('categories')->where('slug', 'like', '%category-test-1%')->first();
echo "Parent Category:\n";
echo "ID: {$parent->id}, Name: {$parent->name}\n\n";

// Find child categories
$children = DB::table('categories')->where('parent_id', $parent->id)->get();
echo "Child Categories:\n";
foreach($children as $child) {
    echo "ID: {$child->id}, Name: {$child->name}, Slug: {$child->slug}\n";
}

// Get all category IDs (parent + children)
$categoryIds = $children->pluck('id')->push($parent->id);
echo "\nAll Category IDs: " . $categoryIds->implode(', ') . "\n\n";

// Products in parent category
echo "Products directly in Parent Category ({$parent->id}):\n";
$parentProducts = DB::table('products')
    ->where('category_id', $parent->id)
    ->whereNull('deleted_at')
    ->get(['id', 'name', 'category_id']);
echo "Count: " . $parentProducts->count() . "\n";
foreach($parentProducts as $p) {
    echo "  - ID: {$p->id}, Name: {$p->name}\n";
}

// Products in child categories
echo "\nProducts in Child Categories:\n";
foreach($children as $child) {
    $childProducts = DB::table('products')
        ->where('category_id', $child->id)
        ->whereNull('deleted_at')
        ->get(['id', 'name', 'category_id']);
    echo "{$child->name} (ID: {$child->id}): {$childProducts->count()} products\n";
    foreach($childProducts as $p) {
        echo "  - ID: {$p->id}, Name: {$p->name}\n";
    }
}

// Total products in all categories
echo "\nTotal Products in Parent + Children:\n";
$allProducts = DB::table('products')
    ->whereIn('category_id', $categoryIds)
    ->whereNull('deleted_at')
    ->get(['id', 'name', 'category_id']);
echo "Count: " . $allProducts->count() . "\n";
foreach($allProducts as $p) {
    echo "  - ID: {$p->id}, Name: {$p->name}, Category: {$p->category_id}\n";
}
