<?php

namespace App\Admin\Controllers;

use App\Models\ParticipantClass;
use App\Http\Controllers\Controller;
use Encore\Admin\Controllers\HasResourceActions;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
use Encore\Admin\Show;
use App\User;
use App\Models\Participant;
class ParticipantClassController extends Controller
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
            ->header('Kelas')
            ->description('Daftar Kelas')
            ->body($this->grid());
    }

    /**i
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
        $grid = new Grid(new ParticipantClass);

        $grid->id('ID');
        $grid->class_name('class_name','Nama Kelas');
        $grid->users('Mentor')->display(function($user){
            // dd($user);
            return $user['name'];
        });
        $grid->description('description','Keterangan');
        $grid->created_at('Dibuat')->display(function($created){
            return beautify_datetime($created);
        });
        $grid->updated_at('Diubah')->display(function($update){
            return !empty($update)?beautify_datetime($update):'';
        });

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
        $show = new Show(ParticipantClass::findOrFail($id));

        $show->id('ID');
        $show->class_name('class_name');
        $show->mentor_id('mentor_id');
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
        $form = new Form(new ParticipantClass);
        $form->column(1/2, function ($f) {
            $users = Participant::where('is_mentor',1)->get();

            $data_users = [];
            foreach($users as $user)
            {
               $data_users[$user->user_id] = $user->zoom_firstname;
            }
            $f->select('mentor_id','Pilih Mentor')->options($data_users);
            $f->text('class_name', 'class_name');
            $f->textarea('description', 'description');
        });
        return $form;
    }
}
