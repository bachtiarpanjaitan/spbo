<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateSchedulesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('schedules', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name');
            $table->integer('room_id');
            $table->integer('class_id');
            $table->integer('subject_id');
            $table->string('room_api_id',50)->nullable();
            $table->string('room_url',100)->nullable();
            $table->string('room_privacy',10)->nullable();
            $table->dateTime('datetime')->nullable();
            $table->integer('mentor_id')->nullable();
            $table->integer('session_long')->comment('lama waktu pertemuan')->nullable();
            $table->text('description')->nullable();
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
        Schema::dropIfExists('schedules');
    }
}
