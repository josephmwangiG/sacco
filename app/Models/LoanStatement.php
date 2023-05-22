<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LoanStatement extends Model
{
    use HasFactory;

    protected $fillable = [
        "loan_id",
        "member_id",
        "posting_date",
        "document_number",
        "description",
        "debit_amount",
        "credit_amount",
        "loan_balance",
    ];
}
