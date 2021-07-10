<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Participant extends Model
{
	 public function participant_class()
    {
        return $this->hasOne(ParticipantClass::class,'id','class_id');
    }
}
