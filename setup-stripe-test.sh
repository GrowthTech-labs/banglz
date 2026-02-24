#!/bin/bash

# Stripe Test Account Setup Script
# This script helps you configure Stripe test keys in your .env file

echo "=========================================="
echo "Stripe Test Account Setup"
echo "=========================================="
echo ""

# Check if .env file exists
if [ ! -f .env ]; then
    echo "❌ Error: .env file not found!"
    echo "Please copy .env.example to .env first:"
    echo "  cp .env.example .env"
    exit 1
fi

echo "📋 Before we begin, please:"
echo "1. Go to https://stripe.com and sign up (if you haven't already)"
echo "2. Enable 'Test mode' in your Stripe Dashboard"
echo "3. Go to Developers → API keys"
echo "4. Copy your test keys (they start with pk_test_ and sk_test_)"
echo ""
read -p "Press Enter when you're ready to continue..."
echo ""

# Get Stripe Publishable Key
echo "🔑 Enter your Stripe Publishable Key (starts with pk_test_):"
read -p "STRIPE_KEY: " stripe_key

if [[ ! $stripe_key =~ ^pk_test_ ]]; then
    echo "⚠️  Warning: Key doesn't start with 'pk_test_'. Make sure you're using TEST keys!"
    read -p "Continue anyway? (y/n): " confirm
    if [ "$confirm" != "y" ]; then
        echo "Setup cancelled."
        exit 1
    fi
fi

# Get Stripe Secret Key
echo ""
echo "🔐 Enter your Stripe Secret Key (starts with sk_test_):"
read -p "STRIPE_SECRET: " stripe_secret

if [[ ! $stripe_secret =~ ^sk_test_ ]]; then
    echo "⚠️  Warning: Key doesn't start with 'sk_test_'. Make sure you're using TEST keys!"
    read -p "Continue anyway? (y/n): " confirm
    if [ "$confirm" != "y" ]; then
        echo "Setup cancelled."
        exit 1
    fi
fi

# Ask about bypass mode
echo ""
echo "🧪 Do you want to enable BYPASS_PAYMENT mode?"
echo "   (This skips Stripe validation for quick testing)"
read -p "Enable bypass mode? (y/n): " bypass_mode

if [ "$bypass_mode" = "y" ]; then
    bypass_value="true"
else
    bypass_value="false"
fi

# Backup .env file
echo ""
echo "📦 Creating backup of .env file..."
cp .env .env.backup.$(date +%Y%m%d_%H%M%S)
echo "✅ Backup created"

# Update .env file
echo ""
echo "📝 Updating .env file..."

# Update STRIPE_KEY
if grep -q "^STRIPE_KEY=" .env; then
    sed -i.tmp "s|^STRIPE_KEY=.*|STRIPE_KEY=$stripe_key|" .env
else
    echo "STRIPE_KEY=$stripe_key" >> .env
fi

# Update STRIPE_SECRET
if grep -q "^STRIPE_SECRET=" .env; then
    sed -i.tmp "s|^STRIPE_SECRET=.*|STRIPE_SECRET=$stripe_secret|" .env
else
    echo "STRIPE_SECRET=$stripe_secret" >> .env
fi

# Update or add BYPASS_PAYMENT
if grep -q "^BYPASS_PAYMENT=" .env; then
    sed -i.tmp "s|^BYPASS_PAYMENT=.*|BYPASS_PAYMENT=$bypass_value|" .env
else
    echo "BYPASS_PAYMENT=$bypass_value" >> .env
fi

# Remove temporary files created by sed
rm -f .env.tmp

echo "✅ .env file updated successfully!"

# Clear Laravel cache
echo ""
echo "🧹 Clearing Laravel cache..."
php artisan config:clear
php artisan cache:clear
echo "✅ Cache cleared"

# Display summary
echo ""
echo "=========================================="
echo "✅ Setup Complete!"
echo "=========================================="
echo ""
echo "Configuration:"
echo "  STRIPE_KEY: ${stripe_key:0:20}..."
echo "  STRIPE_SECRET: ${stripe_secret:0:20}..."
echo "  BYPASS_PAYMENT: $bypass_value"
echo ""
echo "Next steps:"
echo "1. Start your Laravel server: php artisan serve"
echo "2. Go to: http://localhost:8000/check-out"
echo "3. Use test card: 4242 4242 4242 4242"
echo "4. Check payment in Stripe Dashboard"
echo ""
echo "📚 For more information, see:"
echo "   - STRIPE_TEST_SETUP_GUIDE.md"
echo "   - STRIPE_TEST_CARDS.md"
echo ""
echo "🔄 To restore your previous .env, use the backup file:"
echo "   ls -la .env.backup.*"
echo ""
