<?php

namespace App\Admin\Controllers;

use App\Models\Subject;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

use App\Models\Topic;

class SubjectController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Subject';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Subject());

        $grid->column('id', __('Id'));
        $grid->column('code', __('Code'));
        $grid->column('semester', __('Semester'));
        $grid->column('sks', __('Sks'));
        $grid->column('name', __('Name'));
        $grid->column('description', __('Description'));

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
        $show = new Show(Subject::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('code', __('Code'));
        $show->field('semester', __('Semester'));
        $show->field('sks', __('Sks'));
        $show->field('name', __('Name'));
        $show->field('description', __('Description'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Subject());

        $form->text('code', __('Code'))->required();
        $form->number('semester', __('Semester'))->required();
        $form->number('sks', __('Sks'))->required();
        $form->text('name', __('Name'))->required();
        $form->textarea('description', __('Description'));
       
        $form->saved(function (Form $form) {
            for ($i=1; $i <=16 ; $i++) { 
               $topic = new Topic();
               $topic->subject_id = $form->model()->id;
               $topic->topic_index = $i;
               $topic->name = 'Topic '.$i;
               $topic->save();
            }

        });

        return $form;
    }
}
