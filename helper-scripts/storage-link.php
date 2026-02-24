<?php
/**
 * Storage Link Creator
 * Upload this to public_html/public/ and visit it in browser
 * DELETE THIS FILE AFTER RUNNING!
 */

echo "<h2>Storage Link Creator</h2>";
echo "<hr>";

$target = '../storage/app/public';
$link = __DIR__ . '/storage';

try {
    if (file_exists($link)) {
        echo "<p style='color: orange;'>⚠ Storage link already exists!</p>";
        echo "<p>Link: " . $link . "</p>";
        echo "<p>Target: " . realpath($link) . "</p>";
    } else {
        if (symlink($target, $link)) {
            echo "<p style='color: green;'>✓ Storage link created successfully!</p>";
            echo "<p>Link: " . $link . "</p>";
            echo "<p>Target: " . $target . "</p>";
        } else {
            echo "<p style='color: red;'>✗ Failed to create symbolic link</p>";
            echo "<p>You may need to create it manually via File Manager</p>";
        }
    }
    
    echo "<hr>";
    echo "<p><strong>IMPORTANT:</strong> Delete this file immediately for security!</p>";
    
} catch (Exception $e) {
    echo "<p style='color: red;'>✗ Error: " . $e->getMessage() . "</p>";
}
?>
