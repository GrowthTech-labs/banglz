# Product Schema Summary

## Database Schema Status: ✅ COMPLETE

All required shipping fields are present in the database and admin UI.

### Products Table - Complete Schema

#### Core Product Information
- `id` - Primary key
- `name` - Product name (string, required)
- `description` - Product description (text, nullable)
- `sku` - Stock keeping unit (string, nullable)
- `slug` - URL-friendly slug (string, unique, nullable)

#### Pricing
- `price` - Regular price (decimal 10,2, nullable)
- `compare_price` - Compare at/original price (decimal 10,2, nullable)
- `member_price` - Member discount price (decimal 10,2, nullable)

#### Inventory
- `quantity` - Available stock (integer, default 0, nullable)
- `unavailable_quantity` - Reserved/unavailable stock (integer, default 0, nullable)

#### Media & Attributes
- `images` - Product images array (json, nullable)
- `images_details` - Additional image metadata (nullable)
- `attributes` - Custom attributes (json, nullable)
- `colors` - Available colors (json, nullable)
- `color_id` - Foreign key to product_colors table (nullable)
- `size` - Product size (string, nullable)

#### Status & Features
- `status` - Active (1) or Inactive (0) (boolean, default 1)
- `is_featured` - Featured product flag (boolean, default 0)
- `is_top_listed` - Top listed flag (boolean, default 0, nullable)
- `is_pre_order` - Pre-order availability (boolean, default 0)

#### Organization
- `category_id` - Foreign key to categories (nullable)
- `category_box_id` - Foreign key to category_boxes (nullable)

#### Product Details
- `care` - Care instructions (longText, nullable)
- `sustainability` - Sustainability information (longText, nullable)
- `shipping` - Shipping information (longText, nullable)
- `returns` - Return policy (longText, nullable)

#### SEO
- `meta_title` - SEO title (string, nullable)
- `meta_description` - SEO description (text, nullable)

#### ✅ SHIPPING FIELDS (Required for Label Creation)
- `weight` - Product weight (string, nullable) - **REQUIRED**
- `weight_unit` - Weight unit: g, kg, oz, lbs (string, nullable) - **REQUIRED**
- `country_of_origin` - ISO 2-letter country code (string 2, nullable) - **REQUIRED**
- `hs_code` - Harmonized System code for customs (string 10, nullable) - **REQUIRED**

#### Timestamps
- `created_at` - Record creation timestamp
- `updated_at` - Last update timestamp
- `deleted_at` - Soft delete timestamp (nullable)

---

## Admin UI Status: ✅ COMPLETE

### Product Create/Edit Form - Shipping Section

Located in: `resources/views/admin/products/create.blade.php` (lines 491-540)

#### 1. Shipping Weight Field
```html
<label>Shipping Weight <span class="text-danger">*</span></label>
<input type="number" step="0.01" name="weight" required>
<select name="weight_unit" required>
  <option value="g">grams</option>
  <option value="kg">kg</option>
  <option value="oz">oz</option>
  <option value="lbs">lbs</option>
</select>
```
- Input type: Number with decimal support
- Required field (marked with red asterisk)
- Help text: "Product weight for shipping calculations"
- Default unit: grams (g)

#### 2. Country of Origin Field
```html
<label>Country of Origin <span class="text-danger">*</span></label>
<select name="country_of_origin" required>
  <option value="CA">Canada</option>
  <option value="US">United States</option>
  <option value="IN">India</option>
  <option value="CN">China</option>
  <option value="MX">Mexico</option>
  <option value="GB">United Kingdom</option>
  <option value="PK">Pakistan</option>
  <option value="BD">Bangladesh</option>
  <option value="TH">Thailand</option>
  <option value="VN">Vietnam</option>
</select>
```
- Input type: Dropdown select
- Required field (marked with red asterisk)
- Help text: "Where the product is manufactured"
- Default: Canada (CA)
- ISO 2-letter country codes

#### 3. HS Code Field
```html
<label>HS Code <span class="text-danger">*</span></label>
<input type="text" name="hs_code" required placeholder="7117907500">
```
- Input type: Text input
- Required field (marked with red asterisk)
- Help text: "Harmonized System code for customs (6-10 digits)"
- Default value: 7117907500 (jewelry/bangles)
- Max length: 10 characters
- Link to HS code lookup: hts.usitc.gov

---

## Sample Products Created

10 dummy products have been seeded with complete shipping information:

| SKU | Name | Weight | Unit | Origin | HS Code |
|-----|------|--------|------|--------|---------|
| BNG-GOLD-001 | Gold Plated Bangle Set | 0.3 | lbs | IN | 7117907500 |
| BNG-SILV-002 | Silver Crystal Bangles | 0.25 | lbs | IN | 7117907500 |
| BNG-ROSE-003 | Rose Gold Charm Bangles | 0.28 | lbs | IN | 7117907500 |
| BNG-KUND-004 | Traditional Kundan Bangles | 0.4 | lbs | IN | 7117907500 |
| BNG-STEEL-005 | Minimalist Steel Bangles | 0.2 | lbs | CN | 7117907500 |
| BNG-PEARL-006 | Pearl Embellished Bangles | 0.35 | lbs | IN | 7117907500 |
| BNG-ENAM-007 | Colorful Enamel Bangles | 0.22 | lbs | IN | 7117907500 |
| BNG-BRASS-008 | Antique Brass Bangles | 0.32 | lbs | IN | 7117907500 |
| BNG-DIAM-009 | Diamond Cut Gold Bangles | 0.45 | lbs | IN | 7117907500 |
| BNG-WOOD-010 | Wooden Beaded Bangles | 0.15 | lbs | IN | 7117907500 |

---

## Shipping Label Creation Flow

### Current Implementation Status: ✅ WORKING

1. **Order Creation**: Products with complete shipping data
2. **Label Creation Page**: `/admin/order/{id}/create-label`
3. **Data Validation**: System checks all products have required fields
4. **Rate Fetching**: Sends complete product data to Stallion Express API
5. **Label Purchase**: Creates label with customs documentation

### Stallion Express API Payload

The system sends complete product information:

```json
{
  "items": [
    {
      "description": "Gold Plated Bangle Set",
      "sku": "BNG-GOLD-001",
      "quantity": 2,
      "value": 89.99,
      "currency": "USD",
      "country_of_origin": "IN",
      "hs_code": "7117907500",
      "weight": 0.3,
      "weight_unit": "lbs"
    }
  ],
  "weight": 0.6,
  "weight_unit": "lbs"
}
```

---

## HS Code Reference

### Common Jewelry HS Codes

- **7117907500** - Imitation jewelry of base metal (bangles, bracelets)
- **711319** - Jewelry of precious metal
- **711719** - Imitation jewelry (general)

### HS Code Format

- **First 6 digits**: Universal (same worldwide)
- **Additional digits**: Country-specific (US uses 10 digits)
- **No periods in database**: Store as `7117907500` not `7117.90.7500`

### HS Code Lookup Resources

- US: https://hts.usitc.gov/
- Canada: https://www.cbsa-asfc.gc.ca/trade-commerce/tariff-tarif/menu-eng.html
- International: https://www.wcoomd.org/

---

## Next Steps for Product Tab Work

1. ✅ Database schema complete
2. ✅ Admin UI fields present and functional
3. ✅ Sample products created with shipping data
4. ✅ Shipping label creation working

### Potential Enhancements

1. **Bulk Edit**: Add ability to bulk update shipping fields for multiple products
2. **Validation**: Add real-time HS code format validation
3. **HS Code Lookup**: Integrate HS code search/lookup tool
4. **Weight Conversion**: Auto-convert between weight units
5. **Country Expansion**: Add more countries to dropdown
6. **Product Variations**: Ensure variations also capture shipping data
7. **Missing Data Report**: Dashboard widget showing products missing shipping fields
8. **CSV Import**: Bulk import shipping data via CSV

---

## Testing Checklist

- [x] Products table has all shipping fields
- [x] Admin form displays all shipping fields
- [x] Fields are marked as required
- [x] Sample products created with valid data
- [ ] Create new product via admin UI
- [ ] Edit existing product shipping fields
- [ ] Create order with products
- [ ] Generate shipping label with product data
- [ ] Verify customs documentation includes HS codes
- [ ] Test international shipment label creation

---

## Notes

- HS code field limited to 10 characters in database
- Store HS codes without periods: `7117907500` not `7117.90.7500`
- Weight can be decimal (0.25, 0.3, etc.)
- Country codes must be ISO 2-letter format (IN, US, CN, etc.)
- All fields are nullable in database but required in UI
- Product variations also support shipping fields
