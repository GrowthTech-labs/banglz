<?php
// Check order data structure
// Run: docker exec banglz_app php check-order-data.php

require __DIR__ . '/vendor/autoload.php';

$app = require_once __DIR__ . '/bootstrap/app.php';
$app->make('Illuminate\Contracts\Console\Kernel')->bootstrap();

use App\Models\Order;

$order = Order::where('order_id', 'ORD-0021')->first();

if (!$order) {
    echo "❌ Order not found\n";
    exit(1);
}

echo "Order ID: {$order->order_id}\n";
echo "Status: {$order->status}\n\n";

echo "Products Meta Data:\n";
$products = json_decode($order->products_meta_data, true);
echo json_encode($products, JSON_PRETTY_PRINT) . "\n\n";

echo "Delivery Meta Data:\n";
$delivery = json_decode($order->delivery_meta_data, true);
echo json_encode($delivery, JSON_PRETTY_PRINT) . "\n";
