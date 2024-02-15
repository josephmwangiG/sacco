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
        Schema::create('share_types', function (Blueprint $table) {
            $table->id();
            $table->string("category");
            $table->string("has_recurrent_contribution");
            $table->string("contribution_period");
            $table->decimal("divinded_percentage",3,2);
            $table->string('can_be_withdrawn');
            $table->integer('min_amount')->nullable();
            $table->integer('max_amount')->nullable();
            $table->integer('can_be_transferred')->nullable();
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
        Schema::dropIfExists('share_types');
    }
};
