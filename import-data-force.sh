#!/bin/bash

# Import script that handles existing tables

SQL_FILE="/media/hassaan/Backup/Fiverr Projects/banglz/u981402959_banglz.sql"
DB_NAME="banglz"

echo "=========================================="
echo "Laravel Data Import (Force Mode)"
echo "=========================================="
echo ""

# Check if SQL file exists
if [ ! -f "$SQL_FILE" ]; then
    echo "✗ SQL file not found: $SQL_FILE"
    exit 1
fi

echo "This will:"
echo "1. Backup your current database"
echo "2. Drop all existing tables"
echo "3. Import fresh data from SQL file"
echo ""
echo "Database: $DB_NAME"
echo "⚠️  WARNING: ALL EXISTING DATA WILL BE REPLACED!"
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
echo "Step 1: Creating backup..."
BACKUP_FILE="database_backups/backup_$(date +%Y%m%d_%H%M%S).sql"
sudo mysqldump "$DB_NAME" > "$BACKUP_FILE" 2>/dev/null

if [ $? -eq 0 ]; then
    echo "✓ Backup saved: $BACKUP_FILE"
else
    echo "⚠️  Backup failed!"
    read -p "Continue anyway? (yes/no): " continue_confirm
    if [ "$continue_confirm" != "yes" ]; then
        exit 1
    fi
fi

echo ""
echo "Step 2: Dropping existing tables..."

# Get list of tables and drop them
TABLES=$(sudo mysql -N -e "SHOW TABLES;" "$DB_NAME" 2>/dev/null)

if [ ! -z "$TABLES" ]; then
    sudo mysql "$DB_NAME" -e "SET FOREIGN_KEY_CHECKS = 0;" 2>/dev/null
    
    for table in $TABLES; do
        echo "  Dropping table: $table"
        sudo mysql "$DB_NAME" -e "DROP TABLE IF EXISTS \`$table\`;" 2>/dev/null
    done
    
    sudo mysql "$DB_NAME" -e "SET FOREIGN_KEY_CHECKS = 1;" 2>/dev/null
    echo "✓ All tables dropped"
else
    echo "  No tables to drop"
fi

echo ""
echo "Step 3: Importing data (this may take a minute)..."
echo ""

# Import the SQL file
sudo mysql "$DB_NAME" < "$SQL_FILE" 2>&1 | head -20

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
    USER_COUNT=$(sudo mysql -N -e "SELECT COUNT(*) FROM users;" "$DB_NAME" 2>/dev/null)
    
    echo "  Products: $PRODUCT_COUNT"
    echo "  Categories: $CATEGORY_COUNT"
    echo "  Orders: $ORDER_COUNT"
    echo "  Users: $USER_COUNT"
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
    echo "Backup location: $BACKUP_FILE"
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
