<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateBorrowersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('borrowers', function (Blueprint $table) {
            $table->id();
            $table->integer('organization_id');
            $table->integer('branch_id');
            $table->integer('member_id');
            $table->string('credit_score')->nullable();
            $table->string('borrower_status_id')->nullable();
            $table->integer('witness_type_id');
            $table->string('witness_first_name')->nullable();
            $table->string('witness_last_name')->nullable();
            $table->string('witness_country')->nullable();
            $table->string('witness_city')->nullable();
            $table->string('witness_national_id')->nullable();
            $table->string('witness_phone')->nullable();
            $table->string('witness_email')->nullable();
            $table->string('witness_postal_address')->nullable();
            $table->string('witness_residential_address')->nullable();
            $table->string('notes')->nullable();
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
        Schema::dropIfExists('borrowers');
    }
}
