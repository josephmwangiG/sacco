<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('member_share_contributions', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('member_id');
            $table->unsignedBigInteger('paymentmethod_id');
            $table->decimal('amount', 10, 2);
            $table->date('date_of_payment');
            $table->string('description')->nullable();
            $table->unsignedBigInteger('sharetype_id');
            $table->timestamps();

            // Define foreign key constraints
            $table->foreign('member_id')->references('id')->on('members');
            $table->foreign('paymentmethod_id')->references('id')->on('payment_methods');
            $table->foreign('sharetype_id')->references('id')->on('share_types');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('member_share_contributions');
    }
};
