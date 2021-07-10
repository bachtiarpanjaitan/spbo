<?php

namespace App\Admin\Controllers;

use App\Models\Participant;
use App\Models\ParticipantClass;
use App\Http\Controllers\Controller;
use Encore\Admin\Controllers\HasResourceActions;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
use Encore\Admin\Show;
use App\User;
class ParticipantController extends Controller
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
            ->header(trans('Peserta Didik'))
            ->description('Daftar Peserta Didik')
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
            ->description('Ubah Peserta Didik')
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
        // dd($form);
        return $content
            ->header(trans('admin.create'))
            ->description('Buat Peserta Didik')
            ->body($this->form());
    }

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Participant);

        // $grid->id('ID');
        $grid->column('user_id','ID Pengguna');
        $grid->column('zoom_firstname','Nama Stream');
        $grid->participant_class('Kelas')->display(function($class){
            // dd($class);
            return $class?$class['class_name']:'';
        });

        $grid->column('zoom_id','ID Stream');
        $grid->column('zoom_email','Email Stream');
        // $grid->zoom_type('zoom_type');
        // $grid->is_mentor('is_mentor');
        $grid->live_status('Status')->display(function($status){
            return $status?'<span class="badge bg-success">Online</span>':'<span class="badge bg-danger">Offline</span>';
        });
        $grid->created_at('Dibuat')->display(function($created){
            return beautify_datetime($created);
        });
        $grid->updated_at('Diubah')->display(function($update){
            return !empty($update)?beautify_datetime($update):'';
        });
        $grid->model()->where('is_mentor',0);

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
        $show = new Show(Participant::findOrFail($id));

        $show->id('ID');
        $show->user_id('user_id');
        $show->class_id('class_id');
        $show->zoom_id('ID Stream');
        $show->zoom_firstname('Nama Depan Stream');
        $show->zoom_lastname('Nama Belakang Stream');
        $show->zoom_email('Emal Stream');
        $show->zoom_type('Tipe Stream');
        $show->is_mentor('is_mentor');
        $show->live_status('live_status');
         $show->created_at('Dibuat')->display(function($created){
            return beautify_datetime($created);
        });
        $show->updated_at('Diubah')->display(function($update){
            return !empty($update)?beautify_datetime($update):'';
        });
        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Participant);
        $form->column(1/2, function ($f) {
            $users = User::all();
            $classes = ParticipantClass::all();

            $data_users = [];
            $data_clases = [];
            foreach($users as $user)
            {
               $data_users[$user->id] = $user->name;
            }

            foreach ($classes as $key => $class) {
               $data_clases[$class->id] = $class->class_name;
            }

            $f->select('user_id','Pilih Pengguna')->options($data_users);

            $f->select('class_id','Kelas')->options($data_clases);

            $f->text('zoom_id', 'ID Stream');            
            $f->text('zoom_firstname', 'Nama Depan');            
            $f->text('zoom_lastname', 'Nama Belakang');      
            $f->select('zoom_type','Tipe Akun Stream')->options([1 => 'Basic', 2 => 'Lisenced', 3 => 'On-Prem']);
            $f->radio('is_mentor','Jadikan Mentor')->options([0 => 'Tidak', 1 => 'Ya'])->default(0);
        });

        return $form;
    }
}
