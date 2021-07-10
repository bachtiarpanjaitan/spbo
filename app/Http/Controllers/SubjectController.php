<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Subject;
use App\Models\Quiz;
use App\Models\SubjectClass as VC;
use App\Models\Participant;
use Auth;

class SubjectController extends BaseController
{
    public function subject(Request $request)
    {
		
    	if(empty($request->id) || !isset($request->id)) return redirect()->back();

    	$participant = Participant::where('user_id',Auth::user()->id)->first();

    	$subject = Subject::with('topics')->find($request->id);
    	$classes = VC::where('subject_id',$subject->id)->get();
    	// dd($classes);
    	$has_subject = VC::where('subject_id',$subject->id)->whereHas('participant_class', function($data)use($participant){
    		$data->where('id',$participant->class_id);
    	})->get();
    	if($has_subject->count() <= 0  && !$participant->is_mentor) return redirect()->route('home');

        $quizzes = Quiz::where('subject_id',$subject->id)->get();

    	return view('subject',compact('quizzes','subject','classes','participant'))->with('side_subjects',$this->load_menu())->with('all_participants',$this->participants());
    }
}
