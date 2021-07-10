<?php

namespace App\Admin\Controllers;

use App\Models\Schedule;
use App\Http\Controllers\Controller;
use Encore\Admin\Controllers\HasResourceActions;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
use Encore\Admin\Show;
use App\Models\ParticipantClass;
use App\Models\Room;
use App\Models\Participant;
use App\User;
use App\Models\Subject;
class ScheduleController extends Controller
{
    use HasResourceActions;

    /**
     * Index interface.
     *
     * @param Content $content
     * @return Content
     */
    public function index(Content $content)
    {
        return $content
            ->header('Jadwal')
            ->description('Daftar Jadwal')
            ->body($this->grid());
    }

    /**
     * Show interface.
     *
     * @param mixed $id
     * @param Content $content
     * @return Content
     */
    public function show($id, Content $content)
    {
        return $content
            ->header(trans('admin.detail'))
            ->description(trans('admin.description'))
            ->body($this->detail($id));
    }

    /**
     * Edit interface.
     *
     * @param mixed $id
     * @param Content $content
     * @return Content
     */
    public function edit($id, Content $content)
    {
        return $content
            ->header(trans('admin.edit'))
            ->description(trans('admin.description'))
            ->body($this->form()->edit($id));
    }

    /**
     * Create interface.
     *
     * @param Content $content
     * @return Content
     */
    public function create(Content $content)
    {
        return $content
            ->header(trans('admin.create'))
            ->description(trans('admin.description'))
            ->body($this->form());
    }

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Schedule);

        $grid->id('ID');
        $grid->name('Jadwal');
        // $grid->room_id('room_id');
        $grid->rooms('Ruangan')->display(function($room){
            // dd($room);
            return $room?$room['name']:'';
        });
        // $grid->class_id('class_id');
        $grid->participant_class('Kelas')->display(function($class){
            return $class?$class['class_name']:'';
        });
        $grid->day('Hari')->display(function($day){
            // dd($day);
            return get_day_name($day);
        });
        $grid->time('Waktu');
        // $grid->mentor_id('mentor_id');
        $grid->mentor('Mentor')->display(function($mentor){
            // dd($mentor);
            return $mentor?$mentor['name']:'';
        });
        $grid->session_long('Lama Sesi (Menit)');
        $grid->description('Keterangan');
        // $grid->created_at('Dibuat')->display(function($created){
        //     return beautify_datetime($created);
        // });
        // $grid->updated_at('Diubah')->display(function($update){
        //     return !empty($update)?beautify_datetime($update):'';
        // });

        return $grid;
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(Schedule::findOrFail($id));

        $show->id('ID');
        $show->name('name');
        $show->room_id('room_id');
        $show->class_id('class_id');
        $show->time('datetime');
        $show->mentor_id('mentor_id');
        $show->session_long('session_long');
        $show->description('description');
        $show->created_at(trans('admin.created_at'));
        $show->updated_at(trans('admin.updated_at'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Schedule);
        $classes = ParticipantClass::all();
        $mentors = Participant::where('is_mentor',1)->get();
        $users = User::all();
        $rooms = Room::all();
        $subjects = Subject::all();
        $data_clases = [];
        $data_rooms = [];
        $data_mentors = [];
        $data_subjects = [];
        foreach ($classes as $key => $class) {
           $data_clases[$class->id] = $class->class_name;
        }

        foreach ($rooms as $key => $room) {
           $data_rooms[$room->id] = $room->name;
        }

        foreach ($mentors as $key => $mentor) {
            $user = $users->where('id',$mentor->user_id)->first();
            $data_mentors[$mentor->user_id] = $user->name;
        }

        foreach ($subjects as $key => $subject) {
            $data_subjects[$subject->id] = $subject->name;
        }

        $form->display('ID');
        $form->text('name', 'name')->required();
        $form->select('room_id','Ruangan')->options($data_rooms)->required();
        $form->select('class_id','Kelas')->options($data_clases)->required();
        $form->select('subject_id','Mata Kuliah')->options($data_subjects)->required();
        $form->select('day','Hari')->options(day_name())->required();
        $form->time('time', 'Waktu')->required();
        $form->select('mentor_id','Mentor')->options($data_mentors)->required();
        $form->number('session_long', 'Lama Sesi / Menit')->required();
        $form->textarea('description', 'description');

        return $form;
    }
}
