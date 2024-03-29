<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LoanApprover extends Model
{
    use HasFactory;

    protected $fillable = [
        "loap_application_id",
        "user_id",
        "status",
        "description",
    ];
}
