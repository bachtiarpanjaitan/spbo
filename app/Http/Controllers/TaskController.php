<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\ScheduleView as SV;
use App\Models\Task;
use Auth;
use App\Models\TaskView as TV;
use App\Models\Participant;
use App\Models\Topic;
use App\Models\ParticipantClass as PC;
class TaskController extends BaseController
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function save(Request $request)
    {
    	$schedule = SV::findOrFail($request->schedule_id);
    	if(empty($schedule)) return json_encode(['success'=>false,'message' => 'Jadwal tidak ada']);
    	if(empty($request->task)) return json_encode(['success'=>false,'message' => 'Tugas tidak boleh kosong']);
    	Task::where('schedule_id',$schedule->id)->delete();

    	$task = new Task();
    	$task->schedule_id = $schedule->id;
        $task->topic_id = $request->topic_id;
    	$task->name = 'Tugas '.$schedule->name;
    	$task->task = $request->task;
    	$task->created_by = Auth::user()->id;
		
    	if($task->save())
		{
			return redirect()->route('task');
		}else return redirect()->back();
    }

    public function list(Request $request)
    {
        $participant = Participant::where('user_id',Auth::user()->id)->first();
        if(empty($participant)) return redirect()->back();
        if($participant->is_mentor){
            $tasks = TV::where('created_by',$participant->user_id)->get();
        }else{
            // $tasks_a = TV::where('class_id',$participant->class_id)->get();
            $tasks = Task::whereHas('schedule',function($data)use($participant){
                return $data->where('class_id',$participant->class_id);
            })->get();
            // $tasks = $tasks_a->merge($tasks_b);
        }
		//dd($tasks[4]->topics);
        return view('task',compact('tasks','participant'))->with('side_subjects',$this->load_menu())->with('all_participants',$this->participants());
    }
	
	public function add()
	{
		$participant = Participant::where('user_id',Auth::user()->id)->first();
		if(empty($participant)) return redirect()->back();
		$schedules = SV::where('mentor_id',$participant->user_id)->get();
		return view('task_add',compact('schedules'))
		->with('side_schedules',$this->load_menu())
		->with('all_participants',$this->participants());
	}
}
