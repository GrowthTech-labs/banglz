<?php

namespace Database\Seeders;

use App\Models\Country;
use Illuminate\Database\Seeder;

class CountrySeeder extends Seeder
{
    public function run(): void
    {
        $countries = [
            ['code' => 'US', 'name' => 'United States', 'sort_order' => 1],
            ['code' => 'CA', 'name' => 'Canada', 'sort_order' => 2],
            ['code' => 'GB', 'name' => 'United Kingdom', 'sort_order' => 3],
            ['code' => 'AU', 'name' => 'Australia', 'sort_order' => 4],
            ['code' => 'NZ', 'name' => 'New Zealand', 'sort_order' => 5],
            ['code' => 'IE', 'name' => 'Ireland', 'sort_order' => 6],
            ['code' => 'DE', 'name' => 'Germany', 'sort_order' => 7],
            ['code' => 'FR', 'name' => 'France', 'sort_order' => 8],
            ['code' => 'IT', 'name' => 'Italy', 'sort_order' => 9],
            ['code' => 'ES', 'name' => 'Spain', 'sort_order' => 10],
            ['code' => 'NL', 'name' => 'Netherlands', 'sort_order' => 11],
            ['code' => 'BE', 'name' => 'Belgium', 'sort_order' => 12],
            ['code' => 'CH', 'name' => 'Switzerland', 'sort_order' => 13],
            ['code' => 'AT', 'name' => 'Austria', 'sort_order' => 14],
            ['code' => 'SE', 'name' => 'Sweden', 'sort_order' => 15],
            ['code' => 'NO', 'name' => 'Norway', 'sort_order' => 16],
            ['code' => 'DK', 'name' => 'Denmark', 'sort_order' => 17],
            ['code' => 'FI', 'name' => 'Finland', 'sort_order' => 18],
            ['code' => 'PL', 'name' => 'Poland', 'sort_order' => 19],
            ['code' => 'PT', 'name' => 'Portugal', 'sort_order' => 20],
            ['code' => 'GR', 'name' => 'Greece', 'sort_order' => 21],
            ['code' => 'CZ', 'name' => 'Czech Republic', 'sort_order' => 22],
            ['code' => 'HU', 'name' => 'Hungary', 'sort_order' => 23],
            ['code' => 'RO', 'name' => 'Romania', 'sort_order' => 24],
            ['code' => 'BG', 'name' => 'Bulgaria', 'sort_order' => 25],
            ['code' => 'HR', 'name' => 'Croatia', 'sort_order' => 26],
            ['code' => 'SK', 'name' => 'Slovakia', 'sort_order' => 27],
            ['code' => 'SI', 'name' => 'Slovenia', 'sort_order' => 28],
            ['code' => 'LT', 'name' => 'Lithuania', 'sort_order' => 29],
            ['code' => 'LV', 'name' => 'Latvia', 'sort_order' => 30],
            ['code' => 'EE', 'name' => 'Estonia', 'sort_order' => 31],
            ['code' => 'JP', 'name' => 'Japan', 'sort_order' => 32],
            ['code' => 'CN', 'name' => 'China', 'sort_order' => 33],
            ['code' => 'IN', 'name' => 'India', 'sort_order' => 34],
            ['code' => 'KR', 'name' => 'South Korea', 'sort_order' => 35],
            ['code' => 'SG', 'name' => 'Singapore', 'sort_order' => 36],
            ['code' => 'HK', 'name' => 'Hong Kong', 'sort_order' => 37],
            ['code' => 'TW', 'name' => 'Taiwan', 'sort_order' => 38],
            ['code' => 'MY', 'name' => 'Malaysia', 'sort_order' => 39],
            ['code' => 'TH', 'name' => 'Thailand', 'sort_order' => 40],
            ['code' => 'PH', 'name' => 'Philippines', 'sort_order' => 41],
            ['code' => 'ID', 'name' => 'Indonesia', 'sort_order' => 42],
            ['code' => 'VN', 'name' => 'Vietnam', 'sort_order' => 43],
            ['code' => 'PK', 'name' => 'Pakistan', 'sort_order' => 44],
            ['code' => 'BD', 'name' => 'Bangladesh', 'sort_order' => 45],
            ['code' => 'AE', 'name' => 'United Arab Emirates', 'sort_order' => 46],
            ['code' => 'SA', 'name' => 'Saudi Arabia', 'sort_order' => 47],
            ['code' => 'IL', 'name' => 'Israel', 'sort_order' => 48],
            ['code' => 'TR', 'name' => 'Turkey', 'sort_order' => 49],
            ['code' => 'ZA', 'name' => 'South Africa', 'sort_order' => 50],
            ['code' => 'EG', 'name' => 'Egypt', 'sort_order' => 51],
            ['code' => 'NG', 'name' => 'Nigeria', 'sort_order' => 52],
            ['code' => 'KE', 'name' => 'Kenya', 'sort_order' => 53],
            ['code' => 'BR', 'name' => 'Brazil', 'sort_order' => 54],
            ['code' => 'MX', 'name' => 'Mexico', 'sort_order' => 55],
            ['code' => 'AR', 'name' => 'Argentina', 'sort_order' => 56],
            ['code' => 'CL', 'name' => 'Chile', 'sort_order' => 57],
            ['code' => 'CO', 'name' => 'Colombia', 'sort_order' => 58],
            ['code' => 'PE', 'name' => 'Peru', 'sort_order' => 59],
            ['code' => 'VE', 'name' => 'Venezuela', 'sort_order' => 60],
            ['code' => 'RU', 'name' => 'Russia', 'sort_order' => 61],
            ['code' => 'UA', 'name' => 'Ukraine', 'sort_order' => 62],
        ];

        foreach ($countries as $country) {
            Country::updateOrCreate(
                ['code' => $country['code']],
                $country
            );
        }
    }
}
