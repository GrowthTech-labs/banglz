# How to Test Shipping Labels - Step by Step Guide

## 📍 Where to Find the Feature

The "Create Shipping Label" feature is located in the **Orders** section of the admin panel.

---

## 🎯 Step-by-Step Instructions

### Step 1: Login to Admin Panel
1. Open your browser
2. Go to: **http://localhost:8000/admin/login**
3. Enter credentials:
   - **Email:** `admin@admin.com`
   - **Password:** `admin`
4. Click "Login"

---

### Step 2: Navigate to Orders
1. After login, you'll see the admin dashboard
2. Look at the **left sidebar menu**
3. Click on **"Orders"** (it has a plots/chart icon)
   - This will take you to: `http://localhost:8000/admin/orders`

---

### Step 3: View Order Details
1. You'll see a list/table of all orders
2. **Click on any order** in the list to view its details
   - This opens the order details page
   - URL will be something like: `http://localhost:8000/admin/customers/orders/{order-id}`

---

### Step 4: Find the "Create Shipping Label" Button
1. On the order details page, look for the **"Create shipping label"** button
2. **Location:** Usually in the top-right area of the order details section
3. **Note:** This button only appears if:
   - ✅ Order status is "pending"
   - ❌ Button won't show if order is already "processing", "shipped", or "completed"

---

### Step 5: Click "Create Shipping Label"
1. Click the **"Create shipping label"** button
2. You'll be taken to the shipping label creation page
   - URL: `http://localhost:8000/admin/create-lable/{order-id}`

---

### Step 6: Watch the Magic Happen! ✨

**What You Should See:**

#### A. Page Loads
- Form with shipping details (address, weight, dimensions)
- A section titled "Shipping service"
- Loading indicator appears

#### B. After 2-5 Seconds
- **Shipping options appear!** 🎉
- You'll see multiple cards/options like:

```
┌─────────────────────────────────────────────┐
│ 📦 Canada Post - Expedited Parcel          │
│ 💰 $23.63 CAD                              │
│ ⏱️  3-5 days                                │
│ ✓ Includes tracking                        │
└─────────────────────────────────────────────┘

┌─────────────────────────────────────────────┐
│ 📦 Canada Post - Priority                  │
│ 💰 $36.75 CAD                              │
│ ⏱️  1-2 days                                │
│ ✓ Includes tracking                        │
└─────────────────────────────────────────────┘

┌─────────────────────────────────────────────┐
│ 📦 USPS - First Class                      │
│ 💰 $18.50 USD                              │
│ ⏱️  5-7 days                                │
│ ✓ Includes tracking                        │
└─────────────────────────────────────────────┘
```

#### C. Summary Card Updates
- On the right side, you'll see a summary showing:
  - Subtotal
  - Taxes
  - Total cost
- This updates when you select different options

#### D. "Buy Shipping Label" Button
- At the bottom, the **"Buy Shipping Label"** button becomes enabled
- It's initially disabled until rates load

---

### Step 7: Select a Shipping Option
1. **Click on any shipping option card**
2. The selected card will highlight with a border
3. The summary card on the right updates with the new price
4. The "Buy Shipping Label" button stays enabled

---

### Step 8: Purchase Label (Optional - Creates Real Label!)

⚠️ **WARNING: This will create a REAL shipping label and charge your Stallion Express account!**

**Only do this if you want to create an actual label.**

1. Click the **"Buy Shipping Label"** button
2. Button text changes to "Buying label..."
3. After 3-10 seconds:
   - ✅ Success message appears (green alert)
   - 📄 Label PDF URL is provided
   - 📊 Order status updates to "processing"
   - 🔢 Tracking number is saved

---

## 🔍 What If I Don't See Orders?

### Option A: Check if Orders Exist
1. Go to: **http://localhost:8000/admin/orders**
2. If the table is empty, you need to create a test order

### Option B: Create a Test Order
1. Go to the **frontend website**: http://localhost:8000
2. Browse products and add items to cart
3. Proceed to checkout
4. Fill in shipping address
5. Complete the order
6. Go back to admin panel → Orders
7. You should now see the new order

### Option C: Check Database
If you're not sure if orders exist:
1. Go to: **http://localhost:8080** (phpMyAdmin)
2. Login with:
   - Username: `root`
   - Password: `root`
3. Select database: `banglz`
4. Click on table: `orders`
5. Check if there are any records

---

## 🐛 Troubleshooting

### Issue: "Create Shipping Label" Button Not Visible

**Possible Reasons:**
1. **Order status is not "pending"**
   - Button only shows for pending orders
   - Check order status in the order details

2. **You're looking at the wrong page**
   - Make sure you're on the order details page, not the orders list

3. **Button is hidden by CSS**
   - Try zooming out or checking on a larger screen

**Solution:**
- Find an order with status "pending"
- Or change an order's status to "pending" in the database

---

### Issue: No Shipping Options Displayed

**What to Check:**
1. **Open Browser Console** (Press F12)
2. Look for error messages in the Console tab
3. Check the Network tab for API responses

**Common Errors:**
- "API token not configured" → Check `.env` file
- "Failed to call Stallion API" → API token might be invalid
- "No shipping options found" → Address or weight might be missing

**Quick Fix:**
1. Verify `.env` has: `STALLION_API_TOKEN=X8PQRjVFKOZaU9aXfvzDcYpTaaxWU4H5zYAXUbbu2xfCfIIZG8RNZ9UpadUy`
2. Restart Docker: `docker-compose restart app`
3. Try again

---

### Issue: Rates Take Too Long to Load

**Expected Time:** 2-5 seconds  
**If longer than 10 seconds:**
- Check your internet connection
- Check if Stallion Express API is down
- Look for errors in browser console

---

## 📊 Visual Navigation Map

```
Admin Login (http://localhost:8000/admin/login)
    ↓
Admin Dashboard
    ↓
Left Sidebar → Click "Orders"
    ↓
Orders List Page (http://localhost:8000/admin/orders)
    ↓
Click on any order row
    ↓
Order Details Page (http://localhost:8000/admin/customers/orders/{id})
    ↓
Click "Create shipping label" button (top-right area)
    ↓
Shipping Label Creation Page (http://localhost:8000/admin/create-lable/{id})
    ↓
🎉 Shipping options appear automatically!
```

---

## ✅ Quick Test Checklist

- [ ] Can login to admin panel
- [ ] Can see "Orders" in left sidebar
- [ ] Can click on "Orders" menu item
- [ ] Can see list of orders
- [ ] Can click on an order to view details
- [ ] Can see "Create shipping label" button (if order is pending)
- [ ] Can click "Create shipping label" button
- [ ] Page loads with shipping form
- [ ] Shipping options appear after a few seconds
- [ ] Can see multiple carrier options
- [ ] Can see prices, delivery times, tracking info
- [ ] Can click on different options
- [ ] Summary card updates when selecting options
- [ ] "Buy Shipping Label" button is enabled

---

## 🎯 Direct URLs (After Login)

If you want to jump directly to specific pages:

1. **Orders List:**
   ```
   http://localhost:8000/admin/orders
   ```

2. **Order Details:** (replace {id} with actual order ID)
   ```
   http://localhost:8000/admin/customers/orders/{id}
   ```

3. **Create Shipping Label:** (replace {id} with actual order ID)
   ```
   http://localhost:8000/admin/create-lable/{id}
   ```

**Example with Order ID 1:**
```
http://localhost:8000/admin/create-lable/1
```

---

## 📸 What to Look For

### On Order Details Page:
- Look for a button that says **"Create shipping label"**
- It's usually styled as a blue/primary button
- Located near other action buttons like "Fulfill items"

### On Shipping Label Page:
- **Top:** Page title "Create shipping label"
- **Left Side:** Form with address, weight, dimensions
- **Middle/Right:** "Shipping service" section with rate options
- **Bottom:** "Buy Shipping Label" button

---

## 🆘 Still Can't Find It?

**Try this direct approach:**

1. Make sure you're logged in as admin
2. Copy and paste this URL directly:
   ```
   http://localhost:8000/admin/orders
   ```
3. If you see orders, click on any one
4. Look for the "Create shipping label" button

**If still not visible:**
- The order might not have status "pending"
- Check the order status in the database
- Or create a new test order from the frontend

---

## 💡 Pro Tip

**To quickly test without a real order:**

You can try accessing the create-label page directly with a test order ID:
```
http://localhost:8000/admin/create-lable/1
```

If order ID 1 doesn't exist, try 2, 3, etc. until you find a valid order.

---

**Need Help?** Check the browser console (F12) for error messages!

**Feature Status:** ✅ Fully Implemented and Ready to Test
