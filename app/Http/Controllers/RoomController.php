<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Auth;
use App\User;
use Eyeson;
use App\Models\Participant;
use App\Models\ScheduleView as SV;
use App\Models\Schedule;
use App\Models\Room;
use App\Models\Task;
use DB;
use App\Models\ParticipantPresent as PP;
use App\Models\ParticipantPresentView as PPV;
class RoomController extends Controller
{
 	public function __construct()
    {
        $this->middleware('auth');
    }

    public function active_room(Request $request)
    {
    	$schedule = SV::findOrFail($request->id);
    	if(empty($schedule)) return redirect()->back();
        $participant_class = Participant::where('class_id',$schedule->class_id)->get();
        $participant = Participant::where('user_id',Auth::user()->id)->first();
        if($participant->is_mentor){
            $room = Room::where('id',$schedule->room_id)->first();
            if(empty($room)) return redirect()->back();
            $room->is_occupied = 1;
            $room->occupied_by_id = Auth::user()->id;
            $room->occupied_start = now();
            $room->save();


            //Create Present
            if(!PP::where('schedule_id',$schedule->id)->exists())
            {
                $presents = [];
                foreach ($participant_class as $key => $p) {
                    $present = [
                    'schedule_id' => $schedule->id,
                    'participant_id' => $p->id
                    ];
                    array_push($presents,$present);
                }
                PP::insert($presents);
            }
        }else{
            $present = PP::where('schedule_id',$schedule->id)->where('participant_id',$participant->id)->first();
            if(!empty($present)){
                $present->datetime = now();
                $present->present = 1;
                $present->save();
            }
        }

        if(empty($participant)) return redirect()->back();
        if(empty($participant_class)) return redirect()->back();

        $task = Task::where('schedule_id',$schedule->id)->first();

        return view('room',compact('schedule','participant','participant_class','task'));
    }

    public function stop_room(Request $request)
    {
        $schedule = Schedule::findOrFail($request->id);
        if(empty($schedule)) return redirect()->back();

        $schedule->room_api_id = null;
        $schedule->room_url = null;
        $schedule->room_privacy = null;
        $schedule->save();

        $room = Room::where('id',$schedule->room_id)->first();
        if(empty($room)) return redirect()->back();
        $room->is_occupied = 0;
        $room->occupied_by_id = null;
        $room->occupied_start = null;
        // dd($room);
        $room->save();

        return json_encode(true);
    }
    
    public function leave(Request $request)
    {
        $ppv = PPV::where('schedule_id',$request->schedule_id)->where('user_id', Auth::user()->id)->first();
        if(empty($ppv)) return json_encode(['success' => false,'Tidak dapat meninggalkan ruangan']);
        $pp = PP::findOrFail($ppv->id);
        //$pp->present = 0;
        $pp->save();
        return json_encode(['success' => true]);
    }
}
