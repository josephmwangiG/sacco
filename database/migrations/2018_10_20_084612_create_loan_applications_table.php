<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateLoanApplicationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('loan_applications', function (Blueprint $table) {
            $table->id();
            $table->integer('organization_id');
            $table->integer('branch_id');
            $table->integer('member_id');
            $table->integer('loan_officer_id');
            $table->integer('loan_type_id');
            $table->integer('interest_type_id')->nullable();
            $table->string('interest_rate')->nullable();
            $table->double('service_fee')->default(0);
            $table->integer('penalty_type_id')->nullable();
            $table->double('penalty_value')->default(0);
            $table->integer('penalty_frequency_id')->nullable();
            $table->boolean('reduce_principal_early')->default(false);
            $table->string('amount_applied');
            $table->string('repayment_period')->nullable();
            $table->integer('payment_frequency_id')->nullable();
            $table->string('periodic_payment_amount')->nullable(); //**
            $table->date('application_date');
            $table->integer('witness_type_id')->nullable();
            $table->string('witness_first_name')->nullable();
            $table->string('witness_last_name')->nullable();
            $table->string('witness_country')->nullable();
            $table->string('witness_county')->nullable();
            $table->string('witness_city')->nullable();
            $table->string('witness_national_id')->nullable();
            $table->string('witness_phone')->nullable();
            $table->string('witness_email')->nullable();
            $table->string('witness_postal_address')->nullable();
            $table->string('witness_residential_address')->nullable();
            $table->integer('disburse_method_id');
            //mpesa fields
            $table->string('mpesa_number')->nullable();
            $table->string('mpesa_first_name')->nullable();
            $table->string('mpesa_middle_name')->nullable();
            $table->string('mpesa_last_name')->nullable();
            //bank fields
            $table->string('cheque_number')->nullable();
            $table->string('bank_name')->nullable();
            $table->string('bank_branch')->nullable();
            $table->string('account_number')->nullable();
            $table->date('cheque_date')->nullable();
            $table->date('disbursement_date')->nullable();
            $table->string('disburse_note')->nullable();
            $table->integer('status_id')->nullable();
            $table->integer('witnessed_by_user_id')->nullable();
            $table->integer('reviewed_by_user_id')->nullable();
            $table->string('reviewed_on')->nullable();
            $table->string('approved_on')->nullable();
            $table->string('rejected_on')->nullable();
            $table->string('rejection_notes')->nullable();
            $table->string('attach_application_form')->nullable();
            $table->string('created_by', 36)->nullable();
            $table->string('updated_by', 36)->nullable();
            $table->string('deleted_by', 36)->nullable();
            $table->softDeletes();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('loan_applications');
    }
}
