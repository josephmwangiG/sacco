<?php

namespace App\Models;


use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Lead extends Model
{
    use HasFactory;
    protected $primaryKey = 'id';

    protected $fillable = [
        'branch_id',
        'organization_id',
        'assigned_to',
        'first_name',
        'middle_name',
        'last_name',
        'date_of_birth',
        'nationality',
        'county',
        'city',
        'id_number',
        'passport_number',
        'phone',
        'email',
        'postal_address',
        'residential_address',
        'status_id',

        'passport_photo',
        'extra_images',

        'membership_form',

        'created_by',
        'updated_by',
        'deleted_by'
    ];

    public function assignedTo()
    {
        return $this->belongsTo(User::class, "assigned_to");
    }

    public function branch()
    {
        return $this->belongsTo(Branch::class, "branch_id");
    }
}
