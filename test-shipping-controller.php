<?php
// Test the Stallion API directly from PHP
// Run: docker exec banglz_app php test-shipping-controller.php

$curl = curl_init();

$payload = array(
  "to_address" => array(
    "name" => "Pramod Thomson",
    "address1" => "30 Clearview Dr",
    "city" => "Rock Springs",
    "province_code" => "WY",
    "postal_code" => "82901",
    "country_code" => "US",
    "phone" => "555-1234",
    "email" => "test@example.com",
    "is_residential" => true
  ),
  "weight_unit" => "lbs",
  "weight" => 0.6,
  "length" => 9,
  "width" => 12,
  "height" => 1,
  "size_unit" => "cm",
  "items" => array(
    array(
      "description" => "Gold Bangle",
      "sku" => "BGL-001",
      "quantity" => 2,
      "value" => 89.99,
      "currency" => "CAD",
      "country_of_origin" => "CA",
      "hs_code" => "7117.90.7500"
    )
  ),
  "package_type" => "Parcel",
  "signature_confirmation" => false,
  "insured" => false
);

curl_setopt_array($curl, [
  CURLOPT_HTTPHEADER => [
    "Authorization: Bearer qiMjcuAiYcvsGaKcVOMg4ENXMXtWJCLmIcjqq1y6BYsVW29Yv2W37vkdfsfv",
    "Content-Type: application/json"
  ],
  CURLOPT_POSTFIELDS => json_encode($payload),
  CURLOPT_URL => "https://ship.stallionexpress.ca/api/v4/rates",
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_CUSTOMREQUEST => "POST",
]);

echo "📤 Sending request to Stallion API...\n";
echo "Payload: " . json_encode($payload, JSON_PRETTY_PRINT) . "\n\n";

$response = curl_exec($curl);
$error = curl_error($curl);
$httpCode = curl_getinfo($curl, CURLINFO_HTTP_CODE);

curl_close($curl);

echo "HTTP Code: $httpCode\n";

if ($error) {
  echo "❌ cURL Error: " . $error . "\n";
} else {
  echo "✅ Response:\n";
  $data = json_decode($response, true);
  echo json_encode($data, JSON_PRETTY_PRINT) . "\n";
  
  if (isset($data['success']) && $data['success']) {
    echo "\n🎉 SUCCESS! Found " . count($data['rates'] ?? []) . " rates\n";
  } else {
    echo "\n❌ FAILED\n";
    if (isset($data['errors'])) {
      echo "Errors: " . json_encode($data['errors'], JSON_PRETTY_PRINT) . "\n";
    }
  }
}
