<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\PageSetting;

class PageBannerSeeder extends Seeder
{
    public function run()
    {
        $pages = [
            [
                'page_name' => 'contact_us',
                'page_type' => 'contact_us',
                'heading' => 'Contact Us',
                'sub_heading' => 'Get in touch with us',
                'description' => 'We would love to hear from you',
                'image' => 'default-banner.jpg',
                'images' => json_encode([
                    [
                        'src' => 'default-banner.jpg',
                        'transform' => ''
                    ]
                ]),
                'meta_data' => json_encode([
                    'sections' => [
                        'hero' => [
                            'heading' => 'Contact Us',
                            'images' => [
                                [
                                    'src' => 'default-banner.jpg',
                                    'transform' => ''
                                ]
                            ]
                        ]
                    ]
                ])
            ],
            [
                'page_name' => 'resource',
                'page_type' => 'resource',
                'heading' => 'Resources',
                'sub_heading' => 'Everything you need to know',
                'description' => 'Find helpful information and resources',
                'image' => 'default-banner.jpg',
                'images' => json_encode([
                    [
                        'src' => 'default-banner.jpg',
                        'transform' => ''
                    ]
                ]),
                'meta_data' => json_encode([
                    'sections' => [
                        'hero' => [
                            'heading' => 'Resources',
                            'images' => [
                                [
                                    'src' => 'default-banner.jpg',
                                    'transform' => ''
                                ]
                            ]
                        ]
                    ]
                ])
            ]
        ];

        foreach ($pages as $page) {
            PageSetting::updateOrCreate(
                ['page_name' => $page['page_name']],
                $page
            );
        }
    }
}
