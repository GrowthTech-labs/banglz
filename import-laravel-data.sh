#!/bin/bash

# Simple script to import Laravel application data only

SQL_FILE="/media/hassaan/Backup/Fiverr Projects/banglz/u981402959_banglz.sql"
DB_NAME="banglz"
DB_USER="root"

echo "=========================================="
echo "Laravel Data Import"
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
mysqldump -u "$DB_USER" -p "$DB_NAME" > "$BACKUP_FILE" 2>/dev/null

if [ $? -eq 0 ]; then
    echo "✓ Backup saved: $BACKUP_FILE"
else
    echo "⚠️  Backup failed, but continuing..."
fi

echo ""
echo "Importing data (this may take a minute)..."

# Import the SQL file
mysql -u "$DB_USER" -p "$DB_NAME" < "$SQL_FILE" 2>&1 | grep -v "Using a password"

if [ $? -eq 0 ]; then
    echo ""
    echo "✓ Import completed successfully!"
    echo ""
    echo "Next steps:"
    echo "1. Clear Laravel cache: php artisan cache:clear"
    echo "2. Visit your site: http://localhost:8000"
    echo "3. Check admin panel: http://localhost:8000/admin"
    echo ""
    echo "If something went wrong, restore from backup:"
    echo "  mysql -u $DB_USER -p $DB_NAME < $BACKUP_FILE"
else
    echo ""
    echo "✗ Import failed! Check errors above."
    echo ""
    echo "To restore from backup:"
    echo "  mysql -u $DB_USER -p $DB_NAME < $BACKUP_FILE"
    exit 1
fi
