<?php

namespace App\Http\Controllers;

use App\Models\tb_diagnostico_body;
use App\Models\tb_diagnostico_header;
use App\Models\tb_modelo_header;
use App\Models\tb_parametros;
use App\Models\tb_respostas;
use App\Models\tb_unidade;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Yajra\DataTables\DataTables;

class TbDiagnosticoController extends Controller {



    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
        //
    }

    public function showIndices($id_unidade)
    {

        $unidade = \App\Models\tb_unidade::findOrFail($id_unidade);

        $titulo_unidade = mb_strtoupper($unidade->nome, 'UTF-8');

        return view('diagnostico.formularioIndiceUnidade',compact('unidade','titulo_unidade'));

    }

    public function showIndicesSubAreas($id_unidade,$id_area)
    {


        $unidade = \App\Models\tb_unidade::findOrFail($id_unidade);
        $area = \App\Models\tb_area::findOrFail($id_area);
        $subareas = \App\Models\tb_unidadesarea::where('id_unidade_fk', $id_unidade)->where('id_area_fk', $id_area)->get(); //areas da unidade


        return view('diagnostico.formularioIndiceSubArea',compact('unidade','area','subareas'));

    }

    public function showDiagnosticos($id_unidade,$permissao,$usuario)
    {


        $unidade = tb_unidade::findOrFail($id_unidade);
        $usuario = \App\Models\User::findOrFail($usuario);

        if ($permissao=='unidade'){
            $sql="SELECT a.id,'".$unidade->nome."' as unidade, c.nome as area, d.nome as subarea, a.nivel_maturidade, DATE_FORMAT(a.created_at,'%d/%m/%Y') as data
                    FROM tb_diagnostico_headers a , tb_modelo_headers b, tb_areas c, tb_subareas d
                  WHERE a.id_unidade_fk=".$id_unidade."
                    AND b.id = a.id_modelo_header_fk
                    AND c.id = b.id_area_fk
                    AND d.id = b.id_subarea_fk
                 ORDER BY a.id desc,c.nome";

        }elseif ($permissao=='area'){
            $sql="SELECT a.id,'".$unidade->nome."' as unidade, c.nome as area, d.nome as subarea, a.nivel_maturidade, DATE_FORMAT(a.created_at,'%d/%m/%Y') as data
                    FROM tb_diagnostico_headers a , tb_modelo_headers b, tb_areas c, tb_subareas d
                  WHERE a.id_unidade_fk=".$id_unidade."
                    AND b.id = a.id_modelo_header_fk
                    AND b.id_area_fk = ".$usuario->id_area_fk."
                    AND c.id = b.id_area_fk
                    AND d.id = b.id_subarea_fk
                 ORDER BY a.id desc,c.nome";

        }elseif ($permissao=='subarea'){
            $sql="SELECT a.id,'".$unidade->nome."' as unidade, c.nome as area, d.nome as subarea, a.nivel_maturidade, DATE_FORMAT(a.created_at,'%d/%m/%Y')  as data
                    FROM tb_diagnostico_headers a , tb_modelo_headers b, tb_areas c, tb_subareas d
                  WHERE a.id_unidade_fk=".$id_unidade."
                    AND b.id = a.id_modelo_header_fk
                    AND b.id_area_fk = ".$usuario->id_area_fk."
                    AND c.id = b.id_area_fk
                    AND b.id_subarea_fk = ".$usuario->id_subarea_fk."
                    AND d.id = b.id_subarea_fk
                 ORDER BY a.id desc,c.nome";

        }


        $diagnosticos = DB::select($sql);

        return view('diagnostico.formularioDiagnosticos',compact('diagnosticos','permissao'));

    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function showDiagnosticoIndividual($id_diagnostico,$permissao)
    {

        $diagnostico = tb_diagnostico_header::findOrFail($id_diagnostico);
        $modelodiagnostico = tb_modelo_header::findOrFail($diagnostico->id_modelo_header_fk);

        $usuario = \App\Models\User::findOrFail(Auth()->user()->id);
        $unidade = \App\Models\tb_unidade::findOrFail($usuario->id_unidade_fk);
        $area = \App\Models\tb_area::findOrFail($modelodiagnostico->id_area_fk);
        $subareas = \App\Models\tb_subarea::findOrFail($modelodiagnostico->id_subarea_fk);
        $parametros = \App\Models\tb_parametros::parametrosUsado($modelodiagnostico->id_parametro_fk);


        return view('diagnostico.formularioDiagnosticoIndividual',compact('diagnostico','modelodiagnostico','permissao','usuario','unidade','area','subareas','parametros'));
    }

    public function resultDiagnostico()
    {


        $sql = "SELECT a.id as id_modelo,c.nome as area, d.nome as subarea, a.data, a.ativo
                    FROM tb_modelo_headers a, tb_areas c, tb_subareas d
                    WHERE d.id = a.id_subarea_fk
                      and c.id = d.id_area_fk
                    ORDER BY c.nome ";


        $modelos = DB::select($sql);

        return Datatables::of($modelos)->make(true);

    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return string
     */

    //exibir as perguntas da subarea
    public function exibirPerguntas(Request $request)
    {

        $usuario = \App\Models\User::findOrFail(Auth()->user()->id);
        $unidade = \App\Models\tb_unidade::findOrFail($usuario->id_unidade_fk);
        $subareas = \App\Models\tb_subarea::findOrFail($request->subareas);
        $area = \App\Models\tb_area::findOrFail($subareas->id_area_fk);
        $parametros = \App\Models\tb_parametros::parametrosAtuais();

        return view('diagnostico.formularioQuestionario', compact('usuario','unidade','area','parametros','subareas'));


    }


    //salva as respostas da unidade
    public function salvarRespostas(Request $request)
    {


        $diagnosticoheader = new tb_diagnostico_header();
        $diagnosticoheader->id_unidade_fk = $request->id_unidade_fk;
        $diagnosticoheader->id_modelo_header_fk = $request->id_modelo_header_fk;
        $diagnosticoheader->id_usuario_fk = $request->id_usuario_fk;

        $validator = Validator::make($request->all(), $diagnosticoheader->rules, $diagnosticoheader->messages);

        DB::beginTransaction();

        try {
            if ($validator->fails()) {
                return redirect()->action('DiagnosticoController@create')
                    ->withErrors($validator)
                    ->WithInput();
            }else{

                $diagnosticoheader->save();

                $total = 0;
                $respostas = $request->array_respostas;

                foreach ($request->array_perguntas as $key=>$value){        //salva as perguntas e respostas

                    $diagnosticobody = new tb_diagnostico_body();
                    $diagnosticobody->id_diagnostico_header_fk = $diagnosticoheader->id;
                    $diagnosticobody->id_pergunta_fk = $value;
                    $diagnosticobody->id_resposta_fk =  $respostas[$key];
                    $diagnosticobody->save();

                    //total pontos de acordo com as respostas
                    $pontos_respostas = tb_respostas::findOrFail($respostas[$key]);
                    $total = $total + $pontos_respostas->nota;

                }

                //atualiza o total de pontos alcançados para a subarea
                $diagnosticoheader2 = tb_diagnostico_header::findOrFail($diagnosticoheader->id);
                $diagnosticoheader2->total_pontos = $total;

                //recupera os parametros do modelo usado, para calcular o nível de maturidade
                $modelo_header = tb_modelo_header::findOrFail($request->id_modelo_header_fk);
                $parametros = tb_parametros::parametrosUsado($modelo_header->id_parametro_fk);
                $total_maximo_pontos = $parametros->qtd_perguntas * $parametros->maximo_pontos; //quantidade de perguntas * total maximo de cada pergunta

                $nivel_maturidade = ($total/$total_maximo_pontos)*100; //calcula o nivel de maturidade em porcentagem

                $diagnosticoheader2->nivel_maturidade = $nivel_maturidade;
                $diagnosticoheader2->update();

                $salvou_nivel = tb_diagnostico_header::salvarNiveis($request->id_unidade_fk,$request->id_modelo_header_fk,$request->id_area_fk,$parametros->id);

                if ($salvou_nivel){

                    DB::commit();

                    //recupera a descrição do nível de maturidade de acordo com o calculado anteriormente
                    $sql = "SELECT descricao, cast(".$nivel_maturidade." as decimal(10,2)) as nivel_maturidades,
                                (100.00 - cast(".$nivel_maturidade." as decimal(10,2))) as valor_melhorar ,
                                ".$modelo_header->id_parametro_fk." as id_parametro_fk FROM tb_nivel_maturidades WHERE ".$nivel_maturidade." BETWEEN intervalo_ini AND intervalo_fim";

                    $descricao_nivel = DB::select($sql);
                    return response()->json($descricao_nivel);

                }else{

                    $sql = "SELECT ".$salvou_nivel." as descricao, 0 as nivel_maturidade,
                                0 as valor_melhorar , 0 as id_parametro_fk FROM tb_nivel_maturidades WHERE 0 BETWEEN intervalo_ini AND intervalo_fim";

                    $descricao_nivel = DB::select($sql);
                    return response()->json($descricao_nivel);

                }

            }
        }

        catch (\Exception $e)
        {

            $sql = "SELECT ".$e."  as descricao, 0 as nivel_maturidade,
                                0 as valor_melhorar , 0 as id_parametro_fk FROM tb_nivel_maturidades WHERE 0 BETWEEN intervalo_ini AND intervalo_fim";

            return response()->json($sql); //fallha ao salvar
        }

    }

    //recupera os pontos fortes e fracos de acordo com as resposta no diagnostico
    public function consultarPontosFortesFracos(Request $request)
    {

        $montar_id_respostas = '';
        $montar_id_perguntas = '';

        foreach ($request->array_perguntas as $key=>$value){        //salva as perguntas e respostas

            if ($montar_id_perguntas == ''){
                $montar_id_perguntas = $value;
            }else{
                $montar_id_perguntas .= ','.$value;
            }
        }

        foreach ($request->array_respostas as $key=>$value){        //salva as perguntas e respostas

            if ($montar_id_respostas == ''){
                $montar_id_respostas = $value;
            }else{
                $montar_id_respostas .= ','.$value;
            }
        }

        $montar_id_perguntas = '('.$montar_id_perguntas.')';
        $montar_id_respostas = '('.$montar_id_respostas.')';

        //recupera a descrição do nível de maturidade de acordo com o calculado anteriormente
        $sql = "SELECT b.descricao as atividade, c.nota as nota_resposta,
                              ( select maximo_pontos
                                          from tb_parametros, tb_modelo_headers
                                         where tb_modelo_headers.id = a.id_modelo_header_fk
                                           and tb_parametros.id = tb_modelo_headers.id_parametro_fk) as ponto_maximo
                        FROM tb_modelo_bodies a, tb_atividades b, tb_respostas c
                        WHERE a.id_modelo_header_fk = " .$request->id_modelo_header_fk. "
                        AND   a.id_pergunta_fk in " .$montar_id_perguntas. "
                        AND   a.id_resposta_fk in " .$montar_id_respostas. "
                        AND   b.id = a.id_atividade_fk
                        AND   c.id = a.id_resposta_fk
                        ORDER BY c.nota DESC";

        $pontosfortefracos = DB::select($sql);

        return response()->json($pontosfortefracos);

    }


    //recupera o modelo de perguntas e respostas a ser usado para a sub área selecionada para o diagnostico
    public function resultModeloArea(Request $request)
    {

        $sql = "SELECT a.id as id_modelo_header, b.id as id_modelo_body, c.id as id_pergunta, c.descricao as pergunta,
                        d.id as id_resposta, d.descricao as resposta, e.id as id_atividade, e.descricao as atividade , d.nota, a.id_parametro_fk
                    FROM tb_modelo_headers a, tb_modelo_bodies b, tb_perguntas c, tb_respostas d, tb_atividades e
                    WHERE a.id_subarea_fk = ".$request->id_subarea_fk."
                      and a.ativo = 'Sim'
                      and b.id_modelo_header_fk = a.id
                      and c.id = b.id_pergunta_fk
                      and d.id = b.id_resposta_fk
                      and e.id = b.id_atividade_fk
                    ORDER BY c.descricao, d.nota";


       $modelos = DB::select($sql);

       return response()->json($modelos);

    }


}
