@extends('layouts.backend.pagina')

@section('title')

@section('content')


    @include('messages.alert')


    <div style="margin-left: 12px">

        <div class="text-center">
             <a href="{{url('subarea/create')}}"
               class="btn btn-success btn-small">
                <b>Nova Sub Área</b></a>
         </div>

        <br><br>


        <table id="subareas" class="display" style="width:100%">
            <thead>
            <tr>
                <th>Id</th>
                <th>Sub Área</th>
                <th>Área</th>
                <th class="text-center" colspan="2">Operação</th>
            </tr>
            </thead>
            <tbody>
            @foreach($subareas as $sub)
                <tr>
                    <td>{{$sub->id}}</td>
                    <td>{{$sub->nome}}</td>
                    @php
                        $area = $sub->find($sub->id_area_fk)->relArea;
                    @endphp

                    <td>{{$area->nome}}</td>
                    <td width="20">
                        <a href="{{url("subarea/$sub->id/edit")}}">
                            <button class="btn btn-primary ">Editar</button>
                        </a>
                    </td>
                    <td width="20">
                        <a href="" >
                            <form action="{{url("subarea/$sub->id")}}" method="POST" >
                                @csrf
                                <input type="hidden" name="_method" value="DELETE">
                                <button class="btn btn-danger link-delete">Deletar</button>
                            </form>
                        </a>
                    </td>
                </tr>
            @endforeach
            </tbody>
        </table>

        <script type="text/javascript">
            $(document).ready(function() {
                $('#subareas').DataTable({
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
