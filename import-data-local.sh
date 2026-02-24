#!/bin/bash

# Database configuration
DB_HOST="127.0.0.1"
DB_PORT="3306"
DB_DATABASE="banglz"
DB_USERNAME="root"
DB_PASSWORD=""

# SQL file paths
SQL_FILE_1="/media/hassaan/Backup/Fiverr Projects/banglz/u981402959_banglz.sql"
SQL_FILE_2="/media/hassaan/Backup/Fiverr Projects/banglz/u981402959_pBNcU.sql"

echo "=========================================="
echo "Database Data Import Script (Local MySQL)"
echo "=========================================="
echo ""

# Check if MySQL is installed
if ! command -v mysql &> /dev/null; then
    echo "✗ MySQL client not found. Please install it first:"
    echo "  sudo apt-get install mysql-client"
    exit 1
fi

# Prompt for MySQL password if needed
read -sp "Enter MySQL root password (press Enter if no password): " DB_PASSWORD
echo ""
echo ""

# Create backup directory
BACKUP_DIR="./database_backups"
mkdir -p "$BACKUP_DIR"

# Backup current database
echo "Step 1: Creating backup of current database..."
BACKUP_FILE="$BACKUP_DIR/backup_$(date +%Y%m%d_%H%M%S).sql"

if [ -z "$DB_PASSWORD" ]; then
    mysqldump -h"$DB_HOST" -u"$DB_USERNAME" "$DB_DATABASE" > "$BACKUP_FILE" 2>/dev/null
else
    mysqldump -h"$DB_HOST" -u"$DB_USERNAME" -p"$DB_PASSWORD" "$DB_DATABASE" > "$BACKUP_FILE" 2>/dev/null
fi

if [ $? -eq 0 ]; then
    echo "✓ Backup created: $BACKUP_FILE"
else
    echo "✗ Backup failed, but continuing..."
fi

echo ""
echo "Step 2: Importing data from SQL files..."
echo ""

# Import first SQL file (smaller one - 325K)
echo "Importing u981402959_banglz.sql (325KB)..."
if [ -z "$DB_PASSWORD" ]; then
    mysql -h"$DB_HOST" -u"$DB_USERNAME" "$DB_DATABASE" < "$SQL_FILE_1" 2>&1
else
    mysql -h"$DB_HOST" -u"$DB_USERNAME" -p"$DB_PASSWORD" "$DB_DATABASE" < "$SQL_FILE_1" 2>&1
fi

if [ $? -eq 0 ]; then
    echo "✓ First SQL file imported successfully"
else
    echo "✗ First SQL file import had issues"
    exit 1
fi

echo ""

# Import second SQL file (larger one - 102MB)
echo "Importing u981402959_pBNcU.sql (102MB) - this may take a few minutes..."
if [ -z "$DB_PASSWORD" ]; then
    mysql -h"$DB_HOST" -u"$DB_USERNAME" "$DB_DATABASE" < "$SQL_FILE_2" 2>&1
else
    mysql -h"$DB_HOST" -u"$DB_USERNAME" -p"$DB_PASSWORD" "$DB_DATABASE" < "$SQL_FILE_2" 2>&1
fi

if [ $? -eq 0 ]; then
    echo "✓ Second SQL file imported successfully"
else
    echo "✗ Second SQL file import had issues"
    exit 1
fi

echo ""
echo "=========================================="
echo "Import Complete!"
echo "=========================================="
echo ""
echo "To verify the import, run:"
echo "  mysql -u$DB_USERNAME -p $DB_DATABASE -e 'SHOW TABLES;'"
echo ""
echo "If you need to restore from backup:"
echo "  mysql -u$DB_USERNAME -p $DB_DATABASE < $BACKUP_FILE"
echo ""
