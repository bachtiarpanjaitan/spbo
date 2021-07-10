<?php

use Illuminate\Support\Facades\Route;
use App\Http\Middleware\RoomMiddleware;
use App\Http\Middleware\ParticipantMiddleware;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function (Request $request) {
    return view('welcome');
})->name('home');
Route::get('/notparticipant', 'HomeController@notparticipant')->name('notparticipant');
Auth::routes();
	Route::middleware(['participant'])->group(function () {
	Route::get('/room/{id?}', 'RoomController@active_room')->name('room.active');
	Route::post('/schedule', 'ScheduleController@schedule_update')->name('schedule.update');
	Route::post('/schedule/participant', 'ScheduleController@participant')->name('schedule.participant');
	Route::post('/task/save', 'TaskController@save')->name('task.save');
	Route::post('/room/stop/{id?}', 'RoomController@stop_room')->name('room.stop');
	Route::post('/room/leave', 'RoomController@leave')->name('room.leave');
	Route::post('/schedule/save', 'ScheduleController@save')->name('schedule.save');
	Route::get('/schedule/add', 'ScheduleController@add')->name('schedule.add');
	Route::get('/kuis/list', 'QuizController@list')->name('quiz.list');
	Route::get('/kuis/add', 'QuizController@add')->name('quiz.add');
	Route::post('/kuis/save', 'QuizController@save')->name('quiz.save');
	Route::get('/kuis/question/add/{id}', 'QuizController@question_add')->name('quiz.question.add');
	Route::post('/kuis/question/save', 'QuizController@question_save')->name('quiz.question.save');
	Route::get('/kuis/delete/{id}', 'QuizController@delete')->name('quiz.delete');
	Route::get('/kuis/test/{id}', 'QuizController@quiz_test')->name('quiz.test');
	Route::post('/kuis/test/save-answer', 'QuizController@save_answer')->name('quiz.answer');
});

Route::middleware([RoomMiddleware::class, ParticipantMiddleware::class])->group(function () {
	Route::get('/home', 'HomeController@index')->name('home');
	Route::get('/schedule', 'ScheduleController@my_schedule_list')->name('schedule');
	Route::get('/schedule_detail/{id?}', 'ScheduleController@schedule_detail')->name('schedule.detail');
	Route::get('/task', 'TaskController@list')->name('task');
	Route::get('/profile', 'ProfileController@index')->name('profile');
	Route::get('/present', 'ScheduleController@present')->name('schedule.present');
	Route::get('/present/{id?}', 'ScheduleController@schedule_present')->name('schedule.schedule_present');
	Route::post('/profile/save', 'ProfileController@save')->name('profile.save');
	Route::get('/task/add', 'TaskController@add')->name('task.add');
	Route::get('/subject/{id?}', 'SubjectController@subject')->name('subject');
	Route::get('/materi/{id?}', 'TheoryController@detail')->name('theory.detail');
	Route::post('/materi/save', 'TheoryController@save')->name('theory.save');
	
});


Route::get('/cc', function (Request $request) {
    Artisan::call('cache:clear');
    echo '<script>alert("cache clear Success")</script>';
});
Route::get('/ccc', function (Request $request) {
    Artisan::call('config:cache');
    echo '<script>alert("config cache Success")</script>';
});
Route::get('/vc', function (Request $request) {
    Artisan::call('view:clear');
    echo '<script>alert("view clear Success")</script>';
});
Route::get('/rc', function (Request $request) {
    Artisan::call('route:cache');
    echo '<script>alert("route clear Success")</script>';
});
Route::get('/coc', function (Request $request) {
    Artisan::call('config:clear');
    echo '<script>alert("config clear Success")</script>';
});
Route::get('/opt', function (Request $request) {
    Artisan::call('optimize');
    echo '<script>alert("Optimize Success")</script>';
});