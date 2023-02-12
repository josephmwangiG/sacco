<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AssetLoanApplication extends Model
{
    use HasFactory;

    protected $fillable = [
        "loan_application_id",
        "member_id",
        "organization_id",
        "asset_id",
    ];


    public function asset()
    {
        return $this->belongsTo(Asset::class, "asset_id");
    }
}
