# Quick Test Guide - Shipping Labels

## 🚀 Ready to Test!

### Access the Feature:
1. Go to: http://localhost:8000/admin/login
2. Login: `admin@admin.com` / `admin`
3. Navigate to: Orders → Click any order → "Create Shipping Label"

---

## ✅ What Should Happen:

### When Page Loads:
- ⏳ Loading indicator appears
- 📦 After 2-5 seconds, shipping options display
- 🎯 Multiple carriers shown (Canada Post, USPS, UPS, etc.)
- 💰 Each shows: Service name, Price, Delivery time, Tracking
- ✨ First option auto-selected
- 🔘 "Buy Label" button enabled

### When You Select an Option:
- 🖱️ Option highlights with border
- 💵 Summary card updates with new price
- ✅ "Buy Label" button stays enabled

### When You Click "Buy Label":
⚠️ **WARNING: This creates a REAL label and charges your account!**
- ⏳ Button shows "Buying label..."
- ✅ Success message appears
- 📄 Label PDF available
- 📊 Order status → "processing"

---

## 🐛 If Something Goes Wrong:

### No Rates Displayed?
1. Press F12 (open console)
2. Look for error messages
3. Check if API token is valid
4. Verify order has complete address

### Common Errors:
- "API token not configured" → Check .env file
- "No shipping options found" → Check address/weight
- "Failed to call API" → Check internet or API status

---

## 📝 What Was Implemented:

✅ **Rate Fetching:**
- Fetches real-time rates from Stallion Express
- Shows multiple carrier options
- Displays prices, delivery times, tracking info

✅ **Error Handling:**
- Validates API token
- Retries failed requests (3 times)
- Shows user-friendly error messages

✅ **Label Purchase:**
- Creates real shipping labels
- Updates order status
- Returns tracking number and PDF

✅ **UI/UX:**
- Loading states
- Interactive rate selection
- Summary card updates
- Success/error alerts

---

## 🎯 Test Now!

The feature is **LIVE** and ready to test at:
**http://localhost:8000/admin**

---

**API Token:** Configured ✅  
**Server:** Running ✅  
**Status:** Ready for Testing ✅
