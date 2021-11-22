<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTbSubareasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tb_subareas', function (Blueprint $table) {
            $table->increments('id');
            $table->string('nome', 50);
            $table->foreign('id_area_fk')->references('id')->on('tb_areas');
            $table->string('imagem',255);
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
        Schema::dropIfExists('tb_subareas');
    }
}
