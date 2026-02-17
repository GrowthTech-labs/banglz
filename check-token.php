<?php
require 'vendor/autoload.php';
$app = require 'bootstrap/app.php';
$app->make('Illuminate\Contracts\Console\Kernel')->bootstrap();

echo "Token from config: " . config('services.stallion.api_token') . "\n";
echo "Token length: " . strlen(config('services.stallion.api_token')) . "\n";
echo "Base URL: " . config('services.stallion.base_url') . "\n";
