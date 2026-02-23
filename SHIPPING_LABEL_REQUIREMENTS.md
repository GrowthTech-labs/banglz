# Shipping Label Requirements

## Overview
This document outlines the exact requirements for creating shipping labels successfully through the Stallion Express API.

## Order Data Structure

### Required: products_meta_data Format
Orders must have `products_meta_data` in the following format:

```json
{
  "Products": [
    {
      "product_id": 36,
      "product": {
        "id": 36,
        "name": "Rose Gold Charm Bangles",
        "sku": "BNG-ROSE-003",
        "price": "79.99",
        "weight": "0.28",
        "weight_unit": "lbs",
        "country_of_origin": "IN",
        "hs_code": "7117907500"
      },
      "qty": 2,
      "quantity": 2,
      "final_price": "79.99",
      "line_total": 159.98
    }
  ]
}
```

### Critical Fields in Product Object
Each product MUST include:
1. **name** - Product name (string)
2. **sku** - Stock keeping unit (string)
3. **price** - Product price (numeric)
4. **weight** - Product weight (numeric, > 0)
5. **weight_unit** - Weight unit (string: 'g', 'kg', 'oz', 'lbs')
6. **country_of_origin** - 2-letter country code (string, e.g., 'IN', 'CA', 'US')
7. **hs_code** - Harmonized System code (string, 6-10 digits, e.g., '7117907500')

## Stallion API Payload Structure

### Required Fields for /shipments Endpoint

```json
{
  "to_address": {
    "name": "John Doe",
    "company": null,
    "address1": "123 Main Street",
    "address2": null,
    "city": "Toronto",
    "province_code": "ON",
    "postal_code": "M5H 2N2",
    "country_code": "CA",
    "phone": "4165551234",
    "email": "test@example.com",
    "is_residential": true
  },
  "weight_unit": "lbs",
  "weight": 0.56,
  "length": 10,
  "width": 8,
  "height": 4,
  "size_unit": "cm",
  "items": [
    {
      "description": "Rose Gold Charm Bangles",
      "sku": "BNG-ROSE-003",
      "quantity": 2,
      "value": 79.99,
      "currency": "CAD",
      "country_of_origin": "IN",
      "hs_code": "7117907500"
    }
  ],
  "package_contents": "Rose Gold Charm Bangles (x2)",
  "value": 159.98,
  "currency": "CAD",
  "package_type": "Parcel",
  "postage_type": "Expedited",
  "signature_confirmation": false,
  "insured": false,
  "label_format": "pdf",
  "is_draft": false,
  "is_fba": false
}
```

### Field Validation Rules

#### Address Fields
- **name**: Max 40 characters
- **company**: Max 40 characters (optional)
- **address1**: Max 50 characters (required)
- **address2**: Max 50 characters (optional)
- **city**: Max 35 characters (required)
- **province_code**: Exactly 2 characters (required)
- **postal_code**: Max 10 characters (required)
- **country_code**: Exactly 2 characters (required)
- **phone**: Max 20 characters (optional)
- **email**: Max 50 characters, valid email (optional)

#### Package Fields
- **weight**: Numeric, > 0.01 (required)
- **weight_unit**: One of: 'lbs', 'kg', 'g', 'oz' (required)
- **length**: Numeric, > 0.01 (required)
- **width**: Numeric, > 0.01 (required)
- **height**: Numeric, > 0.01 (required)
- **size_unit**: One of: 'cm', 'in' (required)

#### Items Array
- **items**: Array with at least 1 item (required)
- **items[].description**: String (required)
- **items[].sku**: String (optional)
- **items[].quantity**: Integer, >= 1 (required)
- **items[].value**: Numeric, >= 0 (required)
- **items[].currency**: One of: 'USD', 'CAD', 'EUR', 'AUD', 'GBP' (required)
- **items[].country_of_origin**: 2-letter country code (required for international)
- **items[].hs_code**: 6-10 digit code (required for international)

#### Calculated Fields
- **package_contents**: Comma-separated list of items with quantities (required)
- **value**: Total value of all items (sum of item.value * item.quantity) (required)

## Implementation Details

### ShippingController Logic

The `BuyLabel` method in `ShippingController`:

1. **Validates** the incoming request
2. **Builds items array** from order's `products_meta_data`:
   - For new orders: Uses embedded product data from order
   - For old orders: Queries database with `withTrashed()` to include deleted products
3. **Calculates** `package_contents` and total `value`
4. **Sends** payload to Stallion API

### Key Code Changes Made

```php
// Use product data from order meta (already captured at order time)
$productData = $item['product'];

$items[] = [
    'description' => $productData['name'],
    'sku' => $productData['sku'] ?? '',
    'quantity' => $quantity,
    'value' => $productData['price'],
    'currency' => 'CAD',
    'country_of_origin' => $productData['country_of_origin'] ?? 'CA',
    'hs_code' => $productData['hs_code'] ?? '7117907500',
];
```

### Fallback Values
- **country_of_origin**: Defaults to 'CA' if not provided
- **hs_code**: Defaults to '7117907500' (jewelry) if not provided

## Ensuring Future Orders Have Required Data

### Product Creation/Update
All products MUST have these fields set in the admin panel:
1. Weight and weight unit
2. Country of origin (dropdown)
3. HS code (text input)

### Checkout Process
The `CheckOutController` automatically captures product data including shipping fields when building `products_meta_data`.

### Validation
Products without required shipping data will fail validation when trying to create a label, with a clear error message indicating which fields are missing.

## Testing

### Test Orders
Orders 34, 35, 36 have been created with complete shipping data for testing.

### Test Script
Run `docker exec banglz_app php test-label-creation.php` to verify order data structure.

## Common Issues

### "No valid items found in order"
**Cause**: Products in order don't have required shipping data or products are soft-deleted and not being found.

**Solution**: 
- Ensure products have weight, country_of_origin, and hs_code
- ShippingController now uses `withTrashed()` for old orders
- New orders use embedded product data from order meta

### "package_contents field is required"
**Cause**: Items array is empty or not being built correctly.

**Solution**: Check that `products_meta_data` has the correct structure with 'Products' array containing product objects with all required fields.

## Default Values

### For Jewelry Products
- **HS Code**: 7117907500 (Imitation jewelry)
- **Country of Origin**: CA (Canada) or IN (India)
- **Weight Unit**: lbs (pounds)

### For Shipping
- **Currency**: CAD (Canadian Dollar)
- **Package Type**: Parcel
- **Size Unit**: cm (centimeters)
