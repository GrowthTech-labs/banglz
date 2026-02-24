<?php
/**
 * Clear All Caches
 * Upload this to public_html/public/ and visit it in browser
 * DELETE THIS FILE AFTER RUNNING!
 */

require __DIR__.'/../vendor/autoload.php';
$app = require_once __DIR__.'/../bootstrap/app.php';

$kernel = $app->make(Illuminate\Contracts\Console\Kernel::class);
$kernel->bootstrap();

echo "<h2>Clear Cache Script</h2>";
echo "<hr>";

try {
    echo "<h3>Clearing Caches...</h3>";
    
    Artisan::call('config:clear');
    echo "<p>✓ Config cleared</p>";
    
    Artisan::call('cache:clear');
    echo "<p>✓ Application cache cleared</p>";
    
    Artisan::call('view:clear');
    echo "<p>✓ Views cleared</p>";
    
    Artisan::call('route:clear');
    echo "<p>✓ Routes cleared</p>";
    
    echo "<hr>";
    echo "<h3 style='color: green;'>✓ All Caches Cleared!</h3>";
    echo "<p><strong>IMPORTANT:</strong> Delete this file immediately for security!</p>";
    
} catch (Exception $e) {
    echo "<p style='color: red;'>✗ Error: " . $e->getMessage() . "</p>";
}
?>
