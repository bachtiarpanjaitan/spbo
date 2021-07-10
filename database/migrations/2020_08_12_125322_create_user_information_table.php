<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUserInformationTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        DB::statement("CREATE VIEW user_informations AS
        SELECT
        users.*,
        participants.is_mentor,
        participants.class_id,
        participant_classes.class_name
        FROM users
        INNER JOIN participants ON participants.user_id = users.id
        LEFT JOIN participant_classes ON participant_classes.id = participants.class_id");
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('user_informations');
    }
}
