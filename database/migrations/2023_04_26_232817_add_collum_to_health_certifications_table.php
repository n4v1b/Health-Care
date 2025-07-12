<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddCollumToHealthCertificationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('health_certifications', function (Blueprint $table) {
            //
            $table->string('title')->nullable()->change();
            $table->integer('user_id')->nullable()->change();
            $table->integer('medical_service_id')->nullable()->after('user_id');
            $table->date('start_date')->nullable()->after('is_health_insurance_card');
            $table->date('end_date')->nullable()->after('start_date');
            $table->date('re_examination_date')->nullable()->after('start_date');
            $table->text('diagnostic')->nullable()->after('re_examination_date');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('health_certifications', function (Blueprint $table) {
            //
        });
    }
}
