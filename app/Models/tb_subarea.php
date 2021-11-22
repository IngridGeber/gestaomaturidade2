<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class tb_subarea extends Model
{
    use HasFactory;

    protected $fillable = [
        'nome','id_area_fk','imagem'
    ];

    public function  relArea(){
        return $this->hasOne('App\Models\tb_area','id','id_area_fk');
    }
}
