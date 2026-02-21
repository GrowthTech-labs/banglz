<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('products', function (Blueprint $table) {
            $table->string('country_of_origin', 2)->nullable()->after('weight_unit')->comment('ISO 2-letter country code');
            $table->string('hs_code', 10)->nullable()->after('country_of_origin')->comment('Harmonized System code for customs');
        });

        Schema::table('product_variations', function (Blueprint $table) {
            $table->string('country_of_origin', 2)->nullable()->after('weight_unit')->comment('ISO 2-letter country code');
            $table->string('hs_code', 10)->nullable()->after('country_of_origin')->comment('Harmonized System code for customs');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('products', function (Blueprint $table) {
            $table->dropColumn(['country_of_origin', 'hs_code']);
        });

        Schema::table('product_variations', function (Blueprint $table) {
            $table->dropColumn(['country_of_origin', 'hs_code']);
        });
    }
};
