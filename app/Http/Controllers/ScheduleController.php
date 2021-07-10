<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\ScheduleView as SV;
use App\Models\Participant;
use App\Models\ParticipantClass as PC;
use Auth;
use App\Models\Schedule;
use App\Models\Room;
use App\Models\Subject;
use App\Models\ParticipantPresent as PP;
use App\Models\ParticipantPresentView as PPV;
use Validator;
class ScheduleController extends BaseController
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function my_schedule_list(Request $r)
    {
    	$participant = Participant::where('user_id',Auth::user()->id)->first();
    	// dd($participant);
    	if($participant->is_mentor)
    	{
    		$schedules = SV::where('mentor_id',$participant->user_id)->get();
    	}else{
    		$schedules = SV::where('class_id',$participant->class_id)->get();
    	}
    	// dd($schedules);
    	return view('schedule',compact('schedules','participant'))->with('side_subjects',$this->load_menu())->with('all_participants',$this->participants());
    }

    public function schedule_detail(Request $request)
    {
    	$id = $request->id;
    	$schedule = SV::findOrFail($id);
    	
    	$participant = Participant::where('user_id',Auth::user()->id)->where('is_mentor',1)->first();
    		if($participant) $is_mentor = 1;
    		else $is_mentor = 0;
    		
    	if(empty($schedule)) return redirect()->back();
    	else return view('schedule_detail',compact('schedule','is_mentor'))->with('side_subjects',$this->load_menu())->with('all_participants',$this->participants());
    }

    public function schedule_update(Request $request)
    {
        $sch = Schedule::findOrFail($request->schedule_id);

        if(empty($sch)) return redirect()->back();
        $sch->room_api_id = $request->room_api_id;
        $sch->room_url = $request->room_url;
        $sch->room_privacy = $request->room_privacy;
        $sch->save();
    }

    public function participant(Request $request)
    {
        $s_id = $request->schedule_id;
        $participant = PPV::where('schedule_id',$s_id)->get();
        return json_encode(['success'=> true,'data'=>$participant]);
    }
	
	public function add()
	{
		$rooms = Room::all();
		$classes = PC::all();
		$days = day_name();
        $subjects = Subject::all();
		return view('schedule_add',compact('rooms','classes','days','subjects'))->with('side_subjects',$this->load_menu())->with('all_participants',$this->participants());
	}
	
	public function save(Request $request)
	{

        $validations = Validator::make($request->all(), [
            'room_id' => 'required',
            'class_id' => 'required',
            'name' => 'required',
            'subject_id' => 'required',
            'day' => 'required'
        ]);

        // dd($request->all());


        if ($validations->fails()) {
            return redirect()->back()
                        ->withErrors($validations)
                        ->withInput();
        }

		//dd($request);
		$schedule = new Schedule();
		$schedule->name = $request->name;
		$schedule->room_id = $request->room_id;
		$schedule->class_id = $request->class_id;
		$schedule->day = $request->day;
		$schedule->time = $request->time;
        $schedule->subject_id = $request->subject_id;
		$schedule->session_long = $request->session_long;
		$schedule->description = $request->description;
		$schedule->mentor_id = Auth::user()->id;
		$schedule->save();
		
		return redirect()->route('schedule');
	}
	
	public function present()
	{
		$presents = PPV::where('user_id',Auth::user()->id)->get();
		return view('present_list',compact('presents'))->with('side_subjects',$this->load_menu())->with('all_participants',$this->participants());
	}
	
	public function schedule_present(Request $request)
	{
		$presents = PPV::where('mentor_id',Auth::user()->id)->get();
		return view('schedule_present',compact('presents'))->with('side_subjects',$this->load_menu())->with('all_participants',$this->participants());
	}
		
}
