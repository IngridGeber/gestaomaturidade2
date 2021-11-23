<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class tb_unidade extends Model
{
    use HasFactory;

    protected $fillable = [
        'nome','id_tipounidade_fk'
    ];

    public function  relArea(){
        return $this->hasOne('App\Models\tb_tipounidade','id','id_tipounidade_fk');
    }
}
