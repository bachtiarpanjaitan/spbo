<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\QuizQuestion as QQ;

class Quiz extends Model
{
   	public function subject()
    {
        return $this->hasOne(Subject::class,'id','subject_id');
    }

    public function quiz_questions()
    {
        return $this->hasMany(QQ::class,'quiz_id','id');
    }

    protected static function boot()
    {
        parent::boot();

        static::deleting(function($t) {
            $t->quiz_questions()->delete();
        });
    }
}
