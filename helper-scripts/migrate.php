<?php
/**
 * Laravel Migration Script
 * Upload this to public_html/public/ and visit it in browser
 * DELETE THIS FILE AFTER RUNNING!
 */

require __DIR__.'/../vendor/autoload.php';
$app = require_once __DIR__.'/../bootstrap/app.php';

$kernel = $app->make(Illuminate\Contracts\Console\Kernel::class);
$kernel->bootstrap();

echo "<h2>Laravel Setup Script</h2>";
echo "<hr>";

try {
    // Run migrations
    echo "<h3>Running Migrations...</h3>";
    Artisan::call('migrate', ['--force' => true]);
    echo "<pre>" . Artisan::output() . "</pre>";
    echo "<p style='color: green;'>✓ Migrations completed!</p>";
    
    // Clear caches
    echo "<h3>Clearing Caches...</h3>";
    Artisan::call('config:clear');
    echo "<p>Config cleared</p>";
    
    Artisan::call('cache:clear');
    echo "<p>Cache cleared</p>";
    
    Artisan::call('view:clear');
    echo "<p>Views cleared</p>";
    
    Artisan::call('route:clear');
    echo "<p>Routes cleared</p>";
    
    // Cache for production
    echo "<h3>Caching for Production...</h3>";
    Artisan::call('config:cache');
    echo "<p>Config cached</p>";
    
    Artisan::call('route:cache');
    echo "<p>Routes cached</p>";
    
    Artisan::call('view:cache');
    echo "<p>Views cached</p>";
    
    echo "<hr>";
    echo "<h3 style='color: green;'>✓ Setup Complete!</h3>";
    echo "<p><strong>IMPORTANT:</strong> Delete this file immediately for security!</p>";
    
} catch (Exception $e) {
    echo "<p style='color: red;'>✗ Error: " . $e->getMessage() . "</p>";
    echo "<pre>" . $e->getTraceAsString() . "</pre>";
}
?>
