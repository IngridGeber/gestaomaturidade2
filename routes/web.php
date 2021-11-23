<?php

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('auth.login');
});

Route::get('logout', [App\Http\Controllers\Auth\LoginController::class,'logout']);

Auth::routes();


//ROTAS PARA O ADMIN
Route::middleware(['admin','verified'])->group(function () {
    Route::get('admin/login', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
    Route::get('dashboard', [App\Http\Controllers\HomeController::class, 'dashboard'])->name('dashboard');
    Route::resource('area', App\Http\Controllers\TbAreaController::class);
    Route::resource('subarea', App\Http\Controllers\TbSubAreaController::class);
    Route::resource('tipounidade', App\Http\Controllers\TbTipoUnidadeController::class);
    Route::resource('unidade', App\Http\Controllers\TbUnidadeController::class);

});

//ROTAS PARA O AVALIADOR
Route::middleware(['avaliador','verified'])->group(function () {
    Route::get('avaliador', [App\Http\Controllers\HomeController::class, 'indexAvaliador'])->name('homeavaliador');
    Route::post('/diagnostico/exibirPerguntas', [App\Http\Controllers\TbDiagnosticoController::class, 'exibirPerguntas'])->name('exibirPerguntas');
    Route::get('/diagnostico/showIndices/{id_unidade}', [App\Http\Controllers\TbDiagnosticoController::class, 'showIndices'])->name('showIndices');
    Route::get('/diagnostico/showIndicesSubAreas/{id_unidade}/{id_area}', [App\Http\Controllers\TbDiagnosticoController::class, 'showIndicesSubAreas'])->name('showIndicesSubAreas');
    Route::get('/diagnostico/showDiagnosticos/{id_unidade}/{permissao}/{usuario}', [App\Http\Controllers\TbDiagnosticoController::class, 'showDiagnosticos'])->name('showDiagnosticos');
    Route::get('/diagnostico/showDiagnosticoIndividual/{id_diagnostico_header_fk}/{permissao}', [App\Http\Controllers\TbDiagnosticoController::class, 'showDiagnosticoIndividual'])->name('showDiagnosticoIndividual');
    Route::post('/diagnostico/exibirPerguntas', [App\Http\Controllers\TbDiagnosticoController::class, 'exibirPerguntas'])->name('exibirPerguntas');
    Route::post('/diagnostico/atualizarIndices', [App\Http\Controllers\TbDiagnosticoController::class,'atualizarIndices'])->name('atualizarIndices');
    Route::post('/diagnostico/salvarRespostas', [App\Http\Controllers\TbDiagnosticoController::class,'salvarRespostas']);
    Route::post('/diagnostico/consultarPontosFortesFracos', [App\Http\Controllers\TbDiagnosticoController::class,'consultarPontosFortesFracos'])->name('consultarPontosFortesFracos');
    Route::post('/diagnostico/resultModeloArea',[App\Http\Controllers\TbDiagnosticoController::class,'resultModeloArea'])->name('resultModeloArea');

});



