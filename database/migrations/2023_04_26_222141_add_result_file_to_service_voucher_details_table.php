<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddResultFileToServiceVoucherDetailsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('service_voucher_details', function (Blueprint $table) {
            //
            $table->string('result_file')->nullable()->after('result');
            $table->bigInteger('health_certification_id')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('service_voucher_details', function (Blueprint $table) {
            //
            $table->dropColumn('result_file');
        });
    }
}
