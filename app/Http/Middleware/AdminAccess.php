<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class AdminAccess
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {
        //checa se está autenticado e autorizado
        if(auth()->check() && auth()->user()->id_permissao_fk == 1 && auth()->user()->status == 'actived'){
            return $next($request);
        }

        dd("acesso negado, você não é administrador");
    }
}
