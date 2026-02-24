#!/bin/bash

SQL_FILE_1="/media/hassaan/Backup/Fiverr Projects/banglz/u981402959_banglz.sql"
SQL_FILE_2="/media/hassaan/Backup/Fiverr Projects/banglz/u981402959_pBNcU.sql"

echo "=========================================="
echo "SQL Files Analysis"
echo "=========================================="
echo ""

echo "File 1: u981402959_banglz.sql"
echo "Size: $(du -h "$SQL_FILE_1" | cut -f1)"
echo ""
echo "Tables and approximate record counts:"
grep "^INSERT INTO" "$SQL_FILE_1" | sed 's/INSERT INTO `\([^`]*\)`.*/\1/' | sort | uniq -c | sort -rn
echo ""
echo "=========================================="
echo ""

echo "File 2: u981402959_pBNcU.sql"
echo "Size: $(du -h "$SQL_FILE_2" | cut -f1)"
echo ""
echo "Tables (first 20):"
grep "^INSERT INTO" "$SQL_FILE_2" | sed 's/INSERT INTO `\([^`]*\)`.*/\1/' | sort | uniq -c | sort -rn | head -20
echo ""
echo "=========================================="
echo ""

echo "Sample data from first file:"
echo ""
echo "Categories:"
grep "INSERT INTO \`categories\`" "$SQL_FILE_1" | head -1 | cut -c1-200
echo "..."
echo ""

echo "Products (from second file):"
grep "INSERT INTO \`products\`" "$SQL_FILE_2" | head -1 | cut -c1-200
echo "..."
echo ""
