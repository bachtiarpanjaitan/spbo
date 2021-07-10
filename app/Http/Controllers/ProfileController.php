<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use Auth;
use App\Models\Participant;
use App\Models\ParticipantClass as PC;
use App\Models\UserInformation as UI;
class ProfileController extends Controller
{
   	public function __construct()
    {
        $this->middleware('auth');
    }

    public function index(Request $request)
    {
    	$user = UI::where('id',Auth::user()->id)->first();
        $classes = PC::all();
		//dd($user);
    	return view('profile',compact('user','classes'));
    }

    public function save(Request $request)
    {
        if(isset($request->password)){
            if($request->password !== $request->upassword){
               return back()->withErrors(['error'=>'Password Tidak Sama']);;
            }
        }
        $id = Auth::user()->id;
        $user = User::find($id);
        // dd($user,$id);
        if(empty($user)) return redirect()->back();
        $user->name = $request->name;
        $user->email = $request->email;
        $user->password = bcrypt(trim($request->password));
        $user->nim = $request->nim;
        $user->save();

        $participant = Participant::where('user_id',$id)->first();
        if(isset($request->class_id))$participant->class_id = $request->class_id;
        $participant->zoom_firstname = $request->name;
        $participant->zoom_email = $request->email;
        $participant->save();

        $user = UI::where('id',$id)->first();
        $classes = PC::all();
        return view('profile',compact('user','classes'));
    }
}
