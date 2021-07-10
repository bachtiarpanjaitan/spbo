<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Auth;
use App\User;
use Eyeson;
use App\Models\Schedule;
use App\Models\Participant;
class HomeController extends BaseController
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        // dd($this->load_menu());
        return view('home')->with('side_subjects',$this->load_menu())->with('all_participants',$this->participants());
    }

    public function notparticipant()
    {
        return view('notparticipant');
    }

}
