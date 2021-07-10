<?php

namespace App\Http\Controllers;
use App\User;
use Illuminate\Http\Request;
use App\Models\Schedule;
use App\Models\Participant;
use App\Models\SubjectClass as SC;
use Auth;
use App\Models\Subject;
class BaseController extends Controller
{
	public function __construct()
    {}

    public function load_menu()
    {

         $participant = Participant::where('user_id',Auth::user()->id)->first();
         if($participant->is_mentor) {
            return $subjects = Subject::all();
         }
         else {

            $subjects = SC::with('subject')->where('class_id',$participant->class_id)->get();
            return $subjects;
    }
        }

    public function participants()
    {
    	return Participant::all();
    }
}