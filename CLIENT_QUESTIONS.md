# Questions for Client - Banglz Shipping & Catalog Fixes

## 🔴 URGENT: Information Needed to Proceed

Hi [Client Name],

We've analyzed the issues with shipping label creation, dashboard, and catalog management. To implement the fixes, we need the following information from you:

---

## 1. Stallion Express API Access

### API Credentials
- **Production API Token:** What is your live Stallion Express API token?
  - Current `.env` file has a placeholder - we need the real token
  
- **Test/Sandbox Environment:** Does Stallion Express provide a test environment?
  - If YES: Please provide sandbox URL and test API token
  - If NO: We'll create a mock mode for safe testing

### API Documentation
- Do you have access to Stallion Express API documentation?
- Can you share it with us or grant us access?

---

## 2. Shipping Configuration

### Your Business Address (Ship From)
We need your default shipping origin address:
- Business/Company Name: _______________
- Street Address: _______________
- City: _______________
- Province/State: _______________
- Postal/ZIP Code: _______________
- Country: _______________
- Phone Number: _______________
- Email: _______________

### Package Defaults
What are typical dimensions for your jewelry packages?
- Default Length: _______ cm/inches
- Default Width: _______ cm/inches
- Default Height: _______ cm/inches
- Default Packaging Weight: _______ grams

### Carriers
Which shipping carriers do you use through Stallion Express?
- [ ] USPS
- [ ] UPS
- [ ] FedEx
- [ ] Canada Post
- [ ] Other: _______________

### Insurance
- Should high-value orders automatically include insurance?
- If yes, what's the threshold amount? $_______________

---

## 3. Product Shipping Data

### Current Products Issue
Your existing products in the database are missing:
- Shipping weight (we found this field exists but may be empty)
- Country of Origin
- HS Code (Harmonized System code for customs)

### How Should We Handle Existing Products?

**Option A: Set Default Values**
- Set all products to default weight (e.g., 50 grams)
- Set all products to default origin (e.g., Canada)
- Set all products to default HS code (e.g., 7117907500 for imitation jewelry)
- Admin can update individual products later

**Option B: Mark as Incomplete**
- Flag all existing products as "missing shipping data"
- Admin must manually enter data for each product
- Products cannot be shipped until data is complete

**Option C: Block Orders**
- Products without shipping data cannot be added to cart
- Forces immediate data entry

**Which option do you prefer?** _______________

### Product Details
- **Country of Origin:** Where are most of your products manufactured?
  - [ ] Canada
  - [ ] India
  - [ ] China
  - [ ] USA
  - [ ] Other: _______________

- **HS Codes:** Do all your products use the same HS code?
  - If YES: What code? _______________
  - If NO: Do different product types need different codes?
    - Bangles: _______________
    - Necklaces: _______________
    - Earrings: _______________

**Common HS Codes for Jewelry:**
- 7117.19.00 - Imitation jewelry of base metal
- 7117.90.75 - Imitation jewelry, other
- 7113.19.50 - Jewelry of precious metal

---

## 4. Dashboard Requirements

### What Metrics Do You Want to See?
Please check all that apply:

**Order Metrics:**
- [ ] Total orders today
- [ ] Total orders this week
- [ ] Total orders this month
- [ ] Total orders all time
- [ ] Orders by status (pending, processing, shipped, delivered)

**Financial Metrics:**
- [ ] Revenue today
- [ ] Revenue this week
- [ ] Revenue this month
- [ ] Revenue all time
- [ ] Profit margins
- [ ] Average order value

**Product Metrics:**
- [ ] Top 5 selling products
- [ ] Top 10 selling products
- [ ] Low stock alerts
- [ ] Out of stock products

**Customer Metrics:**
- [ ] New customers this week
- [ ] Total customers
- [ ] Repeat customer rate

### Date Range Filters
Which filters do you want?
- [ ] Today
- [ ] This Week
- [ ] This Month
- [ ] This Year
- [ ] Custom Date Range
- [ ] Compare to Previous Period

### Chart Preferences
- [ ] Line charts (for trends over time)
- [ ] Bar charts (for comparisons)
- [ ] Pie charts (for distributions)
- [ ] No preference - developer decides

---

## 5. Catalog Management

### Current Setup
Your catalog page has three main categories:
1. Bangles
2. Necklaces
3. Earrings
Plus a "Most Gifted" section

### Questions:

**Are these categories fixed?**
- [ ] Yes, always these three categories
- [ ] No, I want to be able to add/remove categories

**What should be editable for each category?**
- [ ] Category name
- [ ] Category description
- [ ] Hero/banner image
- [ ] Display order
- [ ] SEO meta title and description
- [ ] Other: _______________

**What is "Most Gifted"?**
- [ ] A special collection I manage separately
- [ ] An automatic list of best-selling products
- [ ] A curated list I want to manage
- [ ] Other: _______________

---

## 6. Testing & Deployment

### Testing Environment
- Do you have a staging/test website where we can test changes?
  - If YES: URL: _______________
  - If NO: We'll test on local development environment

### Deployment Timing
- When would you like these fixes deployed?
  - [ ] ASAP (as soon as ready)
  - [ ] Specific date: _______________
  - [ ] After review and approval

### Training
- Will you need training on the new admin features?
  - [ ] Yes, please provide documentation
  - [ ] Yes, please provide video walkthrough
  - [ ] Yes, please provide live training session
  - [ ] No, documentation is sufficient

---

## 7. Budget & Timeline

### Estimated Timeline
Based on your responses, we estimate:
- **Development:** 5-6 days
- **Testing:** 1 day
- **Deployment:** 0.5 day
- **Total:** 6-7 business days from receiving your answers

### Phases
1. Add shipping fields to products (0.5 day)
2. Update admin product forms (1 day)
3. Fix shipping label creation (1.5 days)
4. Fix dashboard with real data (1 day)
5. Add catalog management (1 day)
6. Testing & QA (1 day)

**Does this timeline work for you?** _______________

---

## 8. Additional Questions

### Priority
Which issue is most critical for your business?
1. _______________
2. _______________
3. _______________

### Current Workarounds
Are you currently using any workarounds for these issues?
- Shipping labels: _______________
- Dashboard: _______________
- Catalog management: _______________

### Future Enhancements
Are there any related features you'd like us to consider for future phases?
- _______________
- _______________

---

## Next Steps

1. **Please fill out this document** with your answers
2. **Provide Stallion Express API credentials** (via secure method)
3. **We'll review your responses** and confirm the implementation plan
4. **We'll begin development** immediately after confirmation

**Questions?** Feel free to ask for clarification on any of these items.

---

**Document Prepared:** February 11, 2026  
**Prepared By:** Development Team  
**Project:** Banglz E-commerce Platform - Shipping & Catalog Fixes
