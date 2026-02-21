# Unavailable Quantity Feature - Complete Explanation

## Overview
The "Unavailable Quantity" feature is an inventory management system that tracks stock that physically exists but cannot be sold to customers. This allows you to maintain accurate inventory counts while preventing overselling.

---

## Business Logic

### The Formula
```
Available Stock = Total Quantity - Unavailable Quantity
```

### Example Scenarios

**Scenario 1: Damaged Items**
- You have 100 bangles in stock
- 5 are damaged and can't be sold
- Set: Quantity = 100, Unavailable Quantity = 5
- Result: Customers can only buy 95 bangles

**Scenario 2: Reserved Items**
- You have 50 bangles in stock
- 10 are reserved for a special order
- Set: Quantity = 50, Unavailable Quantity = 10
- Result: Customers can only buy 40 bangles

**Scenario 3: Quality Control Hold**
- You have 200 bangles in stock
- 20 are being inspected for quality issues
- Set: Quantity = 200, Unavailable Quantity = 20
- Result: Customers can only buy 180 bangles

---

## Database Structure

### Tables Affected

#### 1. `products` table
```sql
- quantity (integer) - Total physical stock
- unavailable_quantity (integer, nullable, default: 0) - Stock not available for sale
```

#### 2. `product_variations` table
```sql
- quantity (integer) - Total physical stock for this variation
- unavailable_quantity (integer, nullable, default: 0) - Stock not available for sale for this variation
```

### Migration
File: `database/migrations/2025_09_12_194344_add_unavailable_quantity_to_products_and_product_variations.php`

Added `unavailable_quantity` column to both tables with:
- Type: integer
- Nullable: yes
- Default: 0
- Position: after 'quantity' column

---

## Backend Logic

### 1. Admin Product Controller (`app/Http/Controllers/admin/ProductController.php`)

#### Inventory Calculation (Line 174-188)
```php
// Calculate unavailable quantity (sum from variations or product level)
$unavailableQty = $product->variations->count() > 0
    ? $product->variations->sum('unavailable_quantity')
    : $product->unavailable_quantity ?? 0;

// Calculate total quantity
$totalQty = $product->variations->count() > 0
    ? $product->variations->sum('quantity')
    : $product->quantity ?? 0;

// Calculate available quantity (what customers can buy)
$availableQty = $totalQty - $unavailableQty;

// Return in product data
'available_quantity' => $availableQty ?? 0,
'unavailable_quantity' => $unavailableQty,
```

#### Validation Rules (Line 262-272)
```php
// For products with variations (bangles)
$rules['bangles.*.unavailable_quantity'] = 'nullable|integer';

// For simple products (no variations)
$rules['unavailable_quantity'] = 'nullable|integer';
```

#### Saving Data (Line 439-562)
```php
// For products with variations
$productData['unavailable_quantity'] = null; // Set to null at product level

// For each variation
'unavailable_quantity' => $bangle['unavailable_quantity'] ?? 0,

// For simple products
$productData['unavailable_quantity'] = $request->input('unavailable_quantity', 0);
```

### 2. Models

#### Product Model (`app/Models/Product.php`)
```php
protected $fillable = [
    // ... other fields
    'unavailable_quantity',
];
```

#### ProductVariation Model (`app/Models/ProductVariation.php`)
```php
protected $fillable = [
    // ... other fields
    'unavailable_quantity',
];
```

---

## Frontend Logic

### 1. Admin Product Form (`resources/views/admin/products/create.blade.php`)

#### Simple Product (No Variations) - Line 619
```html
<div class="col-md-2">
    <label>Unavailable Quantity</label>
    <input type="number" 
           name="unavailable_quantity" 
           value="{{ old('unavailable_quantity', $product->unavailable_quantity ?? 0) }}" 
           class="form-control">
</div>
```

#### Product with Variations (Bangles) - Line 660
```html
<!-- Server-side rendered (edit mode) -->
<input type="number" 
       name="bangles[{{ $i }}][unavailable_quantity]" 
       class="form-control" 
       placeholder="Unavailable Quantity" 
       value="{{ $var->unavailable_quantity ?: '' }}">
```

#### JavaScript Generated Rows - Line 1144
```javascript
<input type="number" 
       name="bangles[${banglesIndex}][unavailable_quantity]" 
       class="form-control" 
       placeholder="Unavailable Quantity" 
       value="${unavailable_quantity || ''}">
```

### 2. Product Detail Page (`resources/views/pages/product-detail.blade.php`)

#### Stock Calculation for Display - Line 239-240
```php
data-default-stock="{{
    $product->variations->isNotEmpty()
        ? (($product->variations->first()->quantity ?? 0) - ($product->variations->first()->unavailable_quantity ?? 0))
        : (($product->quantity ?? 0) - ($product->unavailable_quantity ?? 0))
}}"
```

#### Per Variation Stock - Line 267
```php
data-stock="{{ ($variation->quantity ?? 0) - ($variation->unavailable_quantity ?? 0) }}"
```

#### Simple Product Stock - Line 302
```php
data-stock="{{ ($product->quantity ?? 0) - ($product->unavailable_quantity ?? 0) }}"
```

### 3. Cart Page (`resources/views/pages/cart.blade.php`)

#### Available Stock Check - Line 772-773
```php
$availableStock = $item->variation
    ? (($item->variation->quantity ?? 0) - ($item->variation->unavailable_quantity ?? 0))
    : (($item->product->quantity ?? 0) - ($item->product->unavailable_quantity ?? 0));
```

This prevents customers from adding more items to cart than are actually available.

---

## Data Flow

### Creating/Editing a Product

1. **Admin enters data:**
   - Quantity: 100
   - Unavailable Quantity: 5

2. **Backend saves:**
   ```php
   products table:
   - quantity = 100
   - unavailable_quantity = 5
   ```

3. **Frontend displays:**
   ```php
   Available Stock = 100 - 5 = 95
   ```

4. **Customer sees:**
   - "95 in stock" on product page
   - Can only add up to 95 items to cart

### With Variations

1. **Admin enters data for each variation:**
   - Color: Gold, Size: 2.4, Quantity: 50, Unavailable: 3
   - Color: Gold, Size: 2.6, Quantity: 30, Unavailable: 2
   - Color: Silver, Size: 2.4, Quantity: 40, Unavailable: 0

2. **Backend saves:**
   ```php
   product_variations table:
   - variation 1: quantity = 50, unavailable_quantity = 3
   - variation 2: quantity = 30, unavailable_quantity = 2
   - variation 3: quantity = 40, unavailable_quantity = 0
   ```

3. **Frontend calculates per variation:**
   - Gold 2.4: 50 - 3 = 47 available
   - Gold 2.6: 30 - 2 = 28 available
   - Silver 2.4: 40 - 0 = 40 available

4. **Customer experience:**
   - Selects Gold 2.4 → sees "47 in stock"
   - Selects Gold 2.6 → sees "28 in stock"
   - Selects Silver 2.4 → sees "40 in stock"

---

## Admin Dashboard Display

File: `resources/views/admin/products/products.blade.php` (Line 102-105)

The products listing table shows the unavailable quantity column:
```javascript
{
    data: 'unavailable_quantity',
    name: 'unavailable_quantity',
    orderable: true
}
```

---

## Use Cases

### When to Use Unavailable Quantity

1. **Damaged Inventory**: Items that are damaged but still counted in physical inventory
2. **Reserved Stock**: Items reserved for special orders or VIP customers
3. **Quality Control**: Items being inspected or tested
4. **Returns Processing**: Items returned but not yet inspected/restocked
5. **Display Items**: Items used for display that can't be sold
6. **Pending Repairs**: Items that need repair before they can be sold

### When NOT to Use

1. **Sold Items**: These should reduce the total quantity, not increase unavailable quantity
2. **Shipped Items**: These should reduce the total quantity
3. **Permanently Lost**: These should reduce the total quantity

---

## Important Notes

1. **Default Value**: If not specified, defaults to 0 (all stock is available)
2. **Nullable**: Can be left empty in the form
3. **Validation**: Must be an integer if provided
4. **Calculation**: Always subtracted from total quantity to get available stock
5. **Per Variation**: Each color/size combination can have its own unavailable quantity
6. **Frontend Safety**: Prevents customers from buying more than available stock

---

## Summary

The Unavailable Quantity feature provides sophisticated inventory management by:
- Tracking physical stock separately from sellable stock
- Preventing overselling of damaged/reserved items
- Maintaining accurate inventory counts
- Providing flexibility for various business scenarios
- Working seamlessly with both simple products and variations
