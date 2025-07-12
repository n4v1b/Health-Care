<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateConsultingRoomsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     * Bảng phòng khám
     */
    public function up()
    {
        Schema::create('consulting_rooms', function (Blueprint $table) {
            $table->id();
            $table->string('code');
            $table->string('name');
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
        Schema::dropIfExists('consulting_rooms');
    }
}
