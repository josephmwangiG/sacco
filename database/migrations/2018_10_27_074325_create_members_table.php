<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateMembersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('members', function (Blueprint $table) {
            $table->id();
            $table->integer('user_id');
            $table->integer('branch_id');
            $table->integer('orgaization_id');
            $table->date('date_of_birth');
            $table->date('date_became_member');
            $table->string('nationality');
            $table->string('id_number')->unique();
            $table->string('passport_number')->unique()->nullable();
            $table->string('status_id')->nullable();
            $table->string('passport_photo')->nullable();
            $table->string('extra_images')->nullable();
            $table->string('membership_form')->nullable();
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
        Schema::dropIfExists('members');
    }
}
