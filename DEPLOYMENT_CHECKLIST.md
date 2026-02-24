# Deployment Checklist

## Pre-Deployment
- [ ] Updated .env.production with Hostinger credentials
- [ ] Tested locally
- [ ] Committed and pushed to Git
- [ ] Database backup created
- [ ] Images/assets ready to upload

## On Hostinger Server
- [ ] SSH connected
- [ ] Navigated to public_html
- [ ] Cloned repository
- [ ] Installed composer dependencies
- [ ] Copied .env.production to .env
- [ ] Generated application key
- [ ] Run migrations
- [ ] Set permissions (755 storage, bootstrap/cache)
- [ ] Created storage link
- [ ] Cached config, routes, views
- [ ] Updated .htaccess files

## Post-Deployment
- [ ] SSL certificate enabled
- [ ] Homepage loads correctly
- [ ] Admin panel accessible
- [ ] Products display properly
- [ ] Images loading
- [ ] Cart functionality works
- [ ] Checkout process tested
- [ ] Email notifications working
- [ ] Cron jobs configured (if needed)

## Verification URLs
- [ ] Homepage: https://yourdomain.com
- [ ] Admin: https://yourdomain.com/admin
- [ ] Products: https://yourdomain.com/products
- [ ] API endpoints (if any)

## Rollback Plan
- Database backup location: _______________
- Previous code version: _______________
- Rollback command: git checkout [commit-hash]
