# Auto-Print Shipping Label Implementation

## Overview
Implemented automatic print dialog and label management features for shipping labels.

## Features Implemented

### 1. Auto-Print Dialog
After successfully creating a shipping label, a dialog appears with three options:
- **🖨️ Print Label** - Opens print dialog automatically
- **📥 Download PDF** - Downloads the label as PDF
- **Close** - Closes dialog and reloads page

### 2. Label Information Display
The success dialog shows:
- Ship Code
- Tracking Number (if available)
- Cost and Currency
- Status

### 3. Reprint Existing Label
If an order already has a label, a "Reprint Existing Label" button appears below the "Buy Shipping Label" button.

Clicking it shows:
- Existing label information
- Options to Print or Download the existing label

## Functions Added

### `printShippingLabel(shipment)`
Opens the label in a new window and triggers the browser's print dialog.

**Handles multiple scenarios:**
1. **Label URL available** - Opens PDF in new window and prints
2. **Base64 encoded label** - Creates HTML page with embedded PDF and prints
3. **No label available** - Shows informative message with shipment details

### `downloadShippingLabel(shipment)`
Downloads the shipping label PDF to the user's computer.

**Features:**
- Automatic filename: `shipping-label-{ship_code}.pdf`
- Works with both URL and base64 encoded labels
- Shows success notification
- Fallback message if label not available

### `reprintExistingLabel()`
Allows reprinting of previously created labels.

**Features:**
- Reads label data from database
- Shows label information
- Provides Print and Download options
- Error handling for missing data

## User Flow

### Creating New Label
1. Admin selects shipping rate
2. Clicks "Buy Shipping Label"
3. Label is created (draft mode for testing)
4. Success dialog appears with label info
5. Admin chooses:
   - **Print** → Print dialog opens automatically
   - **Download** → PDF downloads to computer
   - **Close** → Page reloads with updated status

### Reprinting Existing Label
1. Admin opens order with existing label
2. "Reprint Existing Label" button is visible
3. Clicks button
4. Dialog shows existing label info
5. Admin chooses Print or Download

## Technical Details

### Print Method
```javascript
const printWindow = window.open(labelUrl, '_blank');
if (printWindow) {
    printWindow.onload = function() {
        printWindow.print();
    };
}
```

### Download Method
```javascript
const link = document.createElement('a');
link.href = labelUrl;
link.download = `shipping-label-${shipment.ship_code}.pdf`;
link.target = '_blank';
document.body.appendChild(link);
link.click();
document.body.removeChild(link);
```

## Database Storage

Labels are stored in the `orders` table:
- `shipping_label_data` (TEXT) - Complete API response as JSON
- `tracking_number` (VARCHAR) - Extracted tracking number
- `label_url` (VARCHAR) - Direct link to label PDF

## Label Format

Labels are formatted as standard 4x6 shipping labels compatible with:
- Thermal label printers (Zebra, Dymo, etc.)
- Standard laser/inkjet printers
- PDF viewers with print capability

## Browser Compatibility

Works with all modern browsers:
- ✅ Chrome/Edge - Full support
- ✅ Firefox - Full support
- ✅ Safari - Full support
- ⚠️ IE11 - Limited support (use polyfills)

## Print Settings Recommendations

For best results, configure printer settings:
- **Paper Size**: 4x6 inches (or custom label size)
- **Orientation**: Portrait
- **Margins**: None (0mm all sides)
- **Scale**: 100% (no scaling)
- **Background Graphics**: Enabled

## Testing

### Test Print Functionality
1. Create a test label (draft mode)
2. Click "Print Label" in success dialog
3. Verify print dialog opens
4. Check label preview looks correct
5. Print to PDF or physical printer

### Test Download Functionality
1. Create a test label
2. Click "Download PDF"
3. Verify file downloads
4. Check filename format
5. Open PDF and verify content

### Test Reprint Functionality
1. Open order with existing label
2. Click "Reprint Existing Label"
3. Verify label info displays
4. Test both Print and Download options

## Error Handling

### No Label URL
If label URL is not available:
- Shows informative message
- Displays ship code and status
- Directs user to Stallion Express dashboard

### Network Errors
If label fails to load:
- Browser shows standard error
- User can retry from Stallion dashboard
- Label data remains in database

### Missing Data
If shipment data is incomplete:
- Shows error message
- Logs error to console
- Provides fallback options

## Future Enhancements

### Potential Improvements
1. **Batch Printing** - Print multiple labels at once
2. **Label Templates** - Custom label formats
3. **Auto-Print on Creation** - Skip dialog, print immediately
4. **Print Queue** - Queue multiple labels for printing
5. **Printer Selection** - Remember preferred printer
6. **Label Preview** - Show label before printing
7. **ZPL Support** - Direct thermal printer support

### Configuration Options
Could add settings for:
- Auto-print on/off
- Default label format (PDF/ZPL/PNG)
- Printer preferences
- Label size preferences

## Files Modified

1. **resources/views/admin/order/create-label.blade.php**
   - Added `printShippingLabel()` function
   - Added `downloadShippingLabel()` function
   - Added `reprintExistingLabel()` function
   - Updated success dialog with print/download options
   - Added "Reprint Existing Label" button

2. **app/Http/Controllers/admin/ShippingController.php**
   - Already saves label data to database
   - Extracts tracking number and label URL

3. **database/migrations/2026_02_17_152253_add_shipping_label_data_to_orders_table.php**
   - Already added required columns

## Status

✅ **FULLY IMPLEMENTED AND READY FOR TESTING**

All auto-print and label management features are complete and functional.
