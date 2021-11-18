<!DOCTYPE html>
<html lang="{{ app()->getLocale() }}">
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    {{--CSRF Token--}}
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title><?php echo e($__env->yieldContent('title')) ? e($__env->yieldContent('title')) : App\Utils\ConstUtil::NOME_SISTEMA?></title>

    <link rel="shortcut icon" type="image/x-icon" href="{{asset('img/favicon.ico')}}"/>

    @include('layouts.adicionacss')
    @include('layouts.adicionajs')


</head>

<body>

<div class="wrapper">
    <div class="col-sm-12 col-md-12 col-lg-12">
        @include('layouts.cabecalho')
    </div>

    <div class="col-sm-12 col-md-12 col-lg-12">
        @include('layouts.backend.menu')
    </div>

    <br>

    <div class="col-sm-12 col-md-12 col-lg-12">

         @yield('content')

    </div>

    <!--
    <div class="footer">
        @include('layouts.footer')
    </div>
    -->
</div>
</body>
</html>

