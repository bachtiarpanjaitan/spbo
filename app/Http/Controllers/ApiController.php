<?php

namespace App\Http\Controllers;
use App\User;
use Illuminate\Http\Request;
class ApiController extends Controller
{
    public function users(Request $request)
    {
	 	$q = $request->get('id');
    	return User::where('name', 'like', "%$q%")->paginate(null, ['id', 'name']);
    }
}
