@extends('layouts.backend.pagina')

@section('title')

@section('content')


    @include('messages.alert')


    <div style="margin-left: 12px">

        <div class="text-center">
             <a href="{{url('unidade/create')}}"
               class="btn btn-success btn-small">
                <b>Nova Unidade</b></a>
         </div>

        <br><br>


        <table id="unidades" class="display" style="width:100%">
            <thead>
            <tr>
                <th>Id</th>
                <th>Unidade</th>
                <th>Tipo de Unidade</th>
                <th class="text-center" colspan="2">Operação</th>
            </tr>
            </thead>
            <tbody>
            @foreach($unidades as $u)
                <tr>
                    <td>{{$u->id}}</td>
                    <td>{{$u->nome}}</td>
                    @php
                        $tipounidade = $u->find($u->id_tipounidade_fk)->relTipoUnidade;
                    @endphp

                    <td>{{$u->id_tipounidade_fk}}</td>
                    <td width="20">
                        <a href="{{url("unidade/$u->id/edit")}}">
                            <button class="btn btn-primary "><i class="fas fa-edit"></i></button>
                        </a>
                    </td>
                    <td width="20">
                        <a href="" >
                            <form action="{{url("unidade/$u->id")}}" method="POST" >
                                @csrf
                                <input type="hidden" name="_method" value="DELETE">
                                <button class="btn btn-danger link-delete"><i class="fas fa-trash"></i></button>
                            </form>
                        </a>
                    </td>
                </tr>
            @endforeach
            </tbody>
        </table>

        <script type="text/javascript">
            $(document).ready(function() {
                $('#unidades').DataTable({
                    "language": {
                        "url": "https://cdn.datatables.net/plug-ins/1.10.12/i18n/Portuguese-Brasil.json"
                    },
                });
            } );

            $(".link-delete").click(function(event){
                if( confirm('Tem certeza que deseja deletar este registro?')){
                    $(event.target).parent().submit();
                }else{
                    return false;
                }

            });

        </script>

@endsection
