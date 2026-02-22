<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Country;

class CountriesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $countries = [
            ['code' => 'CA', 'name' => 'Canada', 'is_active' => true, 'sort_order' => 1],
            ['code' => 'US', 'name' => 'United States', 'is_active' => true, 'sort_order' => 2],
            ['code' => 'GB', 'name' => 'United Kingdom', 'is_active' => true, 'sort_order' => 3],
            ['code' => 'AU', 'name' => 'Australia', 'is_active' => true, 'sort_order' => 4],
            ['code' => 'IN', 'name' => 'India', 'is_active' => true, 'sort_order' => 5],
            ['code' => 'CN', 'name' => 'China', 'is_active' => true, 'sort_order' => 6],
            ['code' => 'JP', 'name' => 'Japan', 'is_active' => true, 'sort_order' => 7],
            ['code' => 'DE', 'name' => 'Germany', 'is_active' => true, 'sort_order' => 8],
            ['code' => 'FR', 'name' => 'France', 'is_active' => true, 'sort_order' => 9],
            ['code' => 'IT', 'name' => 'Italy', 'is_active' => true, 'sort_order' => 10],
            ['code' => 'ES', 'name' => 'Spain', 'is_active' => true, 'sort_order' => 11],
            ['code' => 'MX', 'name' => 'Mexico', 'is_active' => true, 'sort_order' => 12],
            ['code' => 'BR', 'name' => 'Brazil', 'is_active' => true, 'sort_order' => 13],
            ['code' => 'NL', 'name' => 'Netherlands', 'is_active' => true, 'sort_order' => 14],
            ['code' => 'SE', 'name' => 'Sweden', 'is_active' => true, 'sort_order' => 15],
            ['code' => 'NO', 'name' => 'Norway', 'is_active' => true, 'sort_order' => 16],
            ['code' => 'DK', 'name' => 'Denmark', 'is_active' => true, 'sort_order' => 17],
            ['code' => 'FI', 'name' => 'Finland', 'is_active' => true, 'sort_order' => 18],
            ['code' => 'PL', 'name' => 'Poland', 'is_active' => true, 'sort_order' => 19],
            ['code' => 'BE', 'name' => 'Belgium', 'is_active' => true, 'sort_order' => 20],
            ['code' => 'CH', 'name' => 'Switzerland', 'is_active' => true, 'sort_order' => 21],
            ['code' => 'AT', 'name' => 'Austria', 'is_active' => true, 'sort_order' => 22],
            ['code' => 'IE', 'name' => 'Ireland', 'is_active' => true, 'sort_order' => 23],
            ['code' => 'NZ', 'name' => 'New Zealand', 'is_active' => true, 'sort_order' => 24],
            ['code' => 'SG', 'name' => 'Singapore', 'is_active' => true, 'sort_order' => 25],
            ['code' => 'HK', 'name' => 'Hong Kong', 'is_active' => true, 'sort_order' => 26],
            ['code' => 'KR', 'name' => 'South Korea', 'is_active' => true, 'sort_order' => 27],
            ['code' => 'TH', 'name' => 'Thailand', 'is_active' => true, 'sort_order' => 28],
            ['code' => 'MY', 'name' => 'Malaysia', 'is_active' => true, 'sort_order' => 29],
            ['code' => 'PH', 'name' => 'Philippines', 'is_active' => true, 'sort_order' => 30],
            ['code' => 'ID', 'name' => 'Indonesia', 'is_active' => true, 'sort_order' => 31],
            ['code' => 'VN', 'name' => 'Vietnam', 'is_active' => true, 'sort_order' => 32],
            ['code' => 'PK', 'name' => 'Pakistan', 'is_active' => true, 'sort_order' => 33],
            ['code' => 'BD', 'name' => 'Bangladesh', 'is_active' => true, 'sort_order' => 34],
            ['code' => 'AE', 'name' => 'United Arab Emirates', 'is_active' => true, 'sort_order' => 35],
            ['code' => 'SA', 'name' => 'Saudi Arabia', 'is_active' => true, 'sort_order' => 36],
            ['code' => 'ZA', 'name' => 'South Africa', 'is_active' => true, 'sort_order' => 37],
            ['code' => 'EG', 'name' => 'Egypt', 'is_active' => true, 'sort_order' => 38],
            ['code' => 'NG', 'name' => 'Nigeria', 'is_active' => true, 'sort_order' => 39],
            ['code' => 'KE', 'name' => 'Kenya', 'is_active' => true, 'sort_order' => 40],
            ['code' => 'AR', 'name' => 'Argentina', 'is_active' => true, 'sort_order' => 41],
            ['code' => 'CL', 'name' => 'Chile', 'is_active' => true, 'sort_order' => 42],
            ['code' => 'CO', 'name' => 'Colombia', 'is_active' => true, 'sort_order' => 43],
            ['code' => 'PE', 'name' => 'Peru', 'is_active' => true, 'sort_order' => 44],
            ['code' => 'VE', 'name' => 'Venezuela', 'is_active' => true, 'sort_order' => 45],
            ['code' => 'TR', 'name' => 'Turkey', 'is_active' => true, 'sort_order' => 46],
            ['code' => 'GR', 'name' => 'Greece', 'is_active' => true, 'sort_order' => 47],
            ['code' => 'PT', 'name' => 'Portugal', 'is_active' => true, 'sort_order' => 48],
            ['code' => 'CZ', 'name' => 'Czech Republic', 'is_active' => true, 'sort_order' => 49],
            ['code' => 'RO', 'name' => 'Romania', 'is_active' => true, 'sort_order' => 50],
        ];

        foreach ($countries as $country) {
            Country::updateOrCreate(
                ['code' => $country['code']],
                $country
            );
        }

        $this->command->info('Countries seeded successfully! Total: ' . count($countries));
    }
}
