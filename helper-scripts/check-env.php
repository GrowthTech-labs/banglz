<?php
/**
 * Environment Checker
 * Upload this to public_html/public/ and visit it in browser
 * DELETE THIS FILE AFTER CHECKING!
 */

echo "<h2>Environment Checker</h2>";
echo "<hr>";

// Check if .env exists
$envPath = __DIR__ . '/../.env';
echo "<h3>Environment File</h3>";
if (file_exists($envPath)) {
    echo "<p style='color: green;'>✓ .env file exists</p>";
    echo "<p>Location: " . $envPath . "</p>";
} else {
    echo "<p style='color: red;'>✗ .env file NOT found!</p>";
    echo "<p>Expected location: " . $envPath . "</p>";
}

echo "<hr>";

// Check PHP version
echo "<h3>PHP Information</h3>";
echo "<p>PHP Version: <strong>" . phpversion() . "</strong></p>";
echo "<p>Required: PHP 8.1 or higher</p>";

if (version_compare(phpversion(), '8.1.0', '>=')) {
    echo "<p style='color: green;'>✓ PHP version is compatible</p>";
} else {
    echo "<p style='color: red;'>✗ PHP version is too old</p>";
}

echo "<hr>";

// Check required extensions
echo "<h3>Required PHP Extensions</h3>";
$required = ['pdo', 'mbstring', 'openssl', 'tokenizer', 'xml', 'ctype', 'json', 'bcmath'];
foreach ($required as $ext) {
    if (extension_loaded($ext)) {
        echo "<p style='color: green;'>✓ $ext</p>";
    } else {
        echo "<p style='color: red;'>✗ $ext (missing)</p>";
    }
}

echo "<hr>";

// Check directories
echo "<h3>Directory Permissions</h3>";
$dirs = [
    '../storage' => 'Storage',
    '../bootstrap/cache' => 'Bootstrap Cache',
    '../public' => 'Public'
];

foreach ($dirs as $dir => $name) {
    $fullPath = __DIR__ . '/' . $dir;
    if (is_dir($fullPath)) {
        $perms = substr(sprintf('%o', fileperms($fullPath)), -4);
        $writable = is_writable($fullPath);
        
        echo "<p><strong>$name:</strong> ";
        if ($writable) {
            echo "<span style='color: green;'>✓ Writable (Permissions: $perms)</span>";
        } else {
            echo "<span style='color: red;'>✗ Not writable (Permissions: $perms)</span>";
        }
        echo "</p>";
    } else {
        echo "<p><strong>$name:</strong> <span style='color: red;'>✗ Directory not found</span></p>";
    }
}

echo "<hr>";

// Check vendor directory
echo "<h3>Composer Dependencies</h3>";
if (is_dir(__DIR__ . '/../vendor')) {
    echo "<p style='color: green;'>✓ Vendor directory exists</p>";
    if (file_exists(__DIR__ . '/../vendor/autoload.php')) {
        echo "<p style='color: green;'>✓ Autoload file exists</p>";
    } else {
        echo "<p style='color: red;'>✗ Autoload file missing</p>";
    }
} else {
    echo "<p style='color: red;'>✗ Vendor directory not found</p>";
    echo "<p>Run: composer install</p>";
}

echo "<hr>";
echo "<p><strong>IMPORTANT:</strong> Delete this file immediately for security!</p>";
?>
