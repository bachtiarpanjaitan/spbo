<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\Theory;

class Topic extends Model
{
    public $timestamps = false;

     public function theories()
    {
        return $this->hasMany(Theory::class,'topic_id','id');
    }
}
