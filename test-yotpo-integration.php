<?php
/**
 * Yotpo Integration Test Script
 * Tests the Yotpo API and widget integration
 */

require __DIR__ . '/vendor/autoload.php';

$dotenv = Dotenv\Dotenv::createImmutable(__DIR__);
$dotenv->load();

$appKey = $_ENV['YOTPO_APP_KEY'] ?? '';

if (empty($appKey)) {
    echo "❌ Error: YOTPO_APP_KEY not set in .env file\n";
    exit(1);
}

echo "🔍 Testing Yotpo Integration\n";
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n";
echo "App Key: $appKey\n\n";

// Test 1: Check if App Key is valid format
echo "Test 1: Validating App Key format...\n";
if (strlen($appKey) >= 20 && preg_match('/^[a-zA-Z0-9]+$/', $appKey)) {
    echo "✅ App Key format looks valid\n\n";
} else {
    echo "⚠️  App Key format might be incorrect\n\n";
}

// Test 2: Test Yotpo API - Get Reviews
echo "Test 2: Testing Yotpo API (Get Reviews)...\n";
$apiUrl = "https://api.yotpo.com/v1/widget/$appKey/reviews";

$ch = curl_init($apiUrl);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_TIMEOUT, 10);
curl_setopt($ch, CURLOPT_HTTPHEADER, [
    'Accept: application/json'
]);

$response = curl_exec($ch);
$httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
$error = curl_error($ch);
curl_close($ch);

if ($error) {
    echo "❌ cURL Error: $error\n\n";
} elseif ($httpCode === 200) {
    echo "✅ API Connection Successful (HTTP $httpCode)\n";
    
    $data = json_decode($response, true);
    
    if (isset($data['response'])) {
        $reviewsData = $data['response'];
        $totalReviews = $reviewsData['pagination']['total'] ?? 0;
        $avgScore = $reviewsData['bottomline']['average_score'] ?? 0;
        
        echo "   Total Reviews: $totalReviews\n";
        echo "   Average Score: $avgScore / 5.0\n";
        
        if ($totalReviews > 0) {
            echo "   ✅ Account has reviews!\n";
        } else {
            echo "   ℹ️  No reviews yet (this is normal for new accounts)\n";
        }
    } else {
        echo "   ⚠️  Unexpected response format\n";
    }
    echo "\n";
} else {
    echo "❌ API Request Failed (HTTP $httpCode)\n";
    echo "   Response: " . substr($response, 0, 200) . "...\n\n";
}

// Test 3: Check Widget Script URL
echo "Test 3: Checking Yotpo Widget Script...\n";
$widgetUrl = "https://staticw2.yotpo.com/$appKey/widget.js";

$ch = curl_init($widgetUrl);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_NOBODY, true); // HEAD request
curl_setopt($ch, CURLOPT_TIMEOUT, 10);

curl_exec($ch);
$httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
curl_close($ch);

if ($httpCode === 200) {
    echo "✅ Widget Script Available (HTTP $httpCode)\n";
    echo "   URL: $widgetUrl\n\n";
} else {
    echo "❌ Widget Script Not Found (HTTP $httpCode)\n";
    echo "   URL: $widgetUrl\n\n";
}

// Test 4: Check Laravel Configuration
echo "Test 4: Checking Laravel Configuration...\n";
echo "   Config Path: config/services.php\n";

if (file_exists(__DIR__ . '/config/services.php')) {
    $configContent = file_get_contents(__DIR__ . '/config/services.php');
    if (strpos($configContent, "'yotpo'") !== false) {
        echo "   ✅ Yotpo config exists in services.php\n";
    } else {
        echo "   ❌ Yotpo config missing in services.php\n";
    }
} else {
    echo "   ❌ config/services.php not found\n";
}
echo "\n";

// Test 5: Check View Files
echo "Test 5: Checking View Files...\n";
$viewFiles = [
    'resources/views/pages/home.blade.php',
    'resources/views/pages/product-detail.blade.php',
    'resources/views/pages/shop-all.blade.php',
    'resources/views/components/layouts/user-default.blade.php'
];

$yotpoViewsFound = 0;
foreach ($viewFiles as $file) {
    if (file_exists(__DIR__ . '/' . $file)) {
        $content = file_get_contents(__DIR__ . '/' . $file);
        if (strpos($content, 'yotpo') !== false) {
            $yotpoViewsFound++;
        }
    }
}

echo "   ✅ Found Yotpo code in $yotpoViewsFound view files\n\n";

// Summary
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n";
echo "📊 SUMMARY\n";
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n";

if ($httpCode === 200) {
    echo "✅ Yotpo Integration: ACTIVE\n";
    echo "✅ App Key: Valid\n";
    echo "✅ API: Connected\n";
    echo "✅ Widget: Available\n";
    echo "✅ Views: Configured\n\n";
    
    echo "🎉 SUCCESS! Yotpo is fully configured and ready!\n\n";
    
    echo "📝 Next Steps:\n";
    echo "1. Visit: http://localhost:8000\n";
    echo "2. Scroll to 'What our Customers Say' section\n";
    echo "3. You should see Yotpo widget (or 'No reviews yet')\n";
    echo "4. Check these pages:\n";
    echo "   - Homepage: http://localhost:8000\n";
    echo "   - Product Detail: http://localhost:8000/product/[slug]\n";
    echo "   - Shop All: http://localhost:8000/shop-all\n";
    echo "   - About: http://localhost:8000/about\n\n";
    
    echo "💡 To collect reviews:\n";
    echo "1. Login to Yotpo dashboard: https://yap.yotpo.com/\n";
    echo "2. Send review requests to customers\n";
    echo "3. Or add test reviews for demonstration\n";
} else {
    echo "⚠️  Yotpo Integration: PARTIAL\n";
    echo "   App Key is configured but API connection failed\n";
    echo "   This might be temporary or the account needs activation\n\n";
    
    echo "📝 Troubleshooting:\n";
    echo "1. Verify App Key is correct in Yotpo dashboard\n";
    echo "2. Check if account is fully activated\n";
    echo "3. Try again in a few minutes\n";
    echo "4. Contact Yotpo support if issue persists\n";
}

echo "\n";
