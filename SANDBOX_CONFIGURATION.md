# Sandbox Configuration - Complete

## Current Configuration

### Environment: SANDBOX
- **API URL**: `https://sandbox.stallionexpress.ca/api/v4`
- **API Token**: `Apr!!!980`
- **Token Length**: 9 characters
- **Mode**: Test/Development

### Benefits of Sandbox
✅ No real charges - test freely
✅ Creates test labels with tracking numbers
✅ Full API functionality
✅ No credit requirements
✅ Safe for development and testing

## Configuration Files

### .env
```env
# Stallion Express Shipping Configuration (SANDBOX)
STALLION_API_URL=https://sandbox.stallionexpress.ca/api/v4
STALLION_API_TOKEN=Apr!!!980
```

### JavaScript (create-label.blade.php)
```javascript
is_draft: false  // False for sandbox - creates actual test labels
```

## Switching Between Sandbox and Production

### To Use SANDBOX (Current):
```env
STALLION_API_URL=https://sandbox.stallionexpress.ca/api/v4
STALLION_API_TOKEN=Apr!!!980
```

### To Use PRODUCTION:
```env
STALLION_API_URL=https://ship.stallionexpress.ca/api/v4
STALLION_API_TOKEN=qiMjcuAiYcvsGaKcVOMg4ENXMXtWJCLmIcjqq1y6BYsVW29Yv2W37vkdfsfv
```

**Important**: After changing, run:
```bash
docker exec banglz_app php artisan cache:clear
docker exec banglz_app php artisan config:clear
docker-compose restart app
```

## Testing the Sandbox

### 1. Verify Configuration
```bash
docker exec banglz_app php check-token.php
```

Expected output:
```
Token from config: Apr!!!980
Token length: 9
Base URL: https://sandbox.stallionexpress.ca/api/v4
```

### 2. Test Rate Fetching
1. Go to: `http://localhost:8000/admin/orders`
2. Click on order ORD-0021
3. Click "Create Shipping Label"
4. Rates should load from sandbox API

### 3. Test Label Creation
1. Select a shipping rate
2. Click "Buy Label"
3. Should create a test label without charges
4. Will receive:
   - Test tracking number
   - Test label PDF URL
   - Order status updated to "processing"

## Sandbox vs Production Differences

| Feature | Sandbox | Production |
|---------|---------|------------|
| API URL | sandbox.stallionexpress.ca | ship.stallionexpress.ca |
| Token | Apr!!!980 | qiMjcuAi... (60 chars) |
| Charges | ❌ No charges | ✅ Real charges |
| Credits Required | ❌ No | ✅ Yes |
| Tracking Numbers | Test numbers | Real tracking |
| Labels | Test labels | Real labels |
| Carrier Integration | Simulated | Real carriers |

## Sandbox Limitations

⚠️ **Note**: Sandbox labels are for testing only:
- Tracking numbers won't work with real carriers
- Labels can't be used for actual shipping
- Some carrier-specific features may be simulated
- Rate calculations may differ slightly from production

## Common Sandbox Test Scenarios

### Test Addresses
The sandbox accepts any valid address format. Use test orders:
- ORD-0021: New York, US
- ORD-0022: Toronto, CA
- ORD-0023: London, GB
- ORD-0024: San Francisco, US

### Test Postage Types
All postage types available in production work in sandbox:
- USPS First Class Mail
- USPS Priority Mail
- PostNL International Packet Tracked
- FedEx Ground
- etc.

### Test Label Formats
- `pdf` - Standard PDF (default)
- `zpl` - Zebra printer format
- `png` - Image format

## Troubleshooting

### Issue: Still getting "insufficient credits" error
**Solution**: 
1. Verify .env has sandbox URL
2. Clear cache: `docker exec banglz_app php artisan config:clear`
3. Restart: `docker-compose restart app`
4. Hard refresh browser: `Ctrl+Shift+R`

### Issue: 401 Unauthenticated
**Solution**: 
1. Check token is exactly: `Apr!!!980`
2. No extra spaces or characters
3. Clear config cache

### Issue: Different rates than production
**Expected**: Sandbox may return different rates for testing purposes

## Production Deployment Checklist

Before going live, update:
- [ ] Change `STALLION_API_URL` to production
- [ ] Change `STALLION_API_TOKEN` to production token
- [ ] Ensure production account has credits
- [ ] Test with small order first
- [ ] Verify tracking numbers work
- [ ] Test label printing

## Status

✅ **SANDBOX CONFIGURED AND READY**

You can now test the complete shipping label workflow without any charges!
