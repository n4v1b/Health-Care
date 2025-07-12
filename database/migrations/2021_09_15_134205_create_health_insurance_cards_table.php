<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateHealthInsuranceCardsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     * Bảng thẻ BHYT
     */
    public function up()
    {
        Schema::create('health_insurance_cards', function (Blueprint $table) {
            $table->id();
            $table->integer('patient_id');
            $table->string('code');
            $table->string('hospital');
            $table->date('use_value');
            $table->string('id_card');
            $table->date('date_of_issue');
            $table->string('issued_by');
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
        Schema::dropIfExists('health_insurance_cards');
    }
}
