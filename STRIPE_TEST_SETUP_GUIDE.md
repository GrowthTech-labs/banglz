# Stripe Test Account Setup Guide

This guide will help you set up a Stripe test account for your Banglz project.

## Step 1: Create a Stripe Account

1. Go to [https://stripe.com](https://stripe.com)
2. Click "Sign up" or "Start now"
3. Fill in your details:
   - Email address
   - Full name
   - Country (select your country)
   - Password
4. Verify your email address

## Step 2: Access Your Dashboard

1. After signing up, you'll be redirected to the Stripe Dashboard
2. You'll see a toggle in the top-left corner that says "Test mode"
3. Make sure "Test mode" is **ON** (it should show a toggle switch)

## Step 3: Get Your Test API Keys

1. In the Stripe Dashboard, click on "Developers" in the left sidebar
2. Click on "API keys"
3. You'll see two types of keys:
   - **Publishable key** (starts with `pk_test_`)
   - **Secret key** (starts with `sk_test_`)

4. Copy both keys - you'll need them for your `.env` file

## Step 4: Update Your .env File

Open your `.env` file and update the Stripe keys:

```env
STRIPE_KEY=pk_test_YOUR_PUBLISHABLE_KEY_HERE
STRIPE_SECRET=sk_test_YOUR_SECRET_KEY_HERE
```

Replace:
- `pk_test_YOUR_PUBLISHABLE_KEY_HERE` with your actual publishable key
- `sk_test_YOUR_SECRET_KEY_HERE` with your actual secret key

## Step 5: Clear Configuration Cache

After updating your `.env` file, run these commands:

```bash
php artisan config:clear
php artisan cache:clear
```

## Step 6: Test Your Integration

### Test Card Numbers

Stripe provides test card numbers for different scenarios:

#### Successful Payments
- **Card Number**: `4242 4242 4242 4242`
- **Expiry**: Any future date (e.g., 12/25)
- **CVC**: Any 3 digits (e.g., 123)
- **ZIP**: Any 5 digits (e.g., 12345)

#### Other Test Cards
- **Visa (debit)**: `4000 0566 5566 5556`
- **Mastercard**: `5555 5555 5555 4444`
- **American Express**: `3782 822463 10005`
- **Discover**: `6011 1111 1111 1117`

#### Cards That Require Authentication (3D Secure)
- **Card Number**: `4000 0027 6000 3184`
- This will trigger a 3D Secure authentication flow

#### Cards That Will Decline
- **Generic decline**: `4000 0000 0000 0002`
- **Insufficient funds**: `4000 0000 0000 9995`
- **Lost card**: `4000 0000 0000 9987`
- **Stolen card**: `4000 0000 0000 9979`

## Step 7: Test Payment Flow

1. Start your Laravel server:
   ```bash
   php artisan serve
   ```

2. Go to your checkout page: `http://localhost:8000/check-out`

3. Add items to cart and proceed to checkout

4. Use one of the test card numbers above

5. Complete the payment

6. Check the Stripe Dashboard:
   - Go to "Payments" in the left sidebar
   - You should see your test payment listed

## Step 8: View Payment Details in Stripe

In your Stripe Dashboard, you can:
- View all test payments
- See payment details
- Issue refunds (for testing)
- View customer information
- Check payment methods saved

## Step 9: Webhook Setup (Optional but Recommended)

Webhooks allow Stripe to notify your application about events (like successful payments, failed payments, etc.)

1. In Stripe Dashboard, go to "Developers" → "Webhooks"
2. Click "Add endpoint"
3. For local testing, you'll need to use Stripe CLI or a service like ngrok
4. Endpoint URL format: `https://yourdomain.com/webhook/stripe`
5. Select events to listen to:
   - `payment_intent.succeeded`
   - `payment_intent.payment_failed`
   - `charge.refunded`

### For Local Testing with Stripe CLI

1. Install Stripe CLI: [https://stripe.com/docs/stripe-cli](https://stripe.com/docs/stripe-cli)
2. Login: `stripe login`
3. Forward events to your local server:
   ```bash
   stripe listen --forward-to localhost:8000/webhook/stripe
   ```

## Important Notes

### Test Mode vs Live Mode

- **Test Mode**: Use for development and testing
  - Keys start with `pk_test_` and `sk_test_`
  - No real money is charged
  - Use test card numbers

- **Live Mode**: Use for production only
  - Keys start with `pk_live_` and `sk_live_`
  - Real money is charged
  - Requires business verification

### Security Best Practices

1. **Never commit API keys to Git**
   - Your `.env` file is already in `.gitignore`
   - Never share your secret key publicly

2. **Use environment variables**
   - Keep test and production keys separate
   - Use `.env` for local development
   - Use server environment variables for production

3. **Rotate keys if compromised**
   - You can regenerate keys in the Stripe Dashboard
   - Update your `.env` file with new keys

## Troubleshooting

### Issue: "Stripe key missing" error

**Solution**: 
1. Make sure your `.env` file has the correct keys
2. Run `php artisan config:clear`
3. Restart your Laravel server

### Issue: Payment fails with "Invalid API key"

**Solution**:
1. Verify you're using the correct secret key (starts with `sk_test_`)
2. Make sure there are no extra spaces in your `.env` file
3. Clear config cache: `php artisan config:clear`

### Issue: Card declined in test mode

**Solution**:
- Make sure you're using a valid test card number
- Check that the expiry date is in the future
- Try the basic test card: `4242 4242 4242 4242`

### Issue: 3D Secure authentication not working

**Solution**:
- Use test card `4000 0027 6000 3184` to trigger 3D Secure
- Make sure your Stripe.js is properly loaded
- Check browser console for JavaScript errors

## Testing Checklist

- [ ] Stripe account created
- [ ] Test mode enabled
- [ ] API keys copied to `.env` file
- [ ] Config cache cleared
- [ ] Test payment with `4242 4242 4242 4242` successful
- [ ] Payment appears in Stripe Dashboard
- [ ] Test declined card `4000 0000 0000 0002`
- [ ] Test 3D Secure card `4000 0027 6000 3184`
- [ ] Saved card functionality tested
- [ ] Refund tested in Dashboard

## Next Steps

Once testing is complete and you're ready for production:

1. Complete Stripe account verification
2. Switch to Live mode in Stripe Dashboard
3. Get your live API keys (`pk_live_` and `sk_live_`)
4. Update production `.env` with live keys
5. Test with small real transactions first
6. Set up proper webhook endpoints
7. Configure proper error handling and logging

## Useful Resources

- [Stripe Documentation](https://stripe.com/docs)
- [Stripe Testing Guide](https://stripe.com/docs/testing)
- [Stripe API Reference](https://stripe.com/docs/api)
- [Stripe Dashboard](https://dashboard.stripe.com)
- [Stripe CLI](https://stripe.com/docs/stripe-cli)

## Support

If you encounter issues:
1. Check Stripe Dashboard logs
2. Check Laravel logs: `storage/logs/laravel.log`
3. Check browser console for JavaScript errors
4. Contact Stripe support: [https://support.stripe.com](https://support.stripe.com)
