<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateParticipantPresentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('participant_presents', function (Blueprint $table) {
            $table->id();
            $table->integer('schedule_id')->index();
            $table->integer('participant_id');
            $table->dateTime('datetime');
            $table->tinyInteger('present')->default(0);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('participant_presents');
    }
}
