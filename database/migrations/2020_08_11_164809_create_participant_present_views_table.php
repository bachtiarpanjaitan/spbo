<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateParticipantPresentViewsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        DB::statement("
            CREATE VIEW participant_present_views AS
            SELECT 
            participant_presents.*,
            participants.user_id,
            users.name as user_name,
            users.email,
            schedules.name as schedule_name,
			schedules.mentor_id as mentor_id
            FROM participant_presents
            INNER JOIN participants ON participants.id = participant_presents.participant_id
            INNER JOIN users ON users.id = participants.user_id
            INNER JOIN schedules ON schedules.id = participant_presents.schedule_id"
        );
       
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
         DB::statement("DROP VIEW participant_present_views");
    }

}
