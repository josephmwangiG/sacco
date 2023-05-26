<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateLoanTypesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('loan_types', function (Blueprint $table) {
            $table->id();
            $table->integer('organization_id');
            $table->string('name');
            $table->string('description')->nullable();
            $table->string('active_status')->nullable();
            $table->string('interest_rate')->nullable();
            $table->string('interest_duration')->nullable();
            $table->integer('interest_type_id');
            $table->integer('payment_frequency_id');
            $table->string('repayment_period')->nullable();
            $table->string('service_fee')->default(0);
            $table->boolean('reduce_principal_early')->default(false);
            $table->integer('penalty_type_id')->nullable(); // Fixed Amount, Percentage on Due
            $table->double('penalty_value')->default(0);
            $table->integer('penalty_frequency_id')->nullable(); // Daily, monthly etc
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
        Schema::dropIfExists('loan_types');
    }
}
