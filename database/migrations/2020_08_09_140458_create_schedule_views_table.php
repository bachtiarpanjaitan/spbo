<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateScheduleViewsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        DB::statement("
            CREATE VIEW schedule_views AS
            SELECT
                schedules.*,
                participant_classes.class_name,
                rooms.name as room_name,
                rooms.max_participant room_max_participant,
                rooms.description as room_description,
                rooms.is_occupied,
                rooms.occupied_by_id,
                rooms.occupied_start,
                user_o.name as occupied_by_name,
                users.name as mentor_name, 
                users.email as mentor_email
            FROM schedules
            LEFT JOIN participant_classes ON participant_classes.id = schedules.class_id
            LEFT JOIN rooms ON rooms.id = schedules.room_id
            LEFT JOIN users as user_o on user_o.id = rooms.occupied_by_id
            LEFT JOIN users on users.id = schedules.mentor_id
        ");
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        DB::statement("DROP VIEW schedule_views");
    }
}
