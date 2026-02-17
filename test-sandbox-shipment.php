<?php
// Test Production Shipment Creation with DRAFT MODE
// Run: docker exec banglz_app php test-sandbox-shipment.php

$curl = curl_init();

$payload = array(
  "to_address" => array(
    "name" => "Pramod Thomson",
    "company" => null,
    "address1" => "30 Clearview Dr",
    "address2" => null,
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
      "description" => "Gold Bangle Set",
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
  "postage_type" => "USPS First Class Mail",
  "label_format" => "pdf",
  "is_fba" => false,
  "is_draft" => true,  // DRAFT MODE - no charge
  "insured" => false
);

curl_setopt_array($curl, [
  CURLOPT_HTTPHEADER => [
    "Authorization: Bearer qiMjcuAiYcvsGaKcVOMg4ENXMXtWJCLmIcjqq1y6BYsVW29Yv2W37vkdfsfv",
    "Content-Type: application/json",
    "Idempotency-Key: test_draft_" . time()
  ],
  CURLOPT_POSTFIELDS => json_encode($payload),
  CURLOPT_URL => "https://ship.stallionexpress.ca/api/v4/shipments",
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_CUSTOMREQUEST => "POST",
]);

echo "📤 Testing Production API with DRAFT MODE...\n";
echo "URL: https://ship.stallionexpress.ca/api/v4/shipments\n";
echo "Token: qiMjcuAiYcvsGaKcVOMg4ENXMXtWJCLmIcjqq1y6BYsVW29Yv2W37vkdfsfv\n";
echo "Draft Mode: TRUE (no charge)\n\n";
echo "Payload:\n";
echo json_encode($payload, JSON_PRETTY_PRINT) . "\n\n";

$response = curl_exec($curl);
$error = curl_error($curl);
$httpCode = curl_getinfo($curl, CURLINFO_HTTP_CODE);

curl_close($curl);

echo "HTTP Code: $httpCode\n\n";

if ($error) {
  echo "❌ cURL Error: " . $error . "\n";
} else {
  echo "Response:\n";
  $data = json_decode($response, true);
  if ($data) {
    echo json_encode($data, JSON_PRETTY_PRINT) . "\n";
    
    if (isset($data['success']) && $data['success']) {
      echo "\n✅ SUCCESS! Draft shipment created\n";
      if (isset($data['id'])) {
        echo "Shipment ID: " . $data['id'] . "\n";
      }
      if (isset($data['tracking_number'])) {
        echo "Tracking: " . $data['tracking_number'] . "\n";
      }
      if (isset($data['total'])) {
        echo "Cost: " . $data['total'] . " " . ($data['currency'] ?? 'CAD') . "\n";
      }
    } else {
      echo "\n❌ FAILED\n";
      if (isset($data['errors'])) {
        echo "Errors:\n";
        echo json_encode($data['errors'], JSON_PRETTY_PRINT) . "\n";
      }
    }
  } else {
    echo $response . "\n";
  }
}
