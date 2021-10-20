<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class tb_modelo_header extends Model
{
    use HasFactory;
    protected $table = "tb_modelo_headers";
    public $timestamps = true;



    public static function pontosFracos($diagnostico){

        $html='';
        $modelodiagnostico = tb_modelo_header::findOrFail($diagnostico->id_modelo_header_fk);
        $parametro = tb_parametros::parametrosUsado($modelodiagnostico->id_parametro_fk);

        $sql = "SELECT c.descricao as atividades
                  FROM tb_diagnostico_bodies a, tb_respostas b, tb_atividades c
                 WHERE a.id_diagnostico_header_fk =".$diagnostico->id."
                   AND b.id = a.id_resposta_fk
                   AND b.nota < ".$parametro->maximo_pontos."
                   AND c.id_resposta_fk = b.id";

        $resultado =  DB::select($sql);

        foreach ($resultado as $r){
            $html .= '* '.$r->atividades."<br>";
        }

        if ($html=='')
            echo '-';
        else
            echo $html;

    }

    public static function pontosFortes($diagnostico){

        $html='';
        $modelodiagnostico = tb_modelo_header::findOrFail($diagnostico->id_modelo_header_fk);
        $parametro = tb_parametros::parametrosUsado($modelodiagnostico->id_parametro_fk);

        $sql = "SELECT c.descricao as atividades
                  FROM tb_diagnostico_bodies a, tb_respostas b, tb_atividades c
                 WHERE a.id_diagnostico_header_fk =".$diagnostico->id."
                   AND b.id = a.id_resposta_fk
                   AND b.nota = ".$parametro->maximo_pontos."
                   AND c.id_resposta_fk = b.id";

        $resultado =  DB::select($sql);

        foreach ($resultado as $r){
            $html .= '* '.$r->atividades."<br>";
        }

        if ($html=='')
            echo '-';
        else
            echo $html;

    }

}


