#!/bin/bash

# Database configuration from .env
DB_HOST="banglz_db"
DB_PORT="3306"
DB_DATABASE="banglz"
DB_USERNAME="banglz_user"
DB_PASSWORD="banglz_password"

# SQL file paths
SQL_FILE_1="/media/hassaan/Backup/Fiverr Projects/banglz/u981402959_banglz.sql"
SQL_FILE_2="/media/hassaan/Backup/Fiverr Projects/banglz/u981402959_pBNcU.sql"

echo "=========================================="
echo "Database Data Import Script"
echo "=========================================="
echo ""

# Create backup directory
BACKUP_DIR="./database_backups"
mkdir -p "$BACKUP_DIR"

# Backup current database
echo "Step 1: Creating backup of current database..."
BACKUP_FILE="$BACKUP_DIR/backup_$(date +%Y%m%d_%H%M%S).sql"
docker exec banglz_db mysqldump -u"$DB_USERNAME" -p"$DB_PASSWORD" "$DB_DATABASE" > "$BACKUP_FILE" 2>/dev/null

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
docker exec -i banglz_db mysql -u"$DB_USERNAME" -p"$DB_PASSWORD" "$DB_DATABASE" < "$SQL_FILE_1" 2>&1 | grep -v "Using a password"

if [ $? -eq 0 ]; then
    echo "✓ First SQL file imported successfully"
else
    echo "✗ First SQL file import had issues (check errors above)"
fi

echo ""

# Import second SQL file (larger one - 102MB)
echo "Importing u981402959_pBNcU.sql (102MB) - this may take a few minutes..."
docker exec -i banglz_db mysql -u"$DB_USERNAME" -p"$DB_PASSWORD" "$DB_DATABASE" < "$SQL_FILE_2" 2>&1 | grep -v "Using a password"

if [ $? -eq 0 ]; then
    echo "✓ Second SQL file imported successfully"
else
    echo "✗ Second SQL file import had issues (check errors above)"
fi

echo ""
echo "=========================================="
echo "Import Complete!"
echo "=========================================="
echo ""
echo "To verify the import, run:"
echo "  docker exec -it banglz_db mysql -u$DB_USERNAME -p$DB_PASSWORD $DB_DATABASE -e 'SHOW TABLES;'"
echo ""
echo "If you need to restore from backup:"
echo "  docker exec -i banglz_db mysql -u$DB_USERNAME -p$DB_PASSWORD $DB_DATABASE < $BACKUP_FILE"
echo ""
