<?php

use Illuminate\Routing\Router;

Admin::routes();

Route::group([
    'prefix'        => config('admin.route.prefix'),
    'namespace'     => config('admin.route.namespace'),
    'middleware'    => config('admin.route.middleware'),
    'as'            => config('admin.route.prefix') . '.',
], function (Router $router) {

    $router->get('/', 'HomeController@index')->name('home');
    $router->resource('participants', ParticipantController::class);
    $router->resource('mentors', MentorController::class);
    $router->resource('classes', ParticipantClassController::class);
    $router->resource('rooms', RoomController::class);
    $router->resource('schedules', ScheduleController::class);
    $router->resource('subjects', SubjectController::class);
    $router->resource('subject-classes', SubjectClassController::class);

});
