# 🚀 Hostinger Deployment Guide for Laravel Project

## Prerequisites
- Hostinger hosting account with SSH access
- Git installed on your local machine
- Database credentials from Hostinger
- Domain name configured

## Step 1: Prepare Your Project

### 1.1 Update .env for Production
Create a production `.env` file:

```bash
cp .env .env.production
```

Edit `.env.production` with Hostinger settings:
```env
APP_NAME=Banglz
APP_ENV=production
APP_DEBUG=false
APP_URL=https://yourdomain.com

DB_CONNECTION=mysql
DB_HOST=localhost
DB_PORT=3306
DB_DATABASE=your_hostinger_database_name
DB_USERNAME=your_hostinger_database_user
DB_PASSWORD=your_hostinger_database_password

# Add your Stripe production keys
STRIPE_KEY=pk_live_your_key
STRIPE_SECRET=sk_live_your_key
```

### 1.2 Optimize for Production
```bash
# Clear all caches
php artisan config:clear
php artisan cache:clear
php artisan view:clear
php artisan route:clear

# Optimize
php artisan config:cache
php artisan route:cache
php artisan view:cache
```

## Step 2: Push Code to GitHub

```bash
# Add all changes
git add .

# Commit
git commit -m "Prepare for Hostinger deployment"

# Push to main branch
git push origin main
```

## Step 3: Connect to Hostinger via SSH

### 3.1 Get SSH Credentials
1. Log in to Hostinger control panel
2. Go to **Advanced** → **SSH Access**
3. Note your SSH details:
   - Host: `ssh.hostinger.com` (or your specific host)
   - Port: Usually `22` or `65002`
   - Username: Your hosting username
   - Password: Your hosting password

### 3.2 Connect via SSH
```bash
ssh username@ssh.hostinger.com -p 65002
```

Or if using standard port:
```bash
ssh username@yourdomain.com
```

## Step 4: Deploy on Hostinger

### 4.1 Navigate to Public HTML Directory
```bash
cd domains/yourdomain.com/public_html
```

### 4.2 Clone Your Repository
```bash
# Remove default files if any
rm -rf *
rm -rf .htaccess

# Clone your repository
git clone https://github.com/yourusername/banglz.git .
```

### 4.3 Install Composer Dependencies
```bash
# If composer is not installed globally, use:
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php composer-setup.php
php -r "unlink('composer-setup.php');"

# Install dependencies
php composer.phar install --no-dev --optimize-autoloader

# Or if composer is global:
composer install --no-dev --optimize-autoloader
```

### 4.4 Set Up Environment File
```bash
# Copy production env
cp .env.production .env

# Or create new .env file
nano .env
```

Paste your production environment variables.

### 4.5 Generate Application Key
```bash
php artisan key:generate
```

### 4.6 Set Up Database
```bash
# Run migrations
php artisan migrate --force

# If you need to seed data
php artisan db:seed --force
```

### 4.7 Set Permissions
```bash
# Set proper permissions
chmod -R 755 storage bootstrap/cache
chmod -R 775 storage
chmod -R 775 bootstrap/cache

# If needed, change ownership
chown -R username:username storage bootstrap/cache
```

### 4.8 Create Symbolic Link for Storage
```bash
php artisan storage:link
```

### 4.9 Optimize for Production
```bash
php artisan config:cache
php artisan route:cache
php artisan view:cache
```

## Step 5: Configure Web Server

### 5.1 Update .htaccess in public_html
Create or update `.htaccess` in your `public_html` directory:

```apache
<IfModule mod_rewrite.c>
    RewriteEngine On
    
    # Redirect to public folder
    RewriteCond %{REQUEST_URI} !^/public/
    RewriteRule ^(.*)$ /public/$1 [L,QSA]
</IfModule>
```

### 5.2 Update .htaccess in public folder
Ensure `public/.htaccess` has:

```apache
<IfModule mod_rewrite.c>
    <IfModule mod_negotiation.c>
        Options -MultiViews -Indexes
    </IfModule>

    RewriteEngine On

    # Handle Authorization Header
    RewriteCond %{HTTP:Authorization} .
    RewriteRule .* - [E=HTTP_AUTHORIZATION:%{HTTP:Authorization}]

    # Redirect Trailing Slashes If Not A Folder...
    RewriteCond %{REQUEST_FILENAME} !-d
    RewriteCond %{REQUEST_URI} (.+)/$
    RewriteRule ^ %1 [L,R=301]

    # Send Requests To Front Controller...
    RewriteCond %{REQUEST_FILENAME} !-d
    RewriteCond %{REQUEST_FILENAME} !-f
    RewriteRule ^ index.php [L]
</IfModule>
```

## Step 6: Import Database (If Needed)

### 6.1 Via Hostinger phpMyAdmin
1. Go to Hostinger control panel
2. Open **phpMyAdmin**
3. Select your database
4. Click **Import**
5. Upload your SQL file
6. Click **Go**

### 6.2 Via SSH
```bash
# If you have a SQL dump
mysql -u username -p database_name < backup.sql
```

## Step 7: Upload Images/Assets

### 7.1 Via FTP/SFTP
Use FileZilla or similar:
- Host: `ftp.yourdomain.com`
- Username: Your hosting username
- Password: Your hosting password
- Port: 21 (FTP) or 22 (SFTP)

Upload your `storage/app/public` folder contents.

### 7.2 Via SSH
```bash
# If images are in a separate location
scp -r local/path/to/images username@host:/path/to/storage/app/public/
```

## Step 8: Configure SSL (HTTPS)

1. Go to Hostinger control panel
2. Navigate to **SSL** section
3. Enable **Free SSL Certificate**
4. Wait for activation (usually 5-10 minutes)

Update your `.env`:
```env
APP_URL=https://yourdomain.com
```

## Step 9: Set Up Cron Jobs (If Needed)

In Hostinger control panel:
1. Go to **Advanced** → **Cron Jobs**
2. Add new cron job:

```bash
* * * * * cd /home/username/domains/yourdomain.com/public_html && php artisan schedule:run >> /dev/null 2>&1
```

## Step 10: Final Checks

### 10.1 Test Your Site
Visit: `https://yourdomain.com`

### 10.2 Check Admin Panel
Visit: `https://yourdomain.com/admin`

### 10.3 Test Key Features
- [ ] Homepage loads
- [ ] Products display
- [ ] Categories work
- [ ] Cart functionality
- [ ] Checkout process
- [ ] Admin login
- [ ] Image uploads

## Troubleshooting

### Issue: 500 Internal Server Error
```bash
# Check Laravel logs
tail -f storage/logs/laravel.log

# Check permissions
chmod -R 755 storage bootstrap/cache
```

### Issue: Database Connection Error
- Verify database credentials in `.env`
- Check if database exists in phpMyAdmin
- Ensure database user has proper permissions

### Issue: Images Not Loading
```bash
# Recreate storage link
php artisan storage:link

# Check permissions
chmod -R 755 storage/app/public
```

### Issue: CSS/JS Not Loading
```bash
# Clear and rebuild caches
php artisan cache:clear
php artisan config:clear
php artisan view:clear

# Rebuild
php artisan config:cache
php artisan view:cache
```

## Updating Your Site

### Method 1: Via Git (Recommended)
```bash
# SSH into server
ssh username@host

# Navigate to project
cd domains/yourdomain.com/public_html

# Pull latest changes
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

### Method 2: Via FTP
1. Upload changed files via FTP
2. SSH into server
3. Run necessary artisan commands

## Security Checklist

- [ ] Set `APP_DEBUG=false` in production
- [ ] Use strong database passwords
- [ ] Enable SSL certificate
- [ ] Set proper file permissions (755 for directories, 644 for files)
- [ ] Keep Laravel and dependencies updated
- [ ] Use environment variables for sensitive data
- [ ] Enable CSRF protection
- [ ] Implement rate limiting
- [ ] Regular backups

## Backup Strategy

### Database Backup
```bash
# Create backup
mysqldump -u username -p database_name > backup_$(date +%Y%m%d).sql

# Download via SCP
scp username@host:/path/to/backup.sql ./local/backup/
```

### Files Backup
```bash
# Create tar archive
tar -czf backup_$(date +%Y%m%d).tar.gz storage public/storage

# Download
scp username@host:/path/to/backup.tar.gz ./local/backup/
```

## Support

If you encounter issues:
1. Check Laravel logs: `storage/logs/laravel.log`
2. Check server error logs (via Hostinger control panel)
3. Contact Hostinger support for server-related issues
4. Check Laravel documentation: https://laravel.com/docs

---

**Deployment Date:** $(date)
**Laravel Version:** Check with `php artisan --version`
**PHP Version:** Check with `php -v`
