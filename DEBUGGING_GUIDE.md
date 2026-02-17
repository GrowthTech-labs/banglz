# Shipping Label Debugging Guide

## Changes Made

### 1. Fixed HS Code Format
- Changed from `7117907500` to `7117.90.7500` (proper US HTS format)
- Updated in:
  - `app/Http/Controllers/admin/ShippingController.php` (both postRates and BuyLabel methods)
  - `resources/views/admin/order/create-label.blade.php` (JavaScript collectItems function)

### 2. Fixed URL Construction
- Added `rtrim()` to remove trailing slashes from base URL
- Prevents double slashes in API URLs
- Updated in both postRates and BuyLabel methods

### 3. Created Default Product Image
- Created `public/assets/images/products/default.jpg`
- Prevents 404 errors when product images are missing

### 4. Added Enhanced Logging
- Added detailed logging at the start of postRates method
- Logs request data and headers
- Separate catch blocks for validation vs general errors
- Logs full error traces

### 5. Created Test Orders
- ORD-0021 through ORD-0024
- All have correct image references
- Valid address data for different countries

## How to Debug

### Step 1: Check Browser Console
1. Open the create label page: `http://localhost:8000/admin/orders`
2. Click on any pending order (ORD-0021 to ORD-0024)
3. Click "Create Shipping Label"
4. Open browser console (F12)
5. Look for:
   - `📤 Sending payload to API:` - Shows what's being sent
   - `📥 API Response:` - Shows what's received
   - Any red error messages

### Step 2: Check Laravel Logs
```powershell
docker exec banglz_app tail -f storage/logs/laravel.log
```

Look for:
- `=== postRates called ===` - Confirms endpoint was hit
- `Calling Stallion API` - Shows payload sent to Stallion
- `Stallion API Response` - Shows response from Stallion
- Any error messages

### Step 3: Test API Directly
```powershell
docker exec banglz_app php test-shipping-controller.php
```

This tests the Stallion API directly without Laravel.

### Step 4: Check Order Data
```powershell
docker exec banglz_app php check-order-data.php
```

This shows the actual order data structure.

## Common Issues

### Issue 1: Rates Not Displaying
**Symptoms**: Loading spinner shows but rates never appear

**Possible Causes**:
1. JavaScript error in browser console
2. API returning error (check Laravel logs)
3. CSRF token missing/invalid
4. Network error (check Network tab in browser)

**Solutions**:
- Check browser console for errors
- Verify CSRF meta tag exists: `<meta name="csrf-token" content="...">`
- Check Network tab for failed requests
- Verify API token in `.env` is correct

### Issue 2: 404 Image Errors
**Symptoms**: Console shows `GET .../products/xxx.jpg 404`

**Solution**: Already fixed by creating `default.jpg`

### Issue 3: Invalid HS Code
**Symptoms**: API returns validation error about HS code

**Solution**: Already fixed - using `7117.90.7500`

### Issue 4: 401 Unauthenticated
**Symptoms**: API returns "Unauthenticated" message

**Solution**: Check API token in `.env` file

## Configuration Check

### .env File
```
STALLION_API_URL=https://ship.stallionexpress.ca/api/v4
STALLION_API_TOKEN=qiMjcuAiYcvsGaKcVOMg4ENXMXtWJCLmIcjqq1y6BYsVW29Yv2W37vkdfsfv...
```

Note: URL should NOT have trailing slash (controller adds it)

### config/services.php
```php
'stallion' => [
    'base_url' => env('STALLION_API_URL', 'https://ship.stallionexpress.ca/api/v4'),
    'api_token' => env('STALLION_API_TOKEN'),
],
```

## Test Files Created

1. `test-shipping-controller.php` - Tests Stallion API directly
2. `test-laravel-endpoint.php` - Tests Laravel endpoint (has CSRF issue)
3. `check-order-data.php` - Shows order data structure
4. `test-stallion-api.json` - Sample API payload
5. `test-full-flow.html` - Browser-based test (for manual testing)

## Next Steps

1. Open browser console and check for errors
2. Check Laravel logs for detailed error messages
3. Verify the payload being sent matches the API requirements
4. Test with different orders to see if issue is order-specific

## API Requirements (Stallion Express v4)

### Required Fields
- `to_address.name`
- `to_address.address1`
- `to_address.city`
- `to_address.province_code` (for US/CA)
- `to_address.postal_code`
- `to_address.country_code`
- `weight_unit` (lbs, kg, g, oz)
- `weight` (numeric)
- `length`, `width`, `height` (numeric)
- `size_unit` (cm, in)
- `items[]` (array with at least one item)
- `package_type` (e.g., "Parcel")

### Item Fields
- `description` (required)
- `quantity` (required, integer)
- `value` (numeric)
- `currency` (CAD, USD, etc.)
- `country_of_origin` (2-letter code)
- `hs_code` (10-digit US HTS code with periods, e.g., "7117.90.7500")

## Contact

If rates still don't load after checking all the above:
1. Share browser console output
2. Share Laravel log output
3. Share Network tab screenshot showing the failed request
