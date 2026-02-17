# Buy Label (Create Shipment) Implementation

## Overview
Implemented the "Buy Label" functionality that creates a shipping label through the Stallion Express API and saves the tracking information to the database.

## Changes Made

### 1. Updated ShippingController BuyLabel Method

**File**: `app/Http/Controllers/admin/ShippingController.php`

**Key Changes**:
- Added comprehensive validation for all required fields
- Added `order_id` as required parameter
- Included all API-required fields:
  - `to_address` with all sub-fields (name, company, address1, address2, city, province_code, postal_code, country_code, phone, email, is_residential)
  - `weight`, `weight_unit`, `length`, `width`, `height`, `size_unit`
  - `items` array with description, sku, quantity, value, currency, country_of_origin, hs_code
  - `package_type`, `postage_type`
  - `signature_confirmation`, `insured`, `label_format`, `is_draft`, `is_fba`
- Added enhanced logging for debugging
- Proper Idempotency-Key using order_id and timestamp
- Saves shipment data, tracking number, and label URL to database
- Updates order status to "processing"

### 2. Database Migration

**File**: `database/migrations/2026_02_17_152253_add_shipping_label_data_to_orders_table.php`

**Added Columns**:
- `shipping_label_data` (text, nullable) - Stores complete API response
- `tracking_number` (string, nullable) - Extracted tracking number
- `label_url` (string, nullable) - Direct link to label PDF

### 3. Updated Order Model

**File**: `app/Models/Order.php`

**Added to Fillable**:
- `shipping_label_data`
- `tracking_number`
- `label_url`

### 4. Updated JavaScript

**File**: `resources/views/admin/order/create-label.blade.php`

**Changes**:
- Updated payload to include all required fields
- Added `order_id` to payload
- Removed `package_contents` (not in API spec)
- Added `signature_confirmation`, `insured`, `label_format`, `is_draft`
- Enhanced success message to show tracking number
- Added button to view label PDF in new tab
- Auto-reload page after successful label creation

## API Endpoint

**POST** `/admin/shipping/rates/buy`

**Request Payload**:
```json
{
  "order_id": 123,
  "to_address": {
    "name": "John Smith",
    "company": null,
    "address1": "123 Main Street",
    "address2": "Apt 4B",
    "city": "New York",
    "province_code": "NY",
    "postal_code": "10001",
    "country_code": "US",
    "phone": "+1-555-123-4567",
    "email": "john.smith@example.com",
    "is_residential": true
  },
  "weight_unit": "lbs",
  "weight": 0.1,
  "length": 9,
  "width": 12,
  "height": 1,
  "size_unit": "cm",
  "items": [
    {
      "description": "Gold Bangle Set",
      "sku": "BGL-001",
      "quantity": 2,
      "value": 89.99,
      "currency": "CAD",
      "country_of_origin": "CA",
      "hs_code": "7117.90.7500"
    }
  ],
  "package_type": "Parcel",
  "postage_type": "USPS First Class Mail",
  "signature_confirmation": false,
  "insured": false,
  "label_format": "pdf",
  "is_draft": false
}
```

**Success Response**:
```json
{
  "success": true,
  "shipment": {
    "id": 12345,
    "tracking_number": "9400111899562941234567",
    "label_url": "https://ship.stallionexpress.ca/labels/12345.pdf",
    "postage_type": "USPS First Class Mail",
    "total": 15.50,
    "currency": "CAD",
    ...
  }
}
```

**Error Response**:
```json
{
  "success": false,
  "errors": {
    "to_address.address1": ["The to address.address1 field is required."]
  }
}
```

## User Flow

1. User navigates to order details page
2. Clicks "Create Shipping Label" button
3. Rates are fetched and displayed
4. User selects a shipping rate
5. User clicks "Buy Label" button
6. System sends request to Stallion API
7. On success:
   - Order status updated to "processing"
   - Tracking number saved to database
   - Label URL saved to database
   - Success popup shows tracking number
   - User can click "View Label" to open PDF
   - Page reloads to show updated status
8. On error:
   - Error message displayed
   - User can try again

## Testing

### Test with cURL:
```bash
curl -X POST http://localhost:8000/admin/shipping/rates/buy \
  -H "Content-Type: application/json" \
  -H "X-CSRF-TOKEN: your-csrf-token" \
  -d '{
    "order_id": 21,
    "to_address": {
      "name": "John Smith",
      "address1": "123 Main Street",
      "address2": "Apt 4B",
      "city": "New York",
      "province_code": "NY",
      "postal_code": "10001",
      "country_code": "US",
      "phone": "+1-555-123-4567",
      "email": "john.smith@example.com",
      "is_residential": true
    },
    "weight_unit": "lbs",
    "weight": 0.1,
    "length": 9,
    "width": 12,
    "height": 1,
    "size_unit": "cm",
    "items": [{
      "description": "Gold Bangle Set",
      "sku": "BGL-001",
      "quantity": 2,
      "value": 89.99,
      "currency": "CAD",
      "country_of_origin": "CA",
      "hs_code": "7117.90.7500"
    }],
    "package_type": "Parcel",
    "postage_type": "USPS First Class Mail",
    "signature_confirmation": false,
    "insured": false,
    "label_format": "pdf",
    "is_draft": false
  }'
```

### Test in Browser:
1. Go to `http://localhost:8000/admin/orders`
2. Click on order ORD-0021
3. Click "Create Shipping Label"
4. Select a shipping rate
5. Click "Buy Label"
6. Check browser console for logs
7. Verify success popup appears
8. Click "View Label" to see PDF

## Important Notes

### Idempotency
- Uses `Idempotency-Key` header with format: `order_{order_id}_{timestamp}`
- Prevents duplicate label creation if request is retried
- Stallion API caches responses for 24 hours based on this key

### Label Formats
- `pdf` (default) - Standard PDF label
- `zpl` - Zebra printer format
- `png` - Image format

### Draft Mode
- Set `is_draft: true` to save shipment without purchasing
- Useful for testing or preparing labels in advance
- No charge applied for draft shipments

### Insurance
- Set `insured: true` to add Stallion Protection
- Only available for tracked shipments
- Additional cost added to total

### Signature Confirmation
- Set `signature_confirmation: true` to require signature
- Additional cost may apply
- Not available for all postage types

## Error Handling

Common errors and solutions:

1. **401 Unauthenticated**
   - Check API token in `.env`
   - Verify token is correct (60 characters)

2. **422 Validation Error**
   - Check all required fields are present
   - Verify field formats (e.g., province_code must be 2 characters)
   - Ensure HS code is valid US HTS format

3. **500 Internal Server Error**
   - Check Laravel logs: `docker exec banglz_app tail -f storage/logs/laravel.log`
   - Verify database connection
   - Check if order exists

## Database Schema

```sql
ALTER TABLE orders ADD COLUMN shipping_label_data TEXT NULL;
ALTER TABLE orders ADD COLUMN tracking_number VARCHAR(255) NULL;
ALTER TABLE orders ADD COLUMN label_url VARCHAR(255) NULL;
```

## Configuration

`.env` file:
```
STALLION_API_URL=https://ship.stallionexpress.ca/api/v4
STALLION_API_TOKEN=qiMjcuAiYcvsGaKcVOMg4ENXMXtWJCLmIcjqq1y6BYsVW29Yv2W37vkdfsfv
```

## Next Steps

1. ✅ Implement rate fetching (DONE)
2. ✅ Implement label purchase (DONE)
3. ⏳ Add auto-print functionality
4. ⏳ Add label reprint feature
5. ⏳ Add tracking page
6. ⏳ Add bulk label creation
7. ⏳ Add shipping notifications to customers

## Status

✅ **READY FOR TESTING**

The Buy Label functionality is fully implemented and ready to test with real orders.
