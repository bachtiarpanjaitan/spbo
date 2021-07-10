<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Task extends Model
{
    public function topics(){
		return $this->hasMany('App\Models\Topic');
	}

	public function schedule()
	{
		return $this->hasOne(Schedule::class,'id','schedule_id');
	}
}
