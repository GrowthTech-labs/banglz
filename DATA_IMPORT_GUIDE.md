# Data Import Guide

## Overview
This guide will help you import data from the old Hostinger deployment SQL files into your current project without changing the database schema.

## SQL Files Location
- **File 1**: `/media/hassaan/Backup/Fiverr Projects/banglz/u981402959_banglz.sql` (325KB)
- **File 2**: `/media/hassaan/Backup/Fiverr Projects/banglz/u981402959_pBNcU.sql` (102MB)

## Prerequisites
- MySQL client installed
- Access to your database
- Backup of current data (script will create this automatically)

## Import Methods

### Method 1: Using Docker (if container is running)
```bash
./import-data.sh
```

### Method 2: Using Local MySQL
```bash
./import-data-local.sh
```

### Method 3: Manual Import
If you prefer to import manually:

```bash
# 1. Create backup
mysqldump -u root -p banglz > backup_$(date +%Y%m%d).sql

# 2. Import first SQL file
mysql -u root -p banglz < "/media/hassaan/Backup/Fiverr Projects/banglz/u981402959_banglz.sql"

# 3. Import second SQL file
mysql -u root -p banglz < "/media/hassaan/Backup/Fiverr Projects/banglz/u981402959_pBNcU.sql"
```

## What Will Be Imported

Based on the SQL file structure, the following data will be imported:

### From u981402959_banglz.sql:
- Bangle box colors (160 records)
- Bangle box sizes (4 records)
- Box sizes (2 records)
- Bangle cart colors
- Blogs and blog categories
- Bundles and bundle products
- Cards
- Carts
- Categories (36 categories including subcategories)
- Category boxes
- Collections and collection products
- Gift card codes and histories
- Orders (7 orders with complete metadata)
- And more...

### From u981402959_pBNcU.sql:
- Products (large dataset - 102MB)
- Product variations
- Product images
- Product tags
- And related product data

## Important Notes

1. **Schema Compatibility**: The SQL files contain both `CREATE TABLE` and `INSERT INTO` statements. If your current schema is different, you may need to:
   - Skip the `CREATE TABLE` statements (use `--no-create-info` flag)
   - Only import `INSERT` statements

2. **Data Conflicts**: If you have existing data with the same IDs, you may encounter:
   - Duplicate key errors
   - Foreign key constraint violations

3. **Large File Import**: The second file (102MB) may take several minutes to import.

## Troubleshooting

### If you get "Table already exists" errors:
```bash
# Extract only INSERT statements
grep "^INSERT INTO" "/media/hassaan/Backup/Fiverr Projects/banglz/u981402959_banglz.sql" > inserts_only.sql
mysql -u root -p banglz < inserts_only.sql
```

### If you get duplicate key errors:
```bash
# Add IGNORE to INSERT statements
sed 's/INSERT INTO/INSERT IGNORE INTO/g' "/media/hassaan/Backup/Fiverr Projects/banglz/u981402959_banglz.sql" > inserts_ignore.sql
mysql -u root -p banglz < inserts_ignore.sql
```

### If you need to clear existing data first:
```bash
# WARNING: This will delete all data!
mysql -u root -p banglz -e "SET FOREIGN_KEY_CHECKS=0; 
TRUNCATE TABLE products; 
TRUNCATE TABLE categories; 
TRUNCATE TABLE orders;
-- Add more tables as needed
SET FOREIGN_KEY_CHECKS=1;"
```

## Verification

After import, verify the data:

```bash
# Check table counts
mysql -u root -p banglz -e "
SELECT 'products' as table_name, COUNT(*) as count FROM products
UNION ALL
SELECT 'categories', COUNT(*) FROM categories
UNION ALL
SELECT 'orders', COUNT(*) FROM orders
UNION ALL
SELECT 'collections', COUNT(*) FROM collections;
"
```

## Rollback

If something goes wrong, restore from backup:

```bash
mysql -u root -p banglz < database_backups/backup_YYYYMMDD_HHMMSS.sql
```

## Next Steps

After successful import:

1. Clear application cache:
   ```bash
   php artisan cache:clear
   php artisan config:clear
   php artisan view:clear
   ```

2. Verify the data in your application:
   - Check products page
   - Check categories
   - Check orders in admin panel

3. Test critical functionality:
   - Product display
   - Cart functionality
   - Checkout process

## Support

If you encounter issues:
1. Check the backup file was created
2. Review error messages carefully
3. Check MySQL error log: `/var/log/mysql/error.log`
4. Ensure sufficient disk space for the import
