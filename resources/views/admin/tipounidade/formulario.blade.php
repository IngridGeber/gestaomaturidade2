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

    <h3 class="text-center">@if($tipounidades->exists) Editar @else Novo @endif Tipo de Unidade</h3>

    @if($tipounidades->exists)
        <form action="{{url("tipounidade/$tipounidades->id")}}" method="post">
            @method('PUT')
    @else
        <form action="{{url('tipounidade')}}" method="post">

    @endif

                        @csrf

                            <div class="form-group">
                                <label>Descrição<span class="obrigatorio">*</span></label>
                                <input name="nome" class="form-control" value="{{old('nome', $tipounidades->nome)}}" maxlength="100"  />
                            </div>

                            <div class="form-group form-footer">
                                <div>
                                    <button class="btn btn-primary" type="submit">Salvar</button>
                                    <a class="btn btn-default"
                                       href="{{url('tipounidade')}}">
                                        Cancelar
                                    </a>
                                </div>
                            </div>

                    </form>
        </form>



@endsection
