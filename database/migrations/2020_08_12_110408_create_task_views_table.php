<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTaskViewsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        DB::statement("CREATE VIEW task_views AS
        SELECT
        tasks.*,
        schedules.room_id,
        schedules.class_id as schedule_class_id,
        class.class_name as  class_name,
        schedules.name as schedule_name,
        rooms.name as room_name,
        class.class_name as participant_class_name,
        users.name as user_name
        FROM tasks
        LEFT JOIN schedules on schedules.id = tasks.schedule_id
        LEFT JOIN rooms on rooms.id = schedules.room_id
        -- LEFT JOIN participant_classes on participant_classes.id = schedules.class_id
        LEFT JOIN participant_classes as class on class.id = schedules.class_id
        INNER JOIN users on users.id = tasks.created_by
        ");
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
         DB::statement("DROP VIEW task_views");
    }
}
