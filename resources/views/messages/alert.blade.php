<script>
    window.setTimeout(function() {
        $(".alert").fadeTo(400, 0).slideUp(400, function(){
            $(this).remove();
        });
    }, 4000);
</script>

	<div>
        @if(session('status'))
                    <div class="alert alert-warning" role="alert">
                        <strong> Sucesso!  </strong> {{ session('status')  }}
                    </div>
        @elseif(session('status-not'))
                    <div class="alert alert-danger" role="alert">
                        <strong> Erro!</strong> {{ session('status-not') }}
                    </div>

        @endif
    </div>
