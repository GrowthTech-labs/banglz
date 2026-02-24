#!/bin/bash

# Final import script with proper handling

SQL_FILE="/media/hassaan/Backup/Fiverr Projects/banglz/u981402959_banglz.sql"
DB_NAME="banglz"
TEMP_SQL="/tmp/banglz_import_temp.sql"

echo "=========================================="
echo "Laravel Data Import (Final Version)"
echo "=========================================="
echo ""

# Check if SQL file exists
if [ ! -f "$SQL_FILE" ]; then
    echo "✗ SQL file not found: $SQL_FILE"
    exit 1
fi

echo "This will import data from the SQL file"
echo "Database: $DB_NAME"
echo ""
read -p "Continue? (yes/no): " confirm

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
fi

echo ""
echo "Step 2: Preparing SQL file..."

# Add DROP TABLE IF EXISTS before each CREATE TABLE
sed 's/CREATE TABLE `/DROP TABLE IF EXISTS `/g; s/DROP TABLE IF EXISTS `\([^`]*\)`/DROP TABLE IF EXISTS `\1`;\nCREATE TABLE `/g' "$SQL_FILE" > "$TEMP_SQL"

echo "✓ SQL file prepared"

echo ""
echo "Step 3: Importing data..."

# Disable foreign key checks and import
sudo mysql "$DB_NAME" <<EOF
SET FOREIGN_KEY_CHECKS = 0;
SET SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO';
SOURCE $TEMP_SQL
SET FOREIGN_KEY_CHECKS = 1;
EOF

if [ $? -eq 0 ]; then
    echo ""
    echo "=========================================="
    echo "✓ Import completed!"
    echo "=========================================="
    echo ""
    
    # Verify import
    echo "Verifying import..."
    
    TABLES=$(sudo mysql -N -e "SHOW TABLES;" "$DB_NAME" 2>/dev/null | wc -l)
    echo "  Total tables: $TABLES"
    
    if sudo mysql -e "USE $DB_NAME; SHOW TABLES LIKE 'products';" 2>/dev/null | grep -q products; then
        PRODUCT_COUNT=$(sudo mysql -N -e "SELECT COUNT(*) FROM products;" "$DB_NAME" 2>/dev/null)
        echo "  Products: $PRODUCT_COUNT"
    fi
    
    if sudo mysql -e "USE $DB_NAME; SHOW TABLES LIKE 'categories';" 2>/dev/null | grep -q categories; then
        CATEGORY_COUNT=$(sudo mysql -N -e "SELECT COUNT(*) FROM categories;" "$DB_NAME" 2>/dev/null)
        echo "  Categories: $CATEGORY_COUNT"
    fi
    
    if sudo mysql -e "USE $DB_NAME; SHOW TABLES LIKE 'orders';" 2>/dev/null | grep -q orders; then
        ORDER_COUNT=$(sudo mysql -N -e "SELECT COUNT(*) FROM orders;" "$DB_NAME" 2>/dev/null)
        echo "  Orders: $ORDER_COUNT"
    fi
    
    if sudo mysql -e "USE $DB_NAME; SHOW TABLES LIKE 'users';" 2>/dev/null | grep -q users; then
        USER_COUNT=$(sudo mysql -N -e "SELECT COUNT(*) FROM users;" "$DB_NAME" 2>/dev/null)
        echo "  Users: $USER_COUNT"
    fi
    
    echo ""
    echo "Next steps:"
    echo "1. Clear Laravel cache:"
    echo "   php artisan cache:clear"
    echo "   php artisan config:clear"
    echo ""
    echo "2. Visit: http://localhost:8000"
    echo ""
    
    # Cleanup
    rm -f "$TEMP_SQL"
else
    echo ""
    echo "✗ Import failed!"
    echo ""
    echo "To restore from backup:"
    echo "  sudo mysql $DB_NAME < $BACKUP_FILE"
    
    # Cleanup
    rm -f "$TEMP_SQL"
    exit 1
fi
