<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class TaskView extends Model
{
    public function topics(){
		return $this->hasOne(Topic::class,'id','topic_id');
	}
}
