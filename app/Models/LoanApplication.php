<?php

/**
 * Created by PhpStorm.
 * User: kevin
 * Date: 26/10/2018
 * Time: 12:26
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;





class LoanApplication extends Model
{

    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'loan_applications';

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
        'application_ref_number',
        'organization_id',
        'branch_id',
        'member_id',
        'loan_officer_id',

        'loan_type_id',
        'interest_type_id',
        'service_fee',

        'penalty_type_id',
        'penalty_value',
        'penalty_frequency_id',

        'reduce_principal_early',

        'amount_applied',
        'interest_rate',
        'repayment_period',
        'payment_frequency_id', // *** new monthly, weekly, annually, daily, etc
        'periodic_payment_amount',
        'application_date',

        'disburse_method_id',
        'disburse_note',
        "disbursement_date",

        //mpesa field
        'mpesa_number',
        'mpesa_first_name',
        'mpesa_middle_name',
        'mpesa_last_name',

        // bank fields
        'cheque_number',
        'bank_name',
        'bank_branch',
        'cheque_date',
        'account_number',

        'witness_type_id',
        'witness_first_name',
        'witness_last_name',
        'witness_country',
        'witness_county',
        'witness_city',
        'witness_national_id',
        'witness_phone',
        'witness_email',
        'witness_postal_address',
        'witness_residential_address',
        'status_id',
        'witnessed_by_user_id',
        'approver_1',
        'approver_2',
        'approver_3',
        'approver_4',
        'approver_1_status',
        'approver_2_status',
        'approver_3_status',
        'approver_4_status',

        'reviewed_by_user_id',
        'reviewed_on',
        'approved_on',
        'rejected_on',
        'rejection_notes',

        'attach_application_form',

        'created_by',
        'updated_by',
        'deleted_by'
    ];

    static function boot()
    {
        parent::boot();

        // Generate Loan Numbers
        static::creating(function ($model) {

            $latest = $model->latest()->first();

            if ($latest) {
                $string = preg_replace("/[^0-9\.]/", '', $latest->application_ref_number);
                $model->application_ref_number =  'AP' . sprintf('%04d', $string + 1);
            } else {
                $model->application_ref_number = 'AP0001';
            }
        });
    }

    /**
     * @param $application_date
     */
    public function setApplicationDateAttribute($application_date)
    {
        $this->attributes['application_date'] = date('Y-m-d H:i:s', strtotime($application_date));
    }

    /**
     * @param $cheque_date
     */
    public function setChequeDateAttribute($cheque_date)
    {
        $this->attributes['cheque_date'] = date('Y-m-d H:i:s', strtotime($cheque_date));
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
            'loan_applications.repayment_period' => 2,
            'loan_applications.amount_applied' => 1,
            'branches.name' => 5,
            'members.first_name' => 2,
            'members.middle_name' => 3,
            'members.last_name' => 4,
            'members.id_number' => 5,
            'loan_types.name' => 2,
        ],
        'joins' => [
            'branches' => ['loan_applications.branch_id', 'branches.id'],
            'members' => ['loan_applications.member_id', 'members.id'],
            'loan_types' => ['loan_applications.loan_type_id', 'loan_types.id'],
        ]
    ];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function loanApplicationStatus()
    {
        return $this->belongsTo(LoanApplicationStatus::class);
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function loanOfficer()
    {
        return $this->belongsTo(User::class, 'loan_officer_id');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function loanType()
    {
        return $this->belongsTo(LoanType::class, 'loan_type_id');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function paymentFrequency()
    {
        return $this->belongsTo(PaymentFrequency::class, 'payment_frequency_id');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function interestType()
    {
        return $this->belongsTo(InterestType::class, 'interest_type_id');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function disburseMethod()
    {
        return $this->belongsTo(PaymentMethod::class, 'disburse_method_id');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function witnessUser()
    {
        return $this->belongsTo(User::class);
    }
    public function approver1()
    {
        return $this->belongsTo(User::class, 'approver_1');
    }
    public function approver2()
    {
        return $this->belongsTo(User::class, 'approver_2');
    }
    public function approver3()
    {
        return $this->belongsTo(User::class, 'approver_3');
    }
    public function approver4()
    {
        return $this->belongsTo(User::class, 'approver_4');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function witnessType()
    {
        return $this->belongsTo(WitnessType::class, 'witness_type_id');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function reviewUser()
    {
        return $this->belongsTo(User::class, 'reviewed_by_user_id');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasOne
     */
    public function loan()
    {
        return $this->hasOne(Loan::class);
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function member()
    {
        return $this->belongsTo(Member::class);
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsToMany
     */
    public function guarantors()
    {
        return $this->hasMany(Guarantor::class, 'loan_application_id');
    }

    /**
     * Permission and role relation
     * @return \Illuminate\Database\Eloquent\Relations\BelongsToMany
     */
    public function collaterals()
    {
        return $this->hasMany(AssetLoanApplication::class, 'loan_application_id');
    }
}
