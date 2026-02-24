<?php
/**
 * Optimize for Production
 * Upload this to public_html/public/ and visit it in browser
 * DELETE THIS FILE AFTER RUNNING!
 */

require __DIR__.'/../vendor/autoload.php';
$app = require_once __DIR__.'/../bootstrap/app.php';

$kernel = $app->make(Illuminate\Contracts\Console\Kernel::class);
$kernel->bootstrap();

echo "<h2>Production Optimization Script</h2>";
echo "<hr>";

try {
    echo "<h3>Optimizing for Production...</h3>";
    
    Artisan::call('config:cache');
    echo "<p>✓ Config cached</p>";
    
    Artisan::call('route:cache');
    echo "<p>✓ Routes cached</p>";
    
    Artisan::call('view:cache');
    echo "<p>✓ Views cached</p>";
    
    echo "<hr>";
    echo "<h3 style='color: green;'>✓ Optimization Complete!</h3>";
    echo "<p>Your application is now optimized for production.</p>";
    echo "<p><strong>IMPORTANT:</strong> Delete this file immediately for security!</p>";
    
} catch (Exception $e) {
    echo "<p style='color: red;'>✗ Error: " . $e->getMessage() . "</p>";
}
?>
