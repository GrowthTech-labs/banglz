<?php

return [

    /*
    |--------------------------------------------------------------------------
    | Third Party Services
    |--------------------------------------------------------------------------
    |
    | This file is for storing the credentials for third party services such
    | as Mailgun, Postmark, AWS and more. This file provides the de facto
    | location for this type of information, allowing packages to have
    | a conventional file to locate the various service credentials.
    |
    */

    'mailgun' => [
        'domain' => env('MAILGUN_DOMAIN'),
        'secret' => env('MAILGUN_SECRET'),
        'endpoint' => env('MAILGUN_ENDPOINT', 'api.mailgun.net'),
        'scheme' => 'https',
    ],

    'postmark' => [
        'token' => env('POSTMARK_TOKEN'),
    ],

    'ses' => [
        'key' => env('AWS_ACCESS_KEY_ID'),
        'secret' => env('AWS_SECRET_ACCESS_KEY'),
        'region' => env('AWS_DEFAULT_REGION', 'us-east-1'),
    ],
   'stripe' => [
    'key' => env('STRIPE_KEY'),
    'secret' => env('STRIPE_SECRET'),
],

'paypal' => [
    'mode' => env('PAYPAL_MODE', 'sandbox'),
    'sandbox_client_id' => env('PAYPAL_SANDBOX_CLIENT_ID'),
    'sandbox_client_secret' => env('PAYPAL_SANDBOX_CLIENT_SECRET'),
    'live_client_id' => env('PAYPAL_LIVE_CLIENT_ID'),
    'live_client_secret' => env('PAYPAL_LIVE_CLIENT_SECRET'),
    'currency' => env('PAYPAL_CURRENCY', 'CAD'),
],

 'google' => [
        'maps_api_key' => env('GOOGLE_MAPS_API_KEY'),
    ],

      'gift_cards' => collect(explode(',', env('GIFT_CARD_PRICES', '1:10,2:20,3:25,4:50,5:75,6:100,7:150,8:250,9:500')))
        ->mapWithKeys(function ($item) {
            [$id, $price] = explode(':', $item);
            return [(int) $id => (int) $price];
        })
        ->toArray(),
        'stallion' => [
    'base_url' => env('STALLION_API_URL', 'https://ship.stallionexpress.ca/api/v4/'),
    'api_token' => env('STALLION_API_TOKEN'),
],

    'yotpo' => [
        'app_key' => env('YOTPO_APP_KEY'),
    ],

];
