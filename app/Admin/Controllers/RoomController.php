<?php

namespace App\Admin\Controllers;

use App\Models\Room;
use App\Http\Controllers\Controller;
use Encore\Admin\Controllers\HasResourceActions;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
use Encore\Admin\Show;

class RoomController extends Controller
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
            ->header('Ruangan')
            ->description('Daftar Ruangan')
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
        $grid = new Grid(new Room);

        $grid->id('ID');
        $grid->name('Nama Ruangan');
        $grid->max_participant('Maksimal Peserta');
        $grid->description('Keterangan');
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
        $show = new Show(Room::findOrFail($id));

        $show->id('ID');
        $show->name('Nama Ruangan');
        $show->max_participant('Maksimal Peserta');
        $show->description('Keterangan');
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
        $form = new Form(new Room);

        $form->display('ID');
        $form->text('name', 'Nama Ruangan');
        $form->number('max_participant', 'Maksimal Peserta');
        $form->textarea('description', 'Keterangan');

        return $form;
    }
}
