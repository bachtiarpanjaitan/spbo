<?php

namespace App\Http\Middleware;

use Closure;
use App\Models\Participant;
use App\User;
use Auth;
class ParticipantMiddleware
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
        $user = User::findOrFail(Auth::user()->id);
        $participant = Participant::where('user_id',$user->id)->first();
        if(!empty($participant))return $next($request);
        else return redirect()->route('notparticipant');
    }
}
