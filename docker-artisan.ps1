# Helper script to run artisan commands in Docker
# Usage: .\docker-artisan.ps1 migrate
# Usage: .\docker-artisan.ps1 cache:clear

param(
    [Parameter(ValueFromRemainingArguments=$true)]
    [string[]]$Command
)

if ($Command.Count -eq 0) {
    Write-Host "Usage: .\docker-artisan.ps1 <artisan-command>" -ForegroundColor Yellow
    Write-Host "Example: .\docker-artisan.ps1 migrate" -ForegroundColor Cyan
    Write-Host "Example: .\docker-artisan.ps1 cache:clear" -ForegroundColor Cyan
    exit
}

$artisanCommand = $Command -join " "
docker-compose exec app php artisan $artisanCommand
