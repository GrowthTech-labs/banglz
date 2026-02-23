<?php
/**
 * Test label creation with order 34
 * Run: docker exec banglz_app php test-label-creation.php
 */

require __DIR__ . '/vendor/autoload.php';

$app = require_once __DIR__ . '/bootstrap/app.php';
$app->make('Illuminate\Contracts\Console\Kernel')->bootstrap();

echo "=== TESTING LABEL CREATION ===\n\n";

// Get order 34
$order = DB::table('orders')->where('id', 34)->first();

if (!$order) {
    echo "❌ Order 34 not found\n";
    exit(1);
}

echo "Order ID: {$order->id}\n";
echo "Order Number: {$order->order_id}\n\n";

// Parse products_meta_data
$productsMetaData = json_decode($order->products_meta_data, true);

// Check if it's still a string (double-encoded)
if (is_string($productsMetaData)) {
    $productsMetaData = json_decode($productsMetaData, true);
}

echo "Products Meta Data Structure:\n";
print_r($productsMetaData);
echo "\n";

// Simulate what ShippingController does
$productsList = $productsMetaData['Products'] ?? $productsMetaData ?? [];
$items = [];

foreach ($productsList as $item) {
    echo "Processing item:\n";
    print_r($item);
    echo "\n";
    
    // New format: item has 'product' key with embedded data
    if (isset($item['product'])) {
        $productData = $item['product'];
        $quantity = $item['qty'] ?? $item['quantity'] ?? 1;
        $variation = $item['variation'] ?? null;
        
        echo "Product Data:\n";
        echo "  Name: {$productData['name']}\n";
        echo "  SKU: " . ($productData['sku'] ?? 'N/A') . "\n";
        echo "  Price: {$productData['price']}\n";
        echo "  Weight: " . ($productData['weight'] ?? 'N/A') . "\n";
        echo "  Weight Unit: " . ($productData['weight_unit'] ?? 'N/A') . "\n";
        echo "  Country of Origin: " . ($productData['country_of_origin'] ?? 'N/A') . "\n";
        echo "  HS Code: " . ($productData['hs_code'] ?? 'N/A') . "\n";
        echo "  Quantity: {$quantity}\n";
        
        if ($variation) {
            $items[] = [
                'description' => $productData['name'] . ' - ' . ($variation['size'] ?? ''),
                'sku' => $productData['sku'] ?? '',
                'quantity' => $quantity,
                'value' => $variation['price'] ?? $productData['price'],
                'currency' => 'CAD',
                'country_of_origin' => $productData['country_of_origin'] ?? 'CA',
                'hs_code' => $productData['hs_code'] ?? '7117907500',
            ];
        } else {
            $items[] = [
                'description' => $productData['name'],
                'sku' => $productData['sku'] ?? '',
                'quantity' => $quantity,
                'value' => $productData['price'],
                'currency' => 'CAD',
                'country_of_origin' => $productData['country_of_origin'] ?? 'CA',
                'hs_code' => $productData['hs_code'] ?? '7117907500',
            ];
        }
        echo "\n";
    }
}

echo "=== BUILT ITEMS FOR SHIPMENT ===\n";
echo "Total items: " . count($items) . "\n\n";

foreach ($items as $idx => $item) {
    echo "Item " . ($idx + 1) . ":\n";
    print_r($item);
    echo "\n";
}

if (empty($items)) {
    echo "❌ NO ITEMS BUILT - This would cause the error!\n";
} else {
    echo "✅ Items built successfully - Label creation should work\n";
}
