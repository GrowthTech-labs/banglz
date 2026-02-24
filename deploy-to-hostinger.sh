#!/bin/bash

# Hostinger Deployment Script
# This script helps prepare your Laravel project for Hostinger deployment

echo "=========================================="
echo "Hostinger Deployment Preparation"
echo "=========================================="
echo ""

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Step 1: Check if we're in a Laravel project
if [ ! -f "artisan" ]; then
    echo -e "${RED}✗ Error: Not a Laravel project directory${NC}"
    exit 1
fi

echo -e "${GREEN}✓ Laravel project detected${NC}"
echo ""

# Step 2: Create production .env file
echo "Step 1: Creating production .env file..."
if [ -f ".env.production" ]; then
    echo -e "${YELLOW}⚠ .env.production already exists${NC}"
    read -p "Overwrite? (y/n): " overwrite
    if [ "$overwrite" != "y" ]; then
        echo "Skipping .env.production creation"
    else
        cp .env .env.production
        echo -e "${GREEN}✓ Created .env.production${NC}"
    fi
else
    cp .env .env.production
    echo -e "${GREEN}✓ Created .env.production${NC}"
fi

echo ""
echo -e "${YELLOW}⚠ IMPORTANT: Edit .env.production with your Hostinger credentials:${NC}"
echo "  - APP_ENV=production"
echo "  - APP_DEBUG=false"
echo "  - APP_URL=https://yourdomain.com"
echo "  - Database credentials from Hostinger"
echo "  - Production Stripe keys"
echo ""
read -p "Press Enter to continue..."

# Step 3: Clear all caches
echo ""
echo "Step 2: Clearing caches..."
php artisan config:clear
php artisan cache:clear
php artisan view:clear
php artisan route:clear
echo -e "${GREEN}✓ Caches cleared${NC}"

# Step 4: Run tests (optional)
echo ""
read -p "Run tests before deployment? (y/n): " run_tests
if [ "$run_tests" = "y" ]; then
    echo "Running tests..."
    php artisan test
    if [ $? -ne 0 ]; then
        echo -e "${RED}✗ Tests failed! Fix issues before deploying.${NC}"
        exit 1
    fi
    echo -e "${GREEN}✓ Tests passed${NC}"
fi

# Step 5: Git status check
echo ""
echo "Step 3: Checking Git status..."
if [ -d ".git" ]; then
    git status
    echo ""
    read -p "Commit and push changes? (y/n): " commit_push
    if [ "$commit_push" = "y" ]; then
        read -p "Enter commit message: " commit_msg
        git add .
        git commit -m "$commit_msg"
        git push origin main
        echo -e "${GREEN}✓ Changes pushed to repository${NC}"
    fi
else
    echo -e "${YELLOW}⚠ Not a Git repository${NC}"
fi

# Step 6: Create deployment checklist
echo ""
echo "Step 4: Creating deployment checklist..."
cat > DEPLOYMENT_CHECKLIST.md << 'EOF'
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
EOF

echo -e "${GREEN}✓ Created DEPLOYMENT_CHECKLIST.md${NC}"

# Step 7: Create .htaccess files
echo ""
echo "Step 5: Creating .htaccess files..."

# Root .htaccess
cat > .htaccess.hostinger << 'EOF'
<IfModule mod_rewrite.c>
    RewriteEngine On
    
    # Redirect to public folder
    RewriteCond %{REQUEST_URI} !^/public/
    RewriteRule ^(.*)$ /public/$1 [L,QSA]
</IfModule>
EOF

echo -e "${GREEN}✓ Created .htaccess.hostinger (upload to root)${NC}"

# Step 8: Create deployment commands file
cat > hostinger-commands.txt << 'EOF'
# Commands to run on Hostinger server after cloning

# 1. Install dependencies
composer install --no-dev --optimize-autoloader

# 2. Set up environment
cp .env.production .env
php artisan key:generate

# 3. Run migrations
php artisan migrate --force

# 4. Set permissions
chmod -R 755 storage bootstrap/cache
chmod -R 775 storage
chmod -R 775 bootstrap/cache

# 5. Create storage link
php artisan storage:link

# 6. Optimize
php artisan config:cache
php artisan route:cache
php artisan view:cache

# 7. Verify
php artisan --version
php artisan config:show
EOF

echo -e "${GREEN}✓ Created hostinger-commands.txt${NC}"

# Step 9: Summary
echo ""
echo "=========================================="
echo "Preparation Complete!"
echo "=========================================="
echo ""
echo "Files created:"
echo "  ✓ .env.production"
echo "  ✓ DEPLOYMENT_CHECKLIST.md"
echo "  ✓ .htaccess.hostinger"
echo "  ✓ hostinger-commands.txt"
echo ""
echo "Next steps:"
echo "1. Edit .env.production with Hostinger credentials"
echo "2. Follow HOSTINGER_DEPLOYMENT_GUIDE.md"
echo "3. Use DEPLOYMENT_CHECKLIST.md during deployment"
echo "4. Upload .htaccess.hostinger as .htaccess on server"
echo "5. Run commands from hostinger-commands.txt on server"
echo ""
echo "SSH to Hostinger:"
echo "  ssh username@ssh.hostinger.com -p 65002"
echo ""
echo -e "${GREEN}Good luck with your deployment! 🚀${NC}"
