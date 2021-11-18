
@extends('layouts.frontend.pagina')

@section('title', \App\Utils\ConstUtil::NOME_SISTEMA)

@section('content')



<div class="form-group col-sm-12 col-md-12 col-lg-12 text-center font-weight-bold" style="color: #16731C">
    <h4>DIAGNÓSTICO</h4>
</div>


<div class="form-group col-sm-12 col-md-12 col-lg-12 text-center" id="divArea">
    @include('layouts.frontend.cabecalho_unidade')
    <h5>{{strtoupper($area->nome)}}</h5>
    <img src="{{ asset('/img/'.$subareas->imagem)}}" width="40" height="40" >
    <h5>{{strtoupper($subareas->nome)}}</h5>
</div>


<div class="form-group col-sm-12 col-md-12 col-lg-12" >

    <!-- EXIBE O GRÁFICO DO NÍVEL -->
    <div class="form-group col-sm-12 col-md-12 col-lg-12" style="height: 350px">
        <canvas id="myChart"></canvas>
    </div>

    <?php
        $sql = "SELECT descricao, cast(".$diagnostico->nivel_maturidade." as decimal(10,2)) as nivel_maturidades,
                                (100.00 - cast(".$diagnostico->nivel_maturidade." as decimal(10,2))) as valor_melhorar FROM tb_nivel_maturidades WHERE ".$diagnostico->nivel_maturidade." BETWEEN intervalo_ini AND intervalo_fim";

        $descricao_nivel = DB::select($sql);

        foreach ($descricao_nivel as $desc){
            $desc_nivel = $desc->descricao;
        }

    ?>


    <script language="javascript" type="text/javascript">
        exibirGraficoPie(<?php print json_encode($descricao_nivel); ?>,true);
    </script>


    <div class="form-group col-sm-12 col-md-12 col-lg-12"><br></div>

    <!-- EXIBE A DESCRIÇÃO DO NÍVEL -->
    <div class="form-group col-sm-12 col-md-12 col-lg-12" id="divResultadoDescNivel">
        {{$desc_nivel}}
    </div>


    <div class="form-group col-sm-12 col-md-12 col-lg-12"><br></div>

    <!-- EXIBE OS PONTOS FORTES -->
    <div class="form-group pontos" id="divPontosFortes">
        <span style="font-weight:bold;text-align: center"> PONTOS FORTES<br></span>
        @php
            $fortes = \App\Models\tb_modelo_header::pontosFortes($diagnostico);
        @endphp
        <span class="text-justify">{{$fortes}}</span>
    </div>

    <div class="form-group col-sm-12 col-md-12 col-lg-12"><br></div>

    <!-- EXIBE OS PONTOS FRACOS -->
    <div class="form-group pontos" id="divPontosFracos">
        <span style="font-weight:bold;text-align: center"> PONTOS A MELHORAR<br></span>
    @php
        $fracos = \App\Models\tb_modelo_header::pontosFracos($diagnostico);
    @endphp
       <span class="text-justify">{{$fracos}}</span>
    </div>

</div>

<br>

<div class="form-group form-footer text-center" id="divHome">
    <div>
        <a class="btn btn-info btn-lg" style="background-color:#293259;border-color:#293259;"
           href="{{route('homeavaliador')}}">
            Home
        </a>
        <a class="btn btn-default btn-lg" href="{{route('showDiagnosticos',array($unidade->id,$permissao,$usuario))}}">
            Voltar
        </a>
    </div>
</div>

@endsection
