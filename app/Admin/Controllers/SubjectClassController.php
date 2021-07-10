<?php

namespace App\Admin\Controllers;

use App\Models\SubjectClass;
use App\Models\Subject;
use App\Models\ParticipantClass as PC;
use App\Http\Controllers\Controller;
use Encore\Admin\Controllers\HasResourceActions;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
use Encore\Admin\Show;

class SubjectClassController extends Controller
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
            ->header(trans('admin.index'))
            ->description(trans('admin.description'))
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
        $grid = new Grid(new SubjectClass);

        $grid->id('ID');
        $grid->subject_id('subject_id');
        $grid->class_id('class_id');
        $grid->created_at(trans('admin.created_at'));
        $grid->updated_at(trans('admin.updated_at'));

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
        $show = new Show(SubjectClass::findOrFail($id));

        $show->id('ID');
        $show->subject_id('subject_id');
        $show->class_id('class_id');
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
        $form = new Form(new SubjectClass);
        $subjects = Subject::all();
        $classes = PC::all();
        $data_subjects = [];
        $data_classes = [];
        $form->display('ID');
        foreach ($subjects as $key => $sbj) {
            $data_subjects[$sbj->id] = $sbj->name;
         }

         foreach ($classes as $key => $sbj) {
            $data_classes[$sbj->id] = $sbj->class_name;
         }
         $form->select('subject_id','Matakuliah')->options($data_subjects)->required();
        // $form->text('class_id', 'class_id');
        $form->select('class_id','Kelas')->options($data_classes)->required();
        $form->display(trans('admin.created_at'));
        $form->display(trans('admin.updated_at'));

        return $form;
    }
}
