<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMpesaScheduledDisbursementsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('mpesa_scheduled_disbursements', function (Blueprint $table) {
            $table->id();
            $table->integer('organization_id');
            $table->integer('branch_id')->nullable();
            $table->integer('member_id')->nullable();
            $table->string('created_by')->nullable();
            $table->string('mpesa_number');
            $table->string('amount');
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
        Schema::dropIfExists('mpesa_scheduled_disbursements');
    }
}
