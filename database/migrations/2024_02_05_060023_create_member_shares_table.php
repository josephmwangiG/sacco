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
        Schema::create('member_shares', function (Blueprint $table) {
            $table->id();
            $table->integer('member_id');
            $table->integer('sharetype_id');
            $table->integer('amount');
            $table->date('duration');
            $table->timestamps();

            //   // Foreign key constraints
            //   $table->foreign('member_id')->references('id')->on('members');
            //   $table->foreign('sharetype_id')->references('id')->on('sharetypes');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('member_shares');
    }
};
