<?php

namespace App\Providers;

use Illuminate\Support\Facades\URL;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        // Force HTTPS in production
        if (app()->environment('production')) {
            URL::forceScheme('https');
        }
        
        // Override the public path to prevent /public/ in asset URLs
        // This is needed when public folder contents are moved to document root
        $this->app->bind('path.public', function() {
            return base_path(); // Point to root instead of public folder
        });
    }
}
