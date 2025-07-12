<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class ChangeColumnIntegerToDouble extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        DB::statement('ALTER TABLE service_vouchers MODIFY COLUMN total_money DOUBLE(24, 2)');
        DB::statement('ALTER TABLE prescription_details MODIFY COLUMN price DOUBLE(24, 2)');
        DB::statement('ALTER TABLE prescription_details MODIFY COLUMN total_money DOUBLE(24, 2)');
        DB::statement('ALTER TABLE prescriptions MODIFY COLUMN total_money DOUBLE(24, 2)');
        DB::statement('ALTER TABLE medicines MODIFY COLUMN price DOUBLE(24, 2)');
        DB::statement('ALTER TABLE medical_services MODIFY COLUMN price DOUBLE(24, 2)');
        DB::statement('ALTER TABLE health_certifications MODIFY COLUMN total_money DOUBLE(24, 2)');
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        DB::statement('ALTER TABLE service_vouchers MODIFY COLUMN total_money integer');
        DB::statement('ALTER TABLE prescription_details MODIFY COLUMN price integer');
        DB::statement('ALTER TABLE prescription_details MODIFY COLUMN total_money integer');
        DB::statement('ALTER TABLE prescriptions MODIFY COLUMN total_money integer');
        DB::statement('ALTER TABLE medicines MODIFY COLUMN price integer');
        DB::statement('ALTER TABLE medical_services MODIFY COLUMN price integer');
        DB::statement('ALTER TABLE health_certifications MODIFY COLUMN total_money integer');
    }
}
