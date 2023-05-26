<?php

/**
 * Created by PhpStorm.
 * User: kevin
 * Date: 27/10/2018
 * Time: 11:17
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

use App\Traits\BranchScope;
use App\Traits\BranchFilterScope;
use Carbon\Carbon;
use Illuminate\Notifications\Notifiable;
use Illuminate\Support\Facades\Log;
use Nicolaslopezj\Searchable\SearchableTrait;
use Exception;

class Member extends Model
{

    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'members';

    /**
     * Main table primary key
     * @var string
     */
    protected $primaryKey = 'id';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'user_id',
        'branch_id',
        'organization_id',
        'date_of_birth',
        'date_became_member',
        'nationality',
        'id_number',
        'passport_number',
        'status_id',
        'passport_photo',
        'extra_images',
        'membership_form',
        'kra_pin',
        'employer_name',
        'residence',
        'income_bracket',
        'bank_name',
        'bank_branch',
        'bank_account_number',
        'next_of_kin',
        'next_of_kin_relationship',
        'next_of_kin_postal_address',
        'next_of_kin_phone_number',
        'next_of_kin_email',
        'created_by',
        'updated_by',
        'deleted_by'
    ];

    protected $casts = [
        'extra_images' => 'array'
    ];
    /**
     * @param $first_name
     */
    public function setFirstNameAttribute($first_name)
    {
        $this->attributes['first_name'] = ucwords($first_name);
    }

    /**
     * @param $middle_name
     */
    public function setMiddleNameAttribute($middle_name)
    {
        $this->attributes['middle_name'] = ucwords($middle_name);
    }

    /**
     * @param $last_name
     */
    public function setLastNameAttribute($last_name)
    {
        $this->attributes['last_name'] = ucwords($last_name);
    }

    /**
     * @param $date_of_birth
     */
    public function setDateOfBirthAttribute($date_of_birth)
    {
        $this->attributes['date_of_birth'] = date('Y-m-d H:i:s', strtotime($date_of_birth));
    }

    /**
     * @param $date_became_member
     */
    public function setDateBecameMemberAttribute($date_became_member)
    {
        $this->attributes['date_became_member'] = date('Y-m-d H:i:s', strtotime($date_became_member));
    }

    /**
     * Searchable rules.
     *
     * @var array
     */
    protected $searchable = [
        /**
         * Columns and their priority in search results.
         * Columns with higher values are more important.
         * Columns with equal values have equal importance.
         *
         * @var array
         */
        'columns' => [
            'members.first_name' => 1,
            'members.middle_name' => 1,
            'members.last_name' => 1,
            'members.date_of_birth' => 3,
            'members.date_became_member' => 3,
            'members.nationality' => 3,
            'members.county' => 3,
            'members.city' => 3,
            'members.id_number' => 1,
            'members.passport_number' => 3,
            'members.phone' => 1,
            'members.email' => 3,
            'members.postal_address' => 3,
            'members.residential_address' => 3,
            'accounts.account_number' => 1,
            'branches.name' => 1,
        ],
        'joins' => [
            'accounts' => ['members.id', 'accounts.account_name'],
            'branches' => ['members.branch_id', 'branches.id'],
        ]
    ];

    /**
     * Generate account numbers
     */


    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function branch()
    {
        return $this->belongsTo(Branch::class, 'branch_id');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasOne
     */
    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function account()
    {
        return $this->hasOne(Account::class, 'account_name');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasOne
     */
    public function borrower()
    {
        return $this->hasOne(Borrower::class);
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasOne
     */
    public function guarantor()
    {
        return $this->hasOne(Guarantor::class);
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function loanApplications()
    {
        return $this->hasMany(LoanApplication::class, 'member_id');
    }

    /**
     * Permission and role relation
     * @return \Illuminate\Database\Eloquent\Relations\BelongsToMany
     */
    public function guaranteedLoans()
    {
        return $this->belongsToMany(LoanApplication::class, 'guarantors', 'member_id', 'loan_application_id');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function loans()
    {
        return $this->hasMany(Loan::class, 'member_id');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function assets()
    {
        return $this->hasMany(Asset::class, 'member_id');
    }

    public function withdrawals()
    {
        return $this->hasMany(Withdrawal::class, 'member_id');
    }


    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function payments()
    {
        return $this->hasMany(Payment::class, 'member_id');
    }
}
