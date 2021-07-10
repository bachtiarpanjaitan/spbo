<?php

namespace App\Http\Middleware;

use Closure;
use App\Models\ParticipantPresentView as PPV;
use App\Models\ScheduleView as SV;
use App\Models\Schedule;
use Auth;
class RoomMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {

        $p_present = PPV::where('user_id',Auth::user()->id)->where('present',1)->first();
        if(empty($p_present)) return $next($request);

        $schedule = SV::where('id',$p_present->schedule_id)->where('is_occupied',1)->first();
        if(empty($schedule)) return $next($request);

        return redirect()->route('room.active',$schedule->id);
       
    }
}
