@extends('layouts.backend.pagina')

@section('title', \App\Utils\ConstUtil::NOME_SISTEMA)


@section('content')

<div class="text-center">

    <br>
    <h3 class="text-center">Bem vind{{ Auth::user()->gender == 'female' ? 'a' : 'o' }}, <b>{{ strtoupper(current(explode(" ", Auth::user()->name))) }}</b></h3>

</div>

@endsection
