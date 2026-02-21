# Product Creation Form - Field Explanations

## Complete Guide to All Fields in the Product Form

---

## Basic Information

### 1. Product Name
- **Purpose**: The display name of your product
- **Example**: "Gold Plated Bangle Set", "Silver Crystal Bangles"
- **Required**: Yes

### 2. SKU (Stock Keeping Unit)
- **Purpose**: Unique identifier for inventory tracking
- **Example**: "BNG-GOLD-001", "BNG-SILV-002"
- **Format**: Usually letters + numbers (your choice)
- **Required**: Optional but recommended

---

## Product Details

### 3. Care
- **Purpose**: Instructions on how customers should care for the product
- **Default Text**: "Keep your pieces shining by cleaning them after wear and storing them dry. Avoid water, harsh chemicals, and sleeping with jewelry on to prevent damage. Store items separately to prevent tangling or scratches."
- **When to Edit**: Customize based on product material (gold, silver, wood, etc.)

### 4. Sustainability
- **Purpose**: Information about eco-friendly practices and materials
- **Default Text**: "Banglez emphasizes conscious production: long-lasting plating, minimizing waste, and thoughtful material sourcing..."
- **When to Edit**: Highlight if product uses recycled materials, ethical sourcing, etc.

### 5. Shipping
- **Purpose**: Shipping policies and timeframes for this product
- **Default Text**: "Orders are usually shipped within 1–3 business days..."
- **When to Edit**: If product has special shipping requirements (fragile, oversized, etc.)

### 6. Returns
- **Purpose**: Return policy specific to this product
- **Default Text**: "Returns for online orders are accepted within 15 days..."
- **When to Edit**: If product is final sale or has special return conditions

---

## Product Classification & Organization

### 7. Material (Multi-select dropdown)
- **Purpose**: Tag products by what they're made of
- **Examples**: Gold, Silver, Brass, Wood, Acrylic, Enamel, Pearls
- **Why Empty**: You need to create materials first in the Tags/Materials section
- **How to Use**: Select one or more materials that apply to this product
- **Benefit**: Customers can filter products by material on your website

### 8. Style (Multi-select dropdown)
- **Purpose**: Tag products by design style/aesthetic
- **Examples**: Modern, Traditional, Bohemian, Minimalist, Vintage, Bridal
- **Why Empty**: You need to create styles first in the Tags/Styles section
- **How to Use**: Select one or more styles that describe this product
- **Benefit**: Customers can filter products by style preference

### 9. Catalogs (Multi-select dropdown)
- **Purpose**: Group products into collections/catalogs for marketing
- **Examples**: "Summer Collection", "Wedding Collection", "New Arrivals"
- **Why Empty**: You need to create collections first
- **How to Use**: Add product to one or more collections
- **Benefit**: Display products together on collection pages

### 10. Parent Category (Single select dropdown)
- **Purpose**: Main category for the product
- **Examples**: "Gold Bangles", "Silver Bangles", "Fashion Bangles"
- **Required**: Yes
- **How It Works**: This is the top-level category

### 11. Child Category (Optional - Single select dropdown)
- **Purpose**: Sub-category under the parent category
- **When It Appears**: Only shows after you select a Parent Category that has subcategories
- **Examples**: 
  - Parent: "Gold Bangles" → Child: "22K Gold", "18K Gold"
  - Parent: "Fashion Bangles" → Child: "Casual", "Party Wear"
- **How to Use**: 
  1. First select Parent Category
  2. If that parent has children, this dropdown will populate
  3. Optionally select a more specific child category
- **Leave Empty If**: The parent category is specific enough

### 12. Type Box
- **Purpose**: Specify if product comes in a special box/packaging
- **Examples**: "Standard Box", "Premium Gift Box", "Bridal Box"
- **Optional**: Can be left empty if no special packaging

---

## Description

### 13. Description (Large text area)
- **Purpose**: Detailed product description for customers
- **What to Include**:
  - Product features and benefits
  - What's included (e.g., "Set of 4 bangles")
  - Occasions to wear it
  - Unique selling points
- **Example**: "Beautiful set of 4 gold-plated bangles with intricate designs. Perfect for special occasions and daily wear. Each bangle features traditional craftsmanship with modern appeal."

---

## Shipping Information (Required for International Orders)

### 14. Shipping Weight
- **Purpose**: Product weight for shipping cost calculation
- **Format**: Number + Unit (grams, kg, oz, lbs)
- **Example**: 0.3 lbs, 150 grams
- **Required**: Yes
- **Why Important**: Carriers charge based on weight

### 15. Country of Origin
- **Purpose**: Where the product is manufactured
- **Format**: 2-letter country code
- **Examples**: IN (India), CN (China), US (United States)
- **Required**: Yes
- **Why Important**: Required for customs documentation on international shipments

### 16. HS Code (Harmonized System Code)
- **Purpose**: International customs classification code
- **Format**: 6-10 digits (no periods in database)
- **Default**: 7117907500 (for imitation jewelry/bangles)
- **Required**: Yes
- **Why Important**: 
  - Required for international shipping
  - Used by customs to classify goods
  - Determines duties and taxes
- **How to Find**: Click the "Find HS Code" link → https://hts.usitc.gov/
- **Common Codes**:
  - 7117907500 - Imitation jewelry (costume jewelry, fashion bangles)
  - 711319 - Real gold/silver jewelry

---

## Product Features & Visibility

### 17. Is Feature (Checkbox)
- **Purpose**: Mark product as "Featured"
- **Effect**: Product appears in featured products section on homepage/category pages
- **When to Use**: For bestsellers, new arrivals, or products you want to promote

### 18. Is Top Seller (Checkbox)
- **Purpose**: Mark product as "Top Seller" or "Best Seller"
- **Effect**: Product appears in top sellers section
- **When to Use**: For your most popular products

### 19. Is Pre-Order (Checkbox - Hidden by default)
- **Purpose**: Mark product as available for pre-order
- **Effect**: Customers can order before product is in stock
- **When to Use**: For upcoming products not yet available

---

## THE 7 FIELDS ABOVE "ADD MORE" BUTTON

These are **Product Variation Fields** - used when you have the same product in different colors/sizes:

### 1. Color (Dropdown)
- **Purpose**: Select the color variant
- **Example**: Gold, Silver, Rose Gold, Black
- **Why Empty**: You need to create colors first in the Product Colors section
- **Required**: Yes (when using variations)

### 2. Size (Text input)
- **Purpose**: Enter the size
- **Example**: "2.4", "2.6", "2.8" (for bangle sizes)
- **Format**: Free text - enter any size format you use

### 3. Quantity (Number)
- **Purpose**: How many units of this specific color/size combination you have in stock
- **Example**: 50, 100, 25
- **Required**: Yes

### 4. Unavailable Quantity (Number)
- **Purpose**: How many units are reserved/on hold (in carts, pending orders)
- **Example**: 5 (means 5 units are in customer carts but not yet purchased)
- **Usually**: Leave at 0, system manages this automatically

### 5. Price (Number with decimals)
- **Purpose**: Regular selling price for this variation
- **Example**: 89.99, 149.99
- **Required**: Yes

### 6. Discount Price (Number with decimals)
- **Purpose**: Original price before discount (shows as "Compare at" price)
- **Example**: If selling at $89.99, put $129.99 here to show savings
- **Optional**: Leave empty if no discount

### 7. Member Discount Price (Number with decimals)
- **Purpose**: Special price for members/logged-in customers
- **Example**: $79.99 (lower than regular price)
- **Optional**: Leave empty if no member pricing

---

## When to Use Product Variations

### Simple Product (No Variations)
- Product has only ONE version
- Example: A specific gold bangle set that comes in one color and one size
- **Don't click "Add More"** - just fill in the basic fields

### Product with Variations
- Product comes in multiple colors and/or sizes
- Example: Same bangle design available in Gold, Silver, Rose Gold
- **Click "Add More"** to add each color/size combination
- Each row represents one variation (e.g., Gold/Size 2.4, Silver/Size 2.6)

---

## SEO Fields (Bottom of Form)

### Meta Title
- **Purpose**: Title that appears in search engine results
- **Best Practice**: Include product name + key features
- **Example**: "Gold Plated Bangle Set - 4 Piece Traditional Design"
- **Length**: Keep under 60 characters

### Meta Description
- **Purpose**: Description that appears in search engine results
- **Best Practice**: Compelling description with keywords
- **Example**: "Beautiful 4-piece gold-plated bangle set with intricate traditional designs. Perfect for weddings and special occasions. Free shipping over $80."
- **Length**: Keep under 160 characters

---

## Images

### Product Images
- **How to Add**: Drag & drop or click the upload area
- **Multiple Images**: Yes, upload multiple angles/views
- **Image Alt Text**: Add descriptive text for each image (helps SEO and accessibility)
- **Edit Images**: Click the crop icon to edit/crop images before saving
- **Remove Images**: Click the X button to remove an image

---

## Quick Start Guide

### For a Simple Product (No Variations):

1. **Basic Info**: Enter Name and SKU
2. **Categories**: Select Parent Category (and Child if needed)
3. **Description**: Write product description
4. **Shipping**: Enter Weight, Country of Origin, HS Code
5. **Images**: Upload product photos
6. **Pricing**: Will be in the hidden section (scroll to find Quantity, Price fields)
7. **Optional**: Check "Is Feature" or "Is Top Seller" if applicable
8. **Save**: Click "Save Product"

### For a Product with Variations:

1. **Basic Info**: Enter Name and SKU
2. **Categories**: Select Parent Category
3. **Description**: Write product description
4. **Shipping**: Enter Weight, Country of Origin, HS Code (applies to all variations)
5. **Images**: Upload product photos
6. **Variations**: Click "Add More" for each color/size combination
   - Fill in all 7 fields for each variation
7. **Save**: Click "Save Product"

---

## Common Questions

**Q: Why are Material, Style, and Catalogs dropdowns empty?**
A: These are optional organizational features. You need to create them first in their respective admin sections (Tags/Materials, Tags/Styles, Collections).

**Q: Do I need to fill in all 7 variation fields?**
A: Only if your product has variations (different colors/sizes). For simple products, these fields are hidden.

**Q: What if I don't know the HS Code?**
A: Use the default 7117907500 for fashion jewelry/bangles. For real gold/silver, research the correct code at hts.usitc.gov.

**Q: Can I leave Child Category empty?**
A: Yes! It's optional. Only use it if you need more specific categorization.

**Q: What's the difference between Discount Price and Member Price?**
A: 
- Discount Price: Shows to everyone (crossed out original price)
- Member Price: Special lower price only for logged-in members

---

## Summary

The form has 3 main sections:
1. **Product Information**: Name, description, care instructions
2. **Organization**: Categories, materials, styles, collections
3. **Inventory & Pricing**: Stock, prices, variations
4. **Shipping**: Weight, origin, HS code (required for international)
5. **Marketing**: Featured, top seller, SEO fields
6. **Media**: Product images

Most fields have helpful default values. The key required fields are:
- Product Name
- Parent Category
- Shipping Weight + Unit
- Country of Origin
- HS Code
- At least one image
