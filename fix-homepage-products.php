<?php
/**
 * Fix homepage products by setting categories as top listed
 * Run: docker exec banglz_app php fix-homepage-products.php
 */

require __DIR__ . '/vendor/autoload.php';

$app = require_once __DIR__ . '/bootstrap/app.php';
$app->make('Illuminate\Contracts\Console\Kernel')->bootstrap();

echo "=== FIXING HOMEPAGE PRODUCTS ===\n\n";

// Get all categories that have products but are not top listed
$categoriesWithProducts = DB::table('products')
    ->join('categories', 'products.category_id', '=', 'categories.id')
    ->where('products.status', 1)
    ->where('categories.top_listed', 0)
    ->whereNull('categories.parent_id') // Only parent categories
    ->select('categories.id', 'categories.name', DB::raw('COUNT(products.id) as product_count'))
    ->groupBy('categories.id', 'categories.name')
    ->get();

if ($categoriesWithProducts->count() > 0) {
    echo "Found " . $categoriesWithProducts->count() . " categories with products that are not top listed:\n\n";
    
    foreach ($categoriesWithProducts as $cat) {
        echo "Setting '{$cat->name}' (ID: {$cat->id}) as top listed ({$cat->product_count} products)\n";
        DB::table('categories')
            ->where('id', $cat->id)
            ->update(['top_listed' => 1]);
    }
    
    echo "\n✅ Categories updated successfully!\n";
} else {
    echo "No categories need updating.\n";
}

echo "\n=== CURRENT TOP LISTED CATEGORIES ===\n";
$topCategories = DB::table('categories')
    ->where('top_listed', 1)
    ->whereNull('parent_id')
    ->get(['id', 'name']);

foreach ($topCategories as $cat) {
    $productCount = DB::table('products')
        ->where('category_id', $cat->id)
        ->where('status', 1)
        ->count();
    echo "  - {$cat->name} (ID: {$cat->id}): {$productCount} products\n";
}

echo "\n✅ Done! Products should now appear on the homepage.\n";
