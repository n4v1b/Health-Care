<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateHealthCertificationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     * Bảng giấy khám sức khỏe
     */
    public function up()
    {
        Schema::create('health_certifications', function (Blueprint $table) {
            $table->id();
            $table->string('title');
            $table->integer('patient_id');
            $table->integer('consulting_room_id');
            $table->integer('user_id');
            $table->string('code');
            $table->integer('status');
            $table->integer('payment_status')->default(0);
            $table->string('conclude')->nullable();
            $table->string('treatment_guide')->nullable();
            $table->string('suggestion')->nullable();
            $table->integer('number');
            $table->integer('total_money');
            $table->integer('is_health_insurance_card');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('health_certifications');
    }
}
