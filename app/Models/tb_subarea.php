<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class tb_subarea extends Model
{
    use HasFactory;

    public function  relArea(){
        return $this->hasOne('App\Models\tb_areas','id','id_area_fk');
    }
}
