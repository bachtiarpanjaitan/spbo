<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class QuizAnswer extends Model
{
    public function question()
    {
        return $this->hasOne(QuizQuestion::class,'id','question_id');
    }

    public function user()
    {
        return $this->hasOne(\App\User::class,'id','user_id');
    }
}
