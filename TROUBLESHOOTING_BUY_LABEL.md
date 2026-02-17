# Troubleshooting Buy Label 422 Error

## Error
```
POST http://localhost:8000/admin/buy/shipping/rates 422 (Unprocessable Content)
❌ BuyLabel Error: Error: Label creation failed
```

## What 422 Means
422 = Validation failed. The server received the request but one or more required fields are missing or invalid.

## Changes Made to Fix

### 1. Updated `collectToAddress()` Function
Added missing fields:
- `company` (nullable)
- `address2` (nullable)
- Removed `lat` and `lng` (not needed for buy label)

### 2. Updated `collectItems()` Function
Added missing field:
- `sku` (required by validation)

### 3. Enhanced Error Display
- Now shows actual validation errors from Laravel
- Displays field names and error messages
- Uses HTML formatting for better readability

## How to Debug in Browser

1. **Open Browser Console** (F12)
2. **Look for these logs**:
   ```
   📤 Sending BuyLabel payload: {...}
   📦 BuyLabel response: {...}
   ```

3. **Check the payload** - Should include:
   ```javascript
   {
     order_id: 21,
     to_address: {
       name: "John Smith",
       company: null,
       address1: "123 Main Street",
       address2: "Apt 4B" or null,
       city: "New York",
       province_code: "NY",  // Must be 2 characters
       postal_code: "10001",
       country_code: "US",    // Must be 2 characters
       phone: "+1-555-123-4567",
       email: "john.smith@example.com",
       is_residential: true
     },
     weight_unit: "lbs",
     weight: 0.1,
     length: 9,
     width: 12,
     height: 1,
     size_unit: "cm",
     items: [{
       description: "Gold Bangle Set",
       sku: "BGL-001",
       quantity: 2,
       value: 89.99,
       currency: "CAD",
       country_of_origin: "CA",
       hs_code: "7117.90.7500"
     }],
     package_type: "Parcel",
     postage_type: "PostNL International Packet Tracked",
     signature_confirmation: false,
     insured: false,
     label_format: "pdf",
     is_draft: false
   }
   ```

4. **Check the response** - If 422, should show:
   ```javascript
   {
     success: false,
     errors: {
       "to_address.province_code": ["The to address.province code field is required."],
       "items.0.sku": ["The items.0.sku field is required."]
     }
   }
   ```

## Common Validation Errors

### Missing Required Fields
```
"to_address.address1": ["The to address.address1 field is required."]
"to_address.province_code": ["The to address.province code field is required."]
"items.0.sku": ["The items.0.sku field is required."]
```

**Solution**: Check that all required fields are being collected by JavaScript functions

### Invalid Field Length
```
"to_address.province_code": ["The to address.province code must be 2 characters."]
"to_address.country_code": ["The to address.country code must be 2 characters."]
```

**Solution**: Ensure province_code and country_code are exactly 2 characters (e.g., "NY", "US")

### Invalid Field Format
```
"to_address.email": ["The to address.email must be a valid email address."]
"weight": ["The weight must be a number."]
```

**Solution**: Check data types and formats

## Steps to Fix

1. **Hard Refresh Browser**: `Ctrl+Shift+R` (Windows) or `Cmd+Shift+R` (Mac)

2. **Clear Browser Cache**: 
   - Open DevTools (F12)
   - Right-click refresh button
   - Select "Empty Cache and Hard Reload"

3. **Check Console Logs**:
   - Look at the payload being sent
   - Look at the response errors
   - Share the exact error messages

4. **Test with Different Order**:
   - Try ORD-0021 (New York, US)
   - Try ORD-0022 (Toronto, CA)
   - See if error is order-specific

## What to Share for Debugging

If the error persists, share:

1. **Console Payload Log**:
   ```
   📤 Sending BuyLabel payload: {...}
   ```
   Copy the entire payload object

2. **Console Response Log**:
   ```
   📦 BuyLabel response: {...}
   ```
   Copy the entire response object

3. **Network Tab**:
   - Open DevTools → Network tab
   - Click on the failed request (`buy/shipping/rates`)
   - Go to "Payload" tab - copy the request payload
   - Go to "Response" tab - copy the response

## Files Modified

- `resources/views/admin/order/create-label.blade.php`
  - Updated `collectToAddress()` to include `company` and `address2`
  - Updated `collectItems()` to include `sku`
  - Enhanced error handling to show validation errors

## Next Steps

1. Hard refresh browser
2. Try to buy a label
3. Check console for the actual validation errors
4. Share the console output if error persists
