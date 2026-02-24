<?php
/**
 * Quick Stripe Connection Test Script
 * Run this to verify your Stripe keys are working
 * 
 * Usage: php test-stripe-connection.php
 */

require __DIR__.'/vendor/autoload.php';

// Load environment variables
$dotenv = Dotenv\Dotenv::createImmutable(__DIR__);
$dotenv->load();

echo "==========================================\n";
echo "Stripe Connection Test\n";
echo "==========================================\n\n";

// Get Stripe keys from .env
$stripeKey = $_ENV['STRIPE_KEY'] ?? null;
$stripeSecret = $_ENV['STRIPE_SECRET'] ?? null;

// Check if keys exist
if (!$stripeKey || !$stripeSecret) {
    echo "❌ ERROR: Stripe keys not found in .env file\n";
    echo "Please add STRIPE_KEY and STRIPE_SECRET to your .env file\n";
    exit(1);
}

// Check if keys are placeholders
if ($stripeKey === 'pk_test_placeholder' || $stripeSecret === 'sk_test_placeholder') {
    echo "❌ ERROR: Stripe keys are still placeholders\n";
    echo "Please update your .env file with real Stripe test keys\n";
    exit(1);
}

// Display key info (masked for security)
echo "Publishable Key: " . substr($stripeKey, 0, 20) . "..." . substr($stripeKey, -10) . "\n";
echo "Secret Key: " . substr($stripeSecret, 0, 20) . "..." . substr($stripeSecret, -10) . "\n\n";

// Check if keys are test mode
$isTestMode = (strpos($stripeKey, 'pk_test_') === 0 && strpos($stripeSecret, 'sk_test_') === 0);
if ($isTestMode) {
    echo "✅ Keys are in TEST MODE (safe for development)\n\n";
} else {
    echo "⚠️  WARNING: Keys appear to be LIVE MODE keys!\n";
    echo "For development, use test keys (pk_test_ and sk_test_)\n\n";
}

// Try to connect to Stripe
try {
    echo "Testing Stripe API connection...\n";
    
    $stripe = new \Stripe\StripeClient($stripeSecret);
    
    // Try to retrieve account information
    $account = $stripe->accounts->retrieve();
    
    echo "✅ Successfully connected to Stripe!\n\n";
    echo "Account Details:\n";
    echo "  - Account ID: " . $account->id . "\n";
    echo "  - Country: " . ($account->country ?? 'N/A') . "\n";
    echo "  - Currency: " . ($account->default_currency ?? 'N/A') . "\n";
    echo "  - Email: " . ($account->email ?? 'N/A') . "\n";
    echo "  - Charges Enabled: " . ($account->charges_enabled ? 'Yes' : 'No') . "\n";
    echo "  - Payouts Enabled: " . ($account->payouts_enabled ? 'Yes' : 'No') . "\n\n";
    
    echo "==========================================\n";
    echo "✅ Stripe is configured correctly!\n";
    echo "==========================================\n\n";
    
    echo "Next Steps:\n";
    echo "1. Start your Laravel server: php artisan serve\n";
    echo "2. Go to checkout page: http://localhost:8000/check-out\n";
    echo "3. Use test card: 4242 4242 4242 4242\n";
    echo "4. Expiry: 12/25, CVC: 123, ZIP: 12345\n";
    echo "5. Check Stripe Dashboard for the test payment\n\n";
    
} catch (\Stripe\Exception\AuthenticationException $e) {
    echo "❌ Authentication Error: " . $e->getMessage() . "\n";
    echo "Your secret key may be invalid or incorrect.\n";
    echo "Please check your STRIPE_SECRET in .env file\n";
    exit(1);
} catch (\Stripe\Exception\ApiErrorException $e) {
    echo "❌ API Error: " . $e->getMessage() . "\n";
    exit(1);
} catch (Exception $e) {
    echo "❌ Error: " . $e->getMessage() . "\n";
    exit(1);
}
