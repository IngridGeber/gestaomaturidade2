<button type="button" class="btn btn-danger btn-xs delete-btn{{$id}}" data-toggle="modal" data-target="#myModal{{ $id }}"
        title="Deletar" id="btnDeletar">
    <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
</button>

@php
    $title = empty($title) ? 'Excluir' : $title;
    $question = empty($question) ? 'Deseja excluir?' : $question;
@endphp

<!-- Modal -->
<div class="modal fade delete-modal{{ $id }}" id="myModal{{ $id }}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">{{ $title }}</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>{{ $question }}</p>
            </div>
            <div class="modal-footer">

                <form action="{{ url()->current().'/remove/'.$id }}" id="delete-form{{$id}}" method="post" class="hidden">
                    <input type="hidden" name="_token" value="{{ csrf_token() }}" />
                </form>
                <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
                <button type="submit" form="delete-form{{ $id }}" id="submit{{ $id }}" value="confirmar" class="btn btn-danger">Confirmar</button>
            </div>
        </div>
    </div>
</div>

</div>