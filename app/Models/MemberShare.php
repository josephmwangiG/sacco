<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MemberShare extends Model
{
    protected $fillable = [
        'member_id',
        'sharetype_id',
        'amount',
        'duration',
    ];
     // Define the relationship with Sharetype
     public function sharetype()
     {
         return $this->belongsTo(Sharetype::class);
     }

     // Define the relationship with Member
     public function member()
     {
         return $this->belongsTo(Member::class);
     }
}
