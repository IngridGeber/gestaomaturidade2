@extends('layouts.backend.pagina')

@section('title')

@section('content')


    @include('messages.alert')


    <div style="margin-left: 12px">

        <div class="text-center">
             <a href="{{url('area/create')}}"
               class="btn btn-success btn-small">
                <b>Nova Área</b></a>
         </div>

        <br><br>


        <table id="areas" class="display" style="width:100%">
            <thead>
            <tr>
                <th>Id</th>
                <th>Área</th>
                <th class="text-center" colspan="2">Operação</th>
            </tr>
            </thead>
            <tbody>
            @foreach($areas as $a)
                <tr>
                    <td>{{$a->id}}</td>
                    <td>{{$a->nome}}</td>
                    <td colspan="2">
                       <td> <a href="{{url("area/$a->id/edit")}}">
                            <button class="btn btn-primary ">Editar</button>
                        </a></td>
                        <td>
                        <a href="" >
                            <form action="{{url("area/$a->id")}}" method="POST" >
                                @csrf
                                <input type="hidden" name="_method" value="DELETE">
                                <button class="btn btn-danger link-delete">Deletar</button>
                            </form>
                        </a>
                        </td>
                    </td>
                </tr>
            @endforeach
            </tbody>
        </table>

        <script type="text/javascript">
            $(document).ready(function() {
                $('#areas').DataTable({
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
