<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SubjectClass extends Model
{
    public $timestamps = false;

    public function subject()
    {
    	return $this->hasOne(Subject::class,'id','subject_id');
    }

    public function participant_class()
    {
    	return $this->hasOne(ParticipantClass::class,'id','class_id');
    }
}
