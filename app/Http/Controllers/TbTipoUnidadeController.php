<?php

namespace App\Http\Controllers;

use App\Http\Requests\TipoUnidadeRequest;
use App\Models\tb_tipounidade;
use Illuminate\Http\Request;

class TbTipoUnidadeController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    private $tipounidade;

    public function __construct()
    {
        $this->middleware('admin');

        $this->tipounidade=new tb_tipounidade();
    }


    public function index()
    {
        $tipounidades = $this->tipounidade->all()->sortByDesc('nome');
        return view('admin.tipounidade.index',compact('tipounidades'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $tipounidades = $this->tipounidade;
        return view('admin.tipounidade.formulario',compact('tipounidades'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function store(TipoUnidadeRequest $request)
    {

        $this->tipounidade->nome = $request->nome;
        if ($this->tipounidade->save()){
            return redirect('tipounidade')->with('status', 'Tipo de Unidade cadastrado com sucesso!');
        }

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $tipounidades = $this->tipounidade->find($id);
        return view('admin.tipounidade.formulario', compact('tipounidades'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(TipoUnidadeRequest $request, $id)
    {
        $tipounidade = $this->tipounidade->find($id);
        $tipounidade->nome = $request->nome;
        if ($tipounidade->update()){
            return redirect('tipounidade')->with('status', 'Tipo de Unidade alterado com sucesso!');
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {

        $tipounidade = $this->tipounidade->find($id);

        try{
            $this->tipounidade->destroy($id);
            return redirect('tipounidade')->with('status', 'Tipo de Unidade ' .$tipounidade->nome. ' foi excluído!');
        }
        catch (\Exception $e){
            if($e->getCode() == 23000 ){
                return redirect('tipounidade')->with('status-not', 'Tipo de Unidade '.$tipounidade->nome.' não foi excluída! A mesmo está sendo utilizado em outro cadastro!');
            }else{
                return redirect('tipounidade')->with('status-not', 'Tipo de Unidade '.$tipounidade->nome.' não foi excluída! A mesmo está sendo utilizado em outro cadastro!'.$e->getMessage());
            }

        }

    }


}
