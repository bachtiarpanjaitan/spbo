<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\User;
class ParticipantClass extends Model
{
	public function users()
    {
        return $this->hasOne(User::class,'id');
    }
}
