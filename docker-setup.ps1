# Banglz Docker Setup Script for Windows

Write-Host "🚀 Starting Banglz Docker Setup..." -ForegroundColor Green

# Build and start containers
Write-Host "`n📦 Building Docker containers..." -ForegroundColor Cyan
docker-compose up -d --build

# Wait for MySQL to be ready
Write-Host "`n⏳ Waiting for MySQL to be ready..." -ForegroundColor Cyan
Start-Sleep -Seconds 10

# Install Composer dependencies
Write-Host "`n📥 Installing Composer dependencies..." -ForegroundColor Cyan
docker-compose exec app composer install

# Generate application key
Write-Host "`n🔑 Generating application key..." -ForegroundColor Cyan
docker-compose exec app php artisan key:generate

# Run migrations
Write-Host "`n🗄️ Running database migrations..." -ForegroundColor Cyan
docker-compose exec app php artisan migrate --force

# Seed database
Write-Host "`n🌱 Seeding database..." -ForegroundColor Cyan
docker-compose exec app php artisan db:seed --force

# Create storage link
Write-Host "`n🔗 Creating storage link..." -ForegroundColor Cyan
docker-compose exec app php artisan storage:link

# Set permissions
Write-Host "`n🔐 Setting permissions..." -ForegroundColor Cyan
docker-compose exec app chmod -R 775 storage bootstrap/cache

# Build frontend assets
Write-Host "`n🎨 Building frontend assets..." -ForegroundColor Cyan
docker-compose run --rm node npm install
docker-compose run --rm node npm run build

Write-Host "`n✅ Setup Complete!" -ForegroundColor Green
Write-Host "`n📍 Access your application at:" -ForegroundColor Yellow
Write-Host "   🌐 Website: http://localhost:8000" -ForegroundColor White
Write-Host "   👤 Admin: http://localhost:8000/admin/login" -ForegroundColor White
Write-Host "   📊 phpMyAdmin: http://localhost:8080" -ForegroundColor White
Write-Host "`n🔑 Default Admin Credentials:" -ForegroundColor Yellow
Write-Host "   Email: admin@admin.com" -ForegroundColor White
Write-Host "   Password: admin" -ForegroundColor White
Write-Host "`n💡 Useful Commands:" -ForegroundColor Yellow
Write-Host "   Stop: docker-compose down" -ForegroundColor White
Write-Host "   Start: docker-compose up -d" -ForegroundColor White
Write-Host "   Logs: docker-compose logs -f app" -ForegroundColor White
Write-Host "   Shell: docker-compose exec app bash" -ForegroundColor White
