<?php
/**
 * Check why products are not showing on homepage
 * Run: docker exec banglz_app php check-homepage-products.php
 */

require __DIR__ . '/vendor/autoload.php';

$app = require_once __DIR__ . '/bootstrap/app.php';
$app->make('Illuminate\Contracts\Console\Kernel')->bootstrap();

echo "=== HOMEPAGE PRODUCTS DEBUG ===\n\n";

// 1. Check total products
$totalProducts = DB::table('products')->count();
$activeProducts = DB::table('products')->where('status', 1)->count();
echo "Total Products: {$totalProducts}\n";
echo "Active Products (status=1): {$activeProducts}\n\n";

// 2. Check top listed categories
$topCategories = DB::table('categories')
    ->where('top_listed', 1)
    ->select('id', 'name', 'slug')
    ->get();

echo "Top Listed Categories (top_listed=1): " . $topCategories->count() . "\n";
foreach ($topCategories as $cat) {
    $productCount = DB::table('products')
        ->where('category_id', $cat->id)
        ->where('status', 1)
        ->count();
    echo "  - {$cat->name} (ID: {$cat->id}): {$productCount} active products\n";
}
echo "\n";

// 3. Check top listed tags
$topTags = DB::table('tags')
    ->where('top_listed', 1)
    ->select('id', 'name', 'slug', 'type')
    ->get();

echo "Top Listed Tags (top_listed=1): " . $topTags->count() . "\n";
foreach ($topTags as $tag) {
    $productCount = DB::table('product_tags')
        ->join('products', 'product_tags.product_id', '=', 'products.id')
        ->where('product_tags.tag_id', $tag->id)
        ->where('products.status', 1)
        ->count();
    echo "  - {$tag->name} ({$tag->type}) (ID: {$tag->id}): {$productCount} active products\n";
}
echo "\n";

// 4. Show recent products and their details
echo "Recent Products (last 5):\n";
$recentProducts = DB::table('products')
    ->orderBy('id', 'desc')
    ->limit(5)
    ->get(['id', 'name', 'status', 'category_id', 'slug']);

foreach ($recentProducts as $product) {
    $category = DB::table('categories')->where('id', $product->category_id)->first();
    $categoryName = $category ? $category->name : 'No Category';
    $categoryTopListed = $category ? $category->top_listed : 0;
    
    $tags = DB::table('product_tags')
        ->join('tags', 'product_tags.tag_id', '=', 'tags.id')
        ->where('product_tags.product_id', $product->id)
        ->get(['tags.name', 'tags.top_listed']);
    
    echo "  Product ID {$product->id}: {$product->name}\n";
    echo "    Status: " . ($product->status ? 'Active' : 'Inactive') . "\n";
    echo "    Category: {$categoryName} (top_listed: {$categoryTopListed})\n";
    echo "    Tags: " . ($tags->count() > 0 ? $tags->pluck('name')->implode(', ') : 'None') . "\n";
    echo "    Tags top_listed: " . ($tags->count() > 0 ? $tags->pluck('top_listed')->implode(', ') : 'N/A') . "\n";
    echo "\n";
}

echo "\n=== SOLUTION ===\n";
echo "For products to show on homepage, you need to:\n";
echo "1. Ensure products have status = 1 (Active)\n";
echo "2. Set their category's top_listed = 1, OR\n";
echo "3. Assign tags (materials/styles) with top_listed = 1 to the products\n\n";

echo "Quick fix commands:\n";
echo "- Set a category as top listed: UPDATE categories SET top_listed = 1 WHERE id = X;\n";
echo "- Set a tag as top listed: UPDATE tags SET top_listed = 1 WHERE id = X;\n";
echo "- Activate a product: UPDATE products SET status = 1 WHERE id = X;\n";
