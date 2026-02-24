#!/bin/bash

# Import script using sudo for MySQL access

SQL_FILE="/media/hassaan/Backup/Fiverr Projects/banglz/u981402959_banglz.sql"
DB_NAME="banglz"

echo "=========================================="
echo "Laravel Data Import (with sudo)"
echo "=========================================="
echo ""

# Check if SQL file exists
if [ ! -f "$SQL_FILE" ]; then
    echo "✗ SQL file not found: $SQL_FILE"
    exit 1
fi

echo "This will import data from: u981402959_banglz.sql"
echo "Database: $DB_NAME"
echo ""
echo "⚠️  WARNING: This will replace existing data!"
echo ""
read -p "Do you want to continue? (yes/no): " confirm

if [ "$confirm" != "yes" ]; then
    echo "Import cancelled."
    exit 0
fi

echo ""

# Create backup directory
mkdir -p database_backups

# Backup current database
echo "Creating backup..."
BACKUP_FILE="database_backups/backup_$(date +%Y%m%d_%H%M%S).sql"
sudo mysqldump "$DB_NAME" > "$BACKUP_FILE" 2>/dev/null

if [ $? -eq 0 ]; then
    echo "✓ Backup saved: $BACKUP_FILE"
else
    echo "⚠️  Backup failed, but continuing..."
fi

echo ""
echo "Importing data (this may take a minute)..."
echo ""

# Import the SQL file using sudo
sudo mysql "$DB_NAME" < "$SQL_FILE" 2>&1

if [ $? -eq 0 ]; then
    echo ""
    echo "=========================================="
    echo "✓ Import completed successfully!"
    echo "=========================================="
    echo ""
    
    # Verify import
    echo "Verifying import..."
    PRODUCT_COUNT=$(sudo mysql -N -e "SELECT COUNT(*) FROM products;" "$DB_NAME" 2>/dev/null)
    CATEGORY_COUNT=$(sudo mysql -N -e "SELECT COUNT(*) FROM categories;" "$DB_NAME" 2>/dev/null)
    ORDER_COUNT=$(sudo mysql -N -e "SELECT COUNT(*) FROM orders;" "$DB_NAME" 2>/dev/null)
    
    echo "  Products: $PRODUCT_COUNT"
    echo "  Categories: $CATEGORY_COUNT"
    echo "  Orders: $ORDER_COUNT"
    echo ""
    
    echo "Next steps:"
    echo "1. Clear Laravel cache:"
    echo "   php artisan cache:clear"
    echo "   php artisan config:clear"
    echo "   php artisan view:clear"
    echo ""
    echo "2. Visit your site: http://localhost:8000"
    echo "3. Check admin panel: http://localhost:8000/admin"
    echo ""
    echo "If something went wrong, restore from backup:"
    echo "  sudo mysql $DB_NAME < $BACKUP_FILE"
else
    echo ""
    echo "=========================================="
    echo "✗ Import failed! Check errors above."
    echo "=========================================="
    echo ""
    echo "To restore from backup:"
    echo "  sudo mysql $DB_NAME < $BACKUP_FILE"
    exit 1
fi
