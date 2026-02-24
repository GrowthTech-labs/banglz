# Stripe Test Card Numbers - Quick Reference

## Basic Test Card (Always Use This First)

```
Card Number: 4242 4242 4242 4242
Expiry:      12/25 (any future date)
CVC:         123 (any 3 digits)
ZIP:         12345 (any 5 digits)
```

## Successful Payment Cards

| Card Brand | Number | Description |
|------------|--------|-------------|
| Visa | `4242 4242 4242 4242` | Standard test card |
| Visa (debit) | `4000 0566 5566 5556` | Debit card |
| Mastercard | `5555 5555 5555 4444` | Standard Mastercard |
| Mastercard (2-series) | `2223 0031 2200 3222` | New Mastercard series |
| Mastercard (debit) | `5200 8282 8282 8210` | Debit Mastercard |
| American Express | `3782 822463 10005` | Amex card |
| Discover | `6011 1111 1111 1117` | Discover card |
| Diners Club | `3056 9300 0902 0004` | Diners card |
| JCB | `3566 0020 2036 0505` | JCB card |

## 3D Secure Authentication Cards

| Card Number | Description |
|-------------|-------------|
| `4000 0027 6000 3184` | Requires authentication |
| `4000 0025 0000 3155` | Requires authentication (3DS2) |

## Declined Cards

| Card Number | Decline Reason |
|-------------|----------------|
| `4000 0000 0000 0002` | Generic decline |
| `4000 0000 0000 9995` | Insufficient funds |
| `4000 0000 0000 9987` | Lost card |
| `4000 0000 0000 9979` | Stolen card |
| `4000 0000 0000 0069` | Expired card |
| `4000 0000 0000 0127` | Incorrect CVC |
| `4000 0000 0000 0119` | Processing error |
| `4242 4242 4242 4241` | Incorrect number |

## Special Scenario Cards

| Card Number | Scenario |
|-------------|----------|
| `4000 0000 0000 3220` | 3D Secure required (card will be declined if 3DS not completed) |
| `4000 0082 6000 0000` | Charge succeeds but triggers dispute |
| `4000 0000 0000 0341` | Charge succeeds but triggers fraud review |

## International Cards

| Country | Card Number |
|---------|-------------|
| Brazil | `4000 0007 6000 0002` |
| Canada | `4000 0012 4000 0000` |
| Mexico | `4000 0048 4000 0008` |
| UK | `4000 0082 6000 0000` |
| India | `4000 0035 6000 0008` |

## Testing Tips

1. **Always use future expiry dates**: e.g., 12/25, 01/26, etc.
2. **CVC can be any 3 digits**: e.g., 123, 456, 789
3. **ZIP code can be any 5 digits**: e.g., 12345, 90210
4. **Name can be anything**: e.g., "Test User", "John Doe"

## Quick Test Scenarios

### Scenario 1: Successful Payment
```
Card: 4242 4242 4242 4242
Exp:  12/25
CVC:  123
ZIP:  12345
Result: ✅ Payment succeeds
```

### Scenario 2: Declined Payment
```
Card: 4000 0000 0000 0002
Exp:  12/25
CVC:  123
ZIP:  12345
Result: ❌ Payment declined (generic)
```

### Scenario 3: 3D Secure Required
```
Card: 4000 0027 6000 3184
Exp:  12/25
CVC:  123
ZIP:  12345
Result: 🔐 Authentication modal appears
```

### Scenario 4: Insufficient Funds
```
Card: 4000 0000 0000 9995
Exp:  12/25
CVC:  123
ZIP:  12345
Result: ❌ Payment declined (insufficient funds)
```

## Testing Saved Cards

To test saved card functionality:

1. Use `4242 4242 4242 4242` to save a card
2. Check "Save card for future use"
3. Complete payment
4. Card should appear in your account's saved cards
5. Try making another purchase with the saved card

## Testing Refunds

1. Make a successful test payment
2. Go to Stripe Dashboard → Payments
3. Click on the payment
4. Click "Refund payment"
5. Enter refund amount
6. Confirm refund

## Important Notes

- ⚠️ These cards only work in **TEST MODE**
- ⚠️ Never use real card numbers in test mode
- ⚠️ Test payments don't charge real money
- ⚠️ Test data is separate from live data
- ✅ You can create unlimited test payments
- ✅ Test payments can be refunded without limits

## Common Errors and Solutions

| Error | Solution |
|-------|----------|
| "Invalid card number" | Check you typed the number correctly |
| "Your card was declined" | This is expected for decline test cards |
| "Stripe key missing" | Update your .env file with test keys |
| "Invalid API key" | Make sure you're using sk_test_ key |

## Resources

- Full test card list: https://stripe.com/docs/testing
- Stripe Dashboard: https://dashboard.stripe.com/test/payments
- API Documentation: https://stripe.com/docs/api
