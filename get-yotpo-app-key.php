<?php
/**
 * Yotpo App Key Retrieval Script
 * 
 * This script attempts to retrieve the Yotpo App Key using the account credentials.
 * Run: php get-yotpo-app-key.php
 */

require __DIR__ . '/vendor/autoload.php';

$dotenv = Dotenv\Dotenv::createImmutable(__DIR__);
$dotenv->load();

$email = $_ENV['YOTPO_EMAIL'] ?? '';
$password = $_ENV['YOTPO_PASSWORD'] ?? '';

if (empty($email) || empty($password)) {
    echo "❌ Error: YOTPO_EMAIL or YOTPO_PASSWORD not set in .env file\n";
    exit(1);
}

echo "🔍 Attempting to retrieve Yotpo App Key...\n";
echo "Email: $email\n\n";

// Yotpo OAuth endpoint
$authUrl = 'https://api.yotpo.com/oauth/token';

$authData = [
    'client_id' => $email,
    'client_secret' => $password,
    'grant_type' => 'password'
];

$ch = curl_init($authUrl);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_POST, true);
curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($authData));
curl_setopt($ch, CURLOPT_HTTPHEADER, [
    'Content-Type: application/json',
    'Accept: application/json'
]);

$response = curl_exec($ch);
$httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
curl_close($ch);

if ($httpCode !== 200) {
    echo "❌ Authentication failed (HTTP $httpCode)\n";
    echo "Response: $response\n\n";
    echo "📝 Note: You need to get the App Key from Yotpo Dashboard:\n";
    echo "   1. Login to: https://yap.yotpo.com/\n";
    echo "   2. Email: $email\n";
    echo "   3. Password: [your password]\n";
    echo "   4. Go to: Settings → Store Settings\n";
    echo "   5. Copy the 'App Key' (looks like: abc123def456)\n";
    echo "   6. Add to .env: YOTPO_APP_KEY=your_app_key_here\n";
    exit(1);
}

$data = json_decode($response, true);

if (isset($data['access_token'])) {
    echo "✅ Authentication successful!\n";
    echo "Access Token: " . substr($data['access_token'], 0, 20) . "...\n\n";
    
    // Try to get account info
    $accountUrl = 'https://api.yotpo.com/apps/account';
    
    $ch = curl_init($accountUrl);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_HTTPHEADER, [
        'Authorization: Bearer ' . $data['access_token'],
        'Accept: application/json'
    ]);
    
    $accountResponse = curl_exec($ch);
    $accountHttpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    curl_close($ch);
    
    if ($accountHttpCode === 200) {
        $accountData = json_decode($accountResponse, true);
        
        if (isset($accountData['app_key'])) {
            echo "🎉 SUCCESS! Found App Key:\n";
            echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n";
            echo "App Key: " . $accountData['app_key'] . "\n";
            echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n";
            
            echo "📝 Next Steps:\n";
            echo "1. Add this to your .env file:\n";
            echo "   YOTPO_APP_KEY=" . $accountData['app_key'] . "\n\n";
            echo "2. Clear cache:\n";
            echo "   php artisan config:clear\n";
            echo "   php artisan cache:clear\n\n";
            echo "3. Restart server:\n";
            echo "   docker-compose restart app\n\n";
            echo "4. Test on: http://localhost:8000\n";
            
            // Optionally update .env file automatically
            $envFile = __DIR__ . '/.env';
            $envContent = file_get_contents($envFile);
            
            if (strpos($envContent, 'YOTPO_APP_KEY=') !== false) {
                $envContent = preg_replace(
                    '/YOTPO_APP_KEY=.*/',
                    'YOTPO_APP_KEY=' . $accountData['app_key'],
                    $envContent
                );
                file_put_contents($envFile, $envContent);
                echo "\n✅ .env file updated automatically!\n";
            }
        } else {
            echo "⚠️  Could not find App Key in account data\n";
            echo "Response: $accountResponse\n";
        }
    } else {
        echo "⚠️  Could not retrieve account info (HTTP $accountHttpCode)\n";
        echo "Response: $accountResponse\n";
    }
} else {
    echo "❌ Unexpected response format\n";
    echo "Response: $response\n";
}

echo "\n";
