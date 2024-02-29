<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MemberShareContribution extends Model
{
    use HasFactory;

    protected $fillable = [
        'member_id',
        'paymentmethod_id',
        'amount',
        'date_of_payment',
        'description',
        'sharetype_id',
    ];

    // Define relationships
    public function member()
    {
        return $this->belongsTo(Member::class);
    }

    public function paymentMethod()
    {
        return $this->belongsTo(PaymentMethod::class,"paymentmethod_id");
    }

    public function shareType()
    {
        return $this->belongsTo(ShareType::class,"sharetype_id");
    }
}
