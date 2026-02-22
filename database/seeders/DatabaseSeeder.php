<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        $this->call([
            AdminUserSeeder::class,
            CategorySeeder::class,
            CountriesSeeder::class,
            TagsAndCollectionsSeeder::class,
            ProductsSeeder::class,
            CollectionCategoriesSeeder::class,
            BangleBoxSeeder::class,
            AppointmentsSeeder::class,
            PageBannerSeeder::class,
        ]);
    }
}
