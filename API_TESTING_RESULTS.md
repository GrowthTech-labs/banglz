# Stallion Express API Testing Results

## Date: February 16, 2026

## API Endpoint Testing

### Production API ✅
- **URL**: `https://ship.stallionexpress.ca/api/v4/rates`
- **Status**: Working
- **Token**: `qiMjcuAiYcvsGaKcVOMg4ENXMXtWJCLmIcjqq1y6BYsVW29Yv2W37vkdfsfv`
- **Result**: Successfully returns shipping rates

### Sandbox API ❌
- **URL**: `https://sandbox.stallionexpress.ca/api/v4/rates`
- **Status**: 401 Unauthenticated
- **Token**: Same as production
- **Result**: Token is for production environment only

## Issues Fixed

### 1. Missing Product Images (404 Errors)
**Problem**: Product images returning 404 errors were causing shipping rates to disappear from the UI.

**Solution**:
- Created `default.jpg` in `public/assets/images/products/` directory
- Copied from existing `product-1.png` to serve as fallback
- All blade templates already had fallback logic to use `default.jpg` when product images are missing

**Files Modified**:
- Created: `public/assets/images/products/default.jpg`

### 2. Invalid HS Code Format
**Problem**: HS codes were being sent without periods (e.g., `7117907500`), causing API validation errors.

**Solution**: Updated to use proper US HTS code format with periods: `7117.90.7500`

**Files Modified**:
- `app/Http/Controllers/admin/ShippingController.php`
  - Updated `postRates()` method to use `'hs_code' => '7117.90.7500'`
  - Updated `BuyLabel()` method to use `'hs_code' => '7117.90.7500'`
- `resources/views/admin/order/create-label.blade.php`
  - Updated JavaScript `collectItems()` function to use `'hs_code': '7117.90.7500'`

### 3. Test Orders Created
Created 4 new test orders (ORD-0021 to ORD-0024) with:
- Correct product image references (product-1.png through product-4.png)
- Valid address data for different countries (US, Canada, UK)
- Proper weight and product metadata

## API Response Example

```json
{
  "success": true,
  "rates": [
    {
      "postage_type_id": 33,
      "postage_type": "PostNL International Packet Tracked",
      "trackable": true,
      "package_type": "Parcel",
      "base_rate": 12.59,
      "add_ons": [
        {
          "name": "Stallion Protection",
          "type": "insurance",
          "cost": 0.59,
          "currency": "CAD"
        }
      ],
      "rate": 17.18,
      "gst": 0,
      "pst": 0,
      "hst": 0,
      "qst": 0,
      "tax": 0,
      "duty": 4,
      "duty_tax": 0,
      "total": 17.18,
      "currency": "CAD",
      "delivery_days": "8-10"
    }
  ]
}
```

## HS Code Information

**Code**: `7117.90.7500`
**Description**: Imitation jewelry - Other - Other - Other
**Category**: Jewelry and costume jewelry
**Valid For**: US HTS (Harmonized Tariff Schedule)

This code is appropriate for fashion jewelry, bangles, and costume jewelry items.

## Next Steps

1. ✅ Test the shipping label creation in the admin UI
2. ✅ Verify rates display correctly without 404 errors
3. ⏳ Test label purchase functionality
4. ⏳ Implement auto-print after label purchase (Phase 3)
5. ⏳ Add product shipping fields to database (Phase 2)

## Testing Instructions

1. Navigate to: `http://localhost:8000/admin/orders`
2. Click on any order with status "pending" (ORD-0021 to ORD-0024)
3. Click "Create Shipping Label" button
4. Verify shipping rates load without errors
5. Check browser console - should see no 404 errors for images
6. Select a shipping rate and proceed to purchase

## Configuration

Current `.env` settings:
```
STALLION_API_TOKEN=qiMjcuAiYcvsGaKcVOMg4ENXMXtWJCLmIcjqq1y6BYsVW29Yv2W37vkdfsfv
STALLION_BASE_URL=https://ship.stallionexpress.ca/api/v4/
```

## Notes

- The API token is for production environment only
- All jewelry items use HS code `7117.90.7500` by default
- Country of origin is set to `CA` (Canada) for all items
- Default currency is `CAD`
