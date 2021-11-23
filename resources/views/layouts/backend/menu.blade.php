<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <div class="collapse navbar-collapse" id="navbarNavDropdown">
            <ul class="navbar-nav">
                <li class="nav-item col-lg-1">
                    <a class="nav-link active" aria-current="page" href="{{route('home')}}"><i class="fas fa-house-user fa-lg"></i> </a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <h7>Diagnóstico</h7>
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        <li><a class="dropdown-item" href="#">Perguntas</a></li>
                        <li><a class="dropdown-item" href="#">Respostas</a></li>
                        <li><a class="dropdown-item" href="#">Atividades</a></li>
                        <li><a class="dropdown-item" href="#">Modelos Diagnósticos</a></li>
                    </ul>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <h7>Cadastros</h7>
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        <li><a class="dropdown-item" href="{{url('area')}}">Áreas</a></li>
                        <li><a class="dropdown-item" href="{{url('subarea')}}">Sub Áreas</a></li>
                        <li><a class="dropdown-item" href="{{'tipounidade'}}">Tipo de Unidades</a></li>
                        <li><a class="dropdown-item" href="{{'unidade'}}">Unidades</a></li>
                    </ul>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <h7>Configuração</h7>
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        <li><a class="dropdown-item" href="#">Parâmetros</a></li>
                        <li><a class="dropdown-item" href="#">Níveis de Maturidades</a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <h7>Permissões</h7>
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        <li><a class="dropdown-item" href="#">Usuários</a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown col-lg-2"></li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <h7>{{ strtoupper(Auth::user()->name) }}</h7>
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        <li><a class="dropdown-item" href="#">Alterar Senha</a></li>
                        <li><a class="dropdown-item" href="{{ url('/logout') }}"
                               onclick="event.preventDefault();
                                       document.getElementById('logout-form').submit();">Sair
                            </a>
                        </li>
                        <form id="logout-form" action="{{ url('/logout') }}" method="POST" style="display: none;">
                            {{ csrf_field() }}
                        </form>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>

