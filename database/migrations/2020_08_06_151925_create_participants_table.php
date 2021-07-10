<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateParticipantsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('participants', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('user_id')->index();
            $table->integer('class_id')->index()->nullable();
            $table->string('zoom_id')->comment('zoom user id')->nullable();
            $table->string('zoom_firstname')->nullable();
            $table->string('zoom_lastname')->nullable();
            $table->string('zoom_email')->nullable();
            $table->integer('zoom_type');
            $table->tinyInteger('is_mentor');
            $table->tinyInteger('live_status')->default(0);
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
        Schema::dropIfExists('participants');
    }
}
