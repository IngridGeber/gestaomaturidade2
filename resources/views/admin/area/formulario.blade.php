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

    <h3 class="text-center">@if($areas->exists) Editar @else Nova @endif Área</h3>

    @if($areas->exists)
        <form action="{{url("area/$areas->id")}}" method="post">
            @method('PUT')
    @else
        <form action="{{url('area')}}" method="post">

    @endif

                        @csrf

                            <div class="form-group">
                                <label>Descrição<span class="obrigatorio">*</span></label>
                                <input name="nome" class="form-control" value="{{old('nome', $areas->nome)}}" maxlength="100"  />
                            </div>

                            <div class="form-group form-footer">
                                <div>
                                    <button class="btn btn-primary" type="submit">Salvar</button>
                                    <a class="btn btn-default"
                                       href="{{url('area')}}">
                                        Cancelar
                                    </a>
                                </div>
                            </div>

                    </form>
        </form>



@endsection
