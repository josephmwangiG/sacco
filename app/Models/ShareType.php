<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ShareType extends Model
{
   protected $fillable = [
    'category',
    'has_recurrent_contribution',
    'contribution_period',
    'dividend_percentage',
    'can_be_withdrawn',
    'min_amount',
    'max_amount',
    'can_be_transferred',
   ];
   public function MemberShare(){
    return $this->hasMany(MemberShare::class);
   }
}
