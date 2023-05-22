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
        Schema::create('loan_statements', function (Blueprint $table) {
            $table->id();
            $table->integer('loan_id');
            $table->integer("member_id");
            $table->date("posting_date");
            $table->string("document_number");
            $table->string("description");
            $table->string("debit_amount");
            $table->string("credit_amount");
            $table->string("loan_balance");
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
        Schema::dropIfExists('loan_statements');
    }
};
