# Testing Order Flow with Payment Bypass

## Overview
Payment bypass is now enabled to test the complete order-to-shipping-label flow without actual payment processing.

## Configuration

### Environment Variable
```env
BYPASS_PAYMENT=true
```

This is already set in your `.env` file.

## How It Works

When `BYPASS_PAYMENT=true`:
1. User adds products to cart
2. User proceeds to checkout
3. User fills in shipping/billing information
4. User clicks "Place Order"
5. **Payment is skipped** - No Stripe API call
6. Order is created immediately with `payment_status = 'paid'`
7. Order appears in admin panel under "Orders"
8. Admin can create shipping label

## Testing Steps

### Step 1: Add Product to Cart
1. Go to homepage: `http://localhost:8000`
2. Browse products (they should now be visible after our fixes)
3. Click on a product
4. Add to cart

### Step 2: Proceed to Checkout
1. Click cart icon
2. Click "Checkout" or "Proceed to Checkout"
3. Fill in required information:
   - **Name**: John
   - **Last Name**: Doe
   - **Email**: test@example.com
   - **Phone**: 4165551234
   - **Address**: 123 Main Street
   - **City**: Toronto
   - **Province**: Ontario (ON)
   - **Postal Code**: M5H 2N2
   - **Country**: Canada (CA)

### Step 3: Place Order
1. Click "Place Order" button
2. Order should be created immediately (no payment processing)
3. You should see success message
4. Note the order number (e.g., ORD-0037)

### Step 4: Verify Order in Admin
1. Go to admin panel: `http://localhost:8000/admin`
2. Login with admin credentials
3. Navigate to "Orders" section
4. Find your newly created order
5. Click "View" to see order details

### Step 5: Check Order Data Structure
1. In order details, verify:
   - Order has products listed
   - Products have all required fields:
     - Name
     - SKU
     - Price
     - Weight & weight_unit
     - Country of origin
     - HS code
   - Shipping address is complete
   - Payment status shows "Paid"

### Step 6: Create Shipping Label
1. In order details page, click "Create Label" button
2. Fill in package dimensions:
   - **Length**: 10 cm
   - **Width**: 8 cm
   - **Height**: 4 cm
   - **Weight**: (should auto-fill from products)
3. Click "Get Rates"
4. Select a shipping service
5. Click "Buy Label"

### Expected Results

#### ✅ Success Indicators
- Order created with correct `products_meta_data` structure
- All product fields captured (weight, country_of_origin, hs_code)
- Shipping address properly formatted
- Label creation succeeds without errors
- Label URL/tracking number returned

#### ❌ Failure Indicators
- "No valid items found in order" error
- "package_contents field is required" error
- Missing product data in order
- Shipping fields not captured

## Verifying Order Data

### Using Tinker
```bash
docker exec banglz_app php artisan tinker
```

```php
// Get latest order
$order = DB::table('orders')->orderBy('id', 'desc')->first();

// Check products_meta_data structure
$meta = json_decode($order->products_meta_data, true);
print_r($meta);

// Verify product has shipping data
$product = $meta['Products'][0]['product'];
echo "Weight: " . $product['weight'] . "\n";
echo "Country: " . $product['country_of_origin'] . "\n";
echo "HS Code: " . $product['hs_code'] . "\n";
```

### Using Test Script
```bash
docker exec banglz_app php test-label-creation.php
```

Replace order ID 34 with your new order ID in the script.

## What to Look For

### 1. Order Structure
The `products_meta_data` should look like:
```json
{
  "Products": [
    {
      "product_id": 54,
      "product": {
        "id": 54,
        "name": "test 6",
        "sku": "TEST-006",
        "price": "78.00",
        "weight": "0.5",
        "weight_unit": "lbs",
        "country_of_origin": "CA",
        "hs_code": "7117907500"
      },
      "qty": 1,
      "final_price": "78.00",
      "line_total": 78.00
    }
  ]
}
```

### 2. Shipping Address
The `delivery_meta_data` should include:
- address
- city
- state_province / province_code
- postal_code / postcode
- country
- country_iso (2-letter code)

### 3. Label Creation Payload
When creating label, the system should build:
```json
{
  "items": [
    {
      "description": "test 6",
      "sku": "TEST-006",
      "quantity": 1,
      "value": 78.00,
      "currency": "CAD",
      "country_of_origin": "CA",
      "hs_code": "7117907500"
    }
  ],
  "package_contents": "test 6 (x1)",
  "value": 78.00,
  "currency": "CAD"
}
```

## Troubleshooting

### Issue: Order not created
**Check**: 
- Browser console for JavaScript errors
- Laravel logs: `docker exec banglz_app tail -f storage/logs/laravel.log`
- Ensure BYPASS_PAYMENT=true in .env

### Issue: Products missing shipping data
**Check**:
- Product has weight, country_of_origin, hs_code in database
- CheckOutController is capturing full product object
- products_meta_data JSON structure is correct

### Issue: Label creation fails
**Check**:
- ShippingController logs
- Stallion API response
- Items array is being built correctly
- All required fields present in payload

## Disabling Payment Bypass

When ready to test with real payments:

1. Set in `.env`:
```env
BYPASS_PAYMENT=false
```

2. Restart application:
```bash
docker restart banglz_app
```

3. Configure Stripe keys:
```env
STRIPE_KEY=pk_test_your_key
STRIPE_SECRET=sk_test_your_secret
```

## Notes

- Payment bypass only works when `BYPASS_PAYMENT=true`
- Orders created with bypass have `payment_status = 'paid'`
- No actual money is charged
- Stripe API is not called
- Perfect for testing order flow and shipping label creation
- Remember to disable before going to production!

## Success Criteria

✅ Order created from frontend checkout
✅ Order appears in admin panel
✅ Order has complete product data with shipping fields
✅ Shipping label can be created successfully
✅ Label URL/tracking number returned
✅ No errors in the process

If all criteria are met, the order-to-shipping flow is working correctly!
