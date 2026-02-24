# 🚀 Quick Deployment Reference

## 1️⃣ Prepare Locally (5 minutes)

```bash
# Run preparation script
./deploy-to-hostinger.sh

# Edit .env.production with Hostinger credentials
nano .env.production

# Commit and push
git add .
git commit -m "Ready for deployment"
git push origin main
```

## 2️⃣ Connect to Hostinger (2 minutes)

```bash
# SSH into Hostinger
ssh username@ssh.hostinger.com -p 65002

# Navigate to your domain folder
cd domains/yourdomain.com/public_html
```

## 3️⃣ Deploy Code (10 minutes)

```bash
# Clone repository
git clone https://github.com/yourusername/banglz.git .

# Install dependencies
composer install --no-dev --optimize-autoloader

# Set up environment
cp .env.production .env
php artisan key:generate

# Run migrations
php artisan migrate --force

# Set permissions
chmod -R 755 storage bootstrap/cache

# Create storage link
php artisan storage:link

# Optimize
php artisan config:cache
php artisan route:cache
php artisan view:cache
```

## 4️⃣ Configure Server (5 minutes)

### Upload .htaccess to root (public_html)
```apache
<IfModule mod_rewrite.c>
    RewriteEngine On
    RewriteCond %{REQUEST_URI} !^/public/
    RewriteRule ^(.*)$ /public/$1 [L,QSA]
</IfModule>
```

### Enable SSL
- Go to Hostinger control panel
- SSL section → Enable Free SSL

## 5️⃣ Test (5 minutes)

- ✅ Visit https://yourdomain.com
- ✅ Test admin login
- ✅ Check products page
- ✅ Test cart and checkout

## 🔄 Update Existing Deployment

```bash
# SSH to server
ssh username@ssh.hostinger.com -p 65002
cd domains/yourdomain.com/public_html

# Pull changes
git pull origin main

# Update dependencies
composer install --no-dev --optimize-autoloader

# Run migrations
php artisan migrate --force

# Clear and cache
php artisan config:clear
php artisan cache:clear
php artisan config:cache
php artisan route:cache
php artisan view:cache
```

## 🆘 Emergency Rollback

```bash
# Revert to previous commit
git log --oneline  # Find commit hash
git checkout [commit-hash]

# Or restore database
mysql -u user -p database < backup.sql
```

## 📞 Hostinger Support

- **Control Panel:** https://hpanel.hostinger.com
- **Support:** Live chat in control panel
- **Documentation:** https://support.hostinger.com

## ⚡ Common Issues

### 500 Error
```bash
tail -f storage/logs/laravel.log
chmod -R 755 storage bootstrap/cache
```

### Database Error
- Check .env database credentials
- Verify database exists in phpMyAdmin

### Images Not Loading
```bash
php artisan storage:link
chmod -R 755 storage/app/public
```

---

**Total Deployment Time:** ~30 minutes
**Update Time:** ~5 minutes
