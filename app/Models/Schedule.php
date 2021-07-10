<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\Room;
use App\User;
use App\Models\ParticipantClass;
class Schedule extends Model
{
	public function rooms()
    {
        return $this->hasOne(Room::class,'id','room_id');
    }

    public function participant_class()
    {
        return $this->hasOne(ParticipantClass::class,'id','class_id');
    }

    public function mentor()
    {
        return $this->hasOne(User::class,'id','mentor_id');
    }
}
