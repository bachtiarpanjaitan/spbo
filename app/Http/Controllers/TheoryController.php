<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Theory;
use Validator;
use App\Models\Topic;

class TheoryController extends BaseController
{
    public function detail(Request $request)
    {
    	if(empty($request->id) || !isset($request->id)) return redirect()->back();

    	$theory = Theory::findOrFail($request->id);

    	if(empty($theory)) return redirect()->back();

    	return view('theory_detail',compact('theory'))->with('side_subjects',$this->load_menu())->with('all_participants',$this->participants());
    }

    public function save(Request $request)
    {

    	$validations = Validator::make($request->all(), [
            'topic_id' => 'required',
            'name' => 'required',
            'content' => 'required'
        ]);

        // dd($request->all());


        if ($validations->fails()) {
            return redirect()->back()
                        ->withErrors($validations)
                        ->withInput();
        }

        $topic = Topic::findOrFail($request->topic_id);

        if(empty($topic)) return redirect()->back();

        $theory = new Theory();
        $theory->topic_id = $request->topic_id;
        $theory->name = $request->name;
        $theory->content = $request->content;
        $theory->description = $request->description;
        $theory->save();

        return redirect()->back();

    }
}
