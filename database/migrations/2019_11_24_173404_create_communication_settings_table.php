<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCommunicationSettingsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('communication_settings', function (Blueprint $table) {
            $table->id();
            $table->integer('organization_id');
            $table->string('name', 36);
            $table->string('display_name', 36);
            $table->boolean('email_template')->default(false);
            $table->boolean('sms_template')->default(false);
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
        Schema::dropIfExists('communication_settings');
    }
}
