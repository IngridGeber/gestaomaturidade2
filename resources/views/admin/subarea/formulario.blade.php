@extends('layouts.backend.pagina')

@section('title')

@section('content')

    <br><br>


    @include('messages.alert')

    @if ($errors->any())
        <div class="alert alert-danger">
            <ul>
                @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
    @endif

    <h3 class="text-center">@if($subareas->exists) Editar @else Nova @endif Sub Área</h3>

    @if($subareas->exists)
        <form action="{{url("subarea/$subareas->id")}}" enctype="multipart/form-data" method="post">
            @method('PUT')
    @else
        <form action="{{url('subarea')}}" enctype="multipart/form-data" method="post">

    @endif

                        @csrf

                            <div class="form-group">
                                <label>Descrição<span class="obrigatorio">*</span></label>
                                <input name="nome" class="form-control" value="{{old('nome', $subareas->nome)}}" maxlength="50" tabindex="1" />
                            </div>

                            <div class="form-group">
                                <select class="form-control" name="id_area_fk" id="id_area_fk" tabindex="2">
                                    @if ($subareas->exists)
                                        <option value="{{$areas->id}}" selected >{{$areas->nome}}</option>
                                    @else
                                        <option value="" selected>-- Selecione --</option>
                                        @foreach($areas as $a)
                                            <option value="{{$a->id}}" >{{$a->nome}}</option>
                                        @endforeach
                                    @endif
                                </select><br>
                            </div>

                            <div class="form-group col-sm-6 col-md-4 col-lg-4" >
                                <label for="imagem">Imagem <span class="obrigatorio">*</span></label>
                                <input type="file" class="form-control" name="imagem" id="imagem" tabindex="3" accept="image/x-png">
                                @if($subareas->exists)
                                    <br>
                                    <img src="{{ asset("storage/imagens/$subareas->imagem")}}" style="height: 70px; width: 70px; ">
                                @endif
                            </div>

                            <div class="form-group form-footer">
                                <div>
                                    <button class="btn btn-primary" type="submit">Salvar</button>
                                    <a class="btn btn-default"
                                       href="{{url('subarea')}}">
                                        Cancelar
                                    </a>
                                </div>
                            </div>

                    </form>
        </form>



@endsection
