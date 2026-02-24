# 🚀 Hostinger Deployment Guide (Without SSH - FTP Method)

## For Single Web Hosting Plan (No SSH Access)

Since your hosting plan doesn't include SSH access, we'll deploy using FTP and the Hostinger File Manager.

## Prerequisites
- Hostinger hosting account
- FTP client (FileZilla recommended)
- Database access via phpMyAdmin
- Your Laravel project ready

---

## Method 1: Using Hostinger File Manager (Easiest)

### Step 1: Prepare Your Project Locally

#### 1.1 Install Dependencies Locally
```bash
# Install all dependencies
composer install --optimize-autoloader --no-dev

# This creates the vendor folder with all packages
```

#### 1.2 Create Production .env File
```bash
cp .env .env.production
```

Edit `.env.production`:
```env
APP_NAME=Banglz
APP_ENV=production
APP_DEBUG=false
APP_URL=https://silver-opossum-253389.hostingersite.com

DB_CONNECTION=mysql
DB_HOST=localhost
DB_PORT=3306
DB_DATABASE=u981402959_banglz
DB_USERNAME=u981402959_banglz
DB_PASSWORD=your_database_password

SESSION_DRIVER=file
CACHE_DRIVER=file
QUEUE_CONNECTION=sync

STRIPE_KEY=pk_live_your_key
STRIPE_SECRET=sk_live_your_key
```

#### 1.3 Optimize for Production
```bash
# Clear caches
php artisan config:clear
php artisan cache:clear
php artisan view:clear
php artisan route:clear
```

#### 1.4 Create ZIP Archive
```bash
# Create a zip of your entire project
zip -r banglz-deploy.zip . -x "*.git*" "node_modules/*" ".env" "storage/logs/*"
```

Or manually:
- Right-click project folder
- Send to → Compressed (zipped) folder
- Name it `banglz-deploy.zip`

### Step 2: Upload via Hostinger File Manager

#### 2.1 Access File Manager
1. Log in to Hostinger hPanel: https://hpanel.hostinger.com
2. Go to **Files** → **File Manager**
3. Navigate to `public_html` folder

#### 2.2 Clean public_html
1. Select all files in `public_html`
2. Click **Delete**
3. Confirm deletion

#### 2.3 Upload Your Project
1. Click **Upload** button
2. Select `banglz-deploy.zip`
3. Wait for upload to complete
4. Right-click the zip file
5. Click **Extract**
6. Select `public_html` as destination
7. Click **Extract**

#### 2.4 Set Up .env File
1. In File Manager, navigate to `public_html`
2. Find `.env.production` file
3. Right-click → **Rename** to `.env`
4. Right-click `.env` → **Edit**
5. Verify all settings are correct
6. Click **Save**

### Step 3: Configure Database

#### 3.1 Create Database (if not exists)
1. In hPanel, go to **Databases** → **MySQL Databases**
2. Note your database name (usually `u981402959_banglz`)
3. Note your database username
4. Create/reset password if needed

#### 3.2 Import Database via phpMyAdmin
1. In hPanel, go to **Databases** → **phpMyAdmin**
2. Click on your database name in left sidebar
3. Click **Import** tab
4. Click **Choose File**
5. Select your SQL file (`u981402959_banglz.sql`)
6. Scroll down and click **Go**
7. Wait for import to complete

### Step 4: Set Up Laravel

#### 4.1 Generate Application Key
Since you can't run `php artisan key:generate`, do this:

1. Visit: https://generate-random.org/laravel-key-generator
2. Copy the generated key (starts with `base64:`)
3. In File Manager, edit `.env`
4. Update `APP_KEY=` with the generated key
5. Save

#### 4.2 Create Storage Link
In File Manager:
1. Navigate to `public_html/public`
2. Create new folder named `storage`
3. This will serve as your storage link

Or create a PHP script:
1. Create file `setup.php` in `public_html/public`
2. Add this code:
```php
<?php
// Create symbolic link for storage
$target = '../storage/app/public';
$link = __DIR__ . '/storage';

if (!file_exists($link)) {
    symlink($target, $link);
    echo "Storage link created successfully!";
} else {
    echo "Storage link already exists!";
}
?>
```
3. Visit: `https://silver-opossum-253389.hostingersite.com/setup.php`
4. Delete `setup.php` after running

### Step 5: Configure Web Server

#### 5.1 Update Root .htaccess
In `public_html`, create/edit `.htaccess`:

```apache
<IfModule mod_rewrite.c>
    RewriteEngine On
    
    # Redirect to public folder
    RewriteCond %{REQUEST_URI} !^/public/
    RewriteCond %{REQUEST_FILENAME} !-f
    RewriteCond %{REQUEST_FILENAME} !-d
    RewriteRule ^(.*)$ /public/$1 [L,QSA]
    
    # Redirect to HTTPS
    RewriteCond %{HTTPS} off
    RewriteRule ^(.*)$ https://%{HTTP_HOST}%{REQUEST_URI} [L,R=301]
</IfModule>
```

#### 5.2 Verify public/.htaccess
Ensure `public_html/public/.htaccess` exists with:

```apache
<IfModule mod_rewrite.c>
    <IfModule mod_negotiation.c>
        Options -MultiViews -Indexes
    </IfModule>

    RewriteEngine On

    # Handle Authorization Header
    RewriteCond %{HTTP:Authorization} .
    RewriteRule .* - [E=HTTP_AUTHORIZATION:%{HTTP:Authorization}]

    # Redirect Trailing Slashes
    RewriteCond %{REQUEST_FILENAME} !-d
    RewriteCond %{REQUEST_URI} (.+)/$
    RewriteRule ^ %1 [L,R=301]

    # Send Requests To Front Controller
    RewriteCond %{REQUEST_FILENAME} !-d
    RewriteCond %{REQUEST_FILENAME} !-f
    RewriteRule ^ index.php [L]
</IfModule>
```

### Step 6: Set Permissions

In File Manager:
1. Right-click `storage` folder → **Permissions**
2. Set to `755` or check all boxes
3. Click **Change Permissions**
4. Repeat for `bootstrap/cache`

### Step 7: Run Migrations

Create a migration script:

1. Create `migrate.php` in `public_html/public`:
```php
<?php
require __DIR__.'/../vendor/autoload.php';
$app = require_once __DIR__.'/../bootstrap/app.php';

$kernel = $app->make(Illuminate\Contracts\Console\Kernel::class);
$kernel->bootstrap();

// Run migrations
Artisan::call('migrate', ['--force' => true]);
echo "Migrations completed!<br>";
echo Artisan::output();

// Clear and cache config
Artisan::call('config:cache');
echo "Config cached!<br>";

Artisan::call('route:cache');
echo "Routes cached!<br>";

Artisan::call('view:cache');
echo "Views cached!<br>";

echo "<br>Setup complete! Delete this file now.";
?>
```

2. Visit: `https://silver-opossum-253389.hostingersite.com/migrate.php`
3. **Delete `migrate.php` immediately after running**

### Step 8: Enable SSL

1. In hPanel, go to **SSL** section
2. Enable **Free SSL Certificate**
3. Wait 5-10 minutes for activation

---

## Method 2: Using FTP Client (FileZilla)

### Step 1: Get FTP Credentials

1. In hPanel, go to **Files** → **FTP Accounts**
2. Note your FTP credentials:
   - **Host:** `ftp.silver-opossum-253389.hostingersite.com`
   - **Username:** Your FTP username
   - **Password:** Your FTP password
   - **Port:** 21

### Step 2: Connect with FileZilla

1. Download FileZilla: https://filezilla-project.org/
2. Open FileZilla
3. Enter FTP credentials:
   - Host: `ftp.silver-opossum-253389.hostingersite.com`
   - Username: Your username
   - Password: Your password
   - Port: 21
4. Click **Quickconnect**

### Step 3: Upload Files

1. In FileZilla, navigate to `public_html` on remote side
2. Delete all existing files
3. On local side, navigate to your Laravel project
4. Select all files and folders
5. Right-click → **Upload**
6. Wait for upload (may take 10-30 minutes)

### Step 4: Follow Steps 3-8 from Method 1

Continue with database setup, Laravel configuration, etc.

---

## Updating Your Site (Without SSH)

### Option 1: File Manager
1. Upload changed files via File Manager
2. Replace existing files
3. Run `migrate.php` if database changes

### Option 2: FTP
1. Connect via FileZilla
2. Upload only changed files
3. Overwrite existing files

### Option 3: Full Redeployment
1. Create new ZIP with changes
2. Upload and extract
3. Restore `.env` file
4. Run migrations

---

## Troubleshooting

### Issue: 500 Internal Server Error

**Check Laravel Logs:**
1. File Manager → `storage/logs/laravel.log`
2. Download and check errors

**Common Fixes:**
- Verify `.env` file exists and is correct
- Check `storage` and `bootstrap/cache` permissions (755)
- Ensure `APP_KEY` is set in `.env`

### Issue: Database Connection Error

1. Verify database credentials in `.env`
2. Check database exists in phpMyAdmin
3. Ensure database user has all privileges

### Issue: Images Not Loading

1. Check `public/storage` folder exists
2. Upload images to `storage/app/public`
3. Verify permissions on `storage` folder

### Issue: Blank Page

1. Check `.env` file exists
2. Set `APP_DEBUG=true` temporarily to see errors
3. Check `storage/logs/laravel.log`

---

## Helper Scripts

### Clear Cache Script
Create `clear-cache.php` in `public`:

```php
<?php
require __DIR__.'/../vendor/autoload.php';
$app = require_once __DIR__.'/../bootstrap/app.php';
$kernel = $app->make(Illuminate\Contracts\Console\Kernel::class);
$kernel->bootstrap();

Artisan::call('config:clear');
echo "Config cleared!<br>";

Artisan::call('cache:clear');
echo "Cache cleared!<br>";

Artisan::call('view:clear');
echo "Views cleared!<br>";

Artisan::call('route:clear');
echo "Routes cleared!<br>";

echo "<br>All caches cleared! Delete this file.";
?>
```

Visit: `https://yourdomain.com/clear-cache.php`

### Optimize Script
Create `optimize.php` in `public`:

```php
<?php
require __DIR__.'/../vendor/autoload.php';
$app = require_once __DIR__.'/../bootstrap/app.php';
$kernel = $app->make(Illuminate\Contracts\Console\Kernel::class);
$kernel->bootstrap();

Artisan::call('config:cache');
echo "Config cached!<br>";

Artisan::call('route:cache');
echo "Routes cached!<br>";

Artisan::call('view:cache');
echo "Views cached!<br>";

echo "<br>Optimization complete! Delete this file.";
?>
```

---

## Security Notes

⚠️ **IMPORTANT:**
- Always delete helper scripts (`migrate.php`, `clear-cache.php`, etc.) after use
- Set `APP_DEBUG=false` in production
- Never commit `.env` file to Git
- Use strong database passwords
- Enable SSL certificate

---

## Backup Strategy

### Database Backup
1. phpMyAdmin → Select database
2. Click **Export**
3. Choose **Quick** export method
4. Click **Go**
5. Save SQL file locally

### Files Backup
1. File Manager → Select `public_html`
2. Right-click → **Compress**
3. Download the ZIP file

---

## Performance Tips

1. **Enable OPcache** (usually enabled by default on Hostinger)
2. **Use file-based cache** (already set in .env)
3. **Optimize images** before uploading
4. **Run optimization script** after deployment

---

## Need Help?

- **Hostinger Support:** Live chat in hPanel (24/7)
- **Laravel Logs:** `storage/logs/laravel.log`
- **PHP Errors:** Enable in hPanel → PHP Configuration

---

**Deployment Time:** 30-45 minutes (first time)
**Update Time:** 10-15 minutes

Good luck with your deployment! 🚀
