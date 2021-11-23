<?php

namespace App\Http\Controllers;

use App\Models\tb_tipounidade;
use App\Models\tb_unidade;
use Illuminate\Http\Request;

class TbUnidadeController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    private $tipounidade;
    private $unidade;

    public function __construct()
    {
        $this->middleware('admin');

        $this->tipounidade=new tb_tipounidade();
        $this->unidade=new tb_unidade();
    }

    public function index()
    {

        $unidades = $this->unidade->all()->sortByDesc('nome');
        return view('admin.unidade.index',compact('unidades'));


    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $tipounidades = $this->tipounidade->all();
        $unidades = $this->unidade;
        return view('admin.unidade.formulario',compact('tipounidades','unidades'));

    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(UnidadeReaquest $request)
    {

        $this->unidade->nome = $request->nome;
        $this->unidade->id_tipounidade_fk = $request->id_tipounidade_fk;

        try {

                $this->unidade->save();
                return redirect('unidade')->with('status', 'Unidade cadastrada com sucesso!');

        }catch (\Exception $e){
            return back()->with('status-not',$e);

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
        $unidades = $this->unidade->find($id);
        $tipounidades = $this->tipounidade->find($unidades->id_tipounidade_fk);
        return view('admin.unidade.formulario', compact('tipounidades','unidades'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(UnidadeReaquest $request, $id)
    {


        $unidade = $this->unidade->find($id);


        $unidade->nome = $request->nome;
        $this->unidade->id_tipounidade_fk = $request->id_tipounidade_fk;


        try {

            $unidade->save();
            return redirect('unidade')->with('status', 'Unidade atualizada com sucesso!');

        }catch (\Exception $e){
            return back()->with('status-not',$e);
            //echo $e;

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
        $unidade = $this->unidade->find($id);
        try{
            $this->unidade->destroy($id);
            return redirect('unidade')->with('status', 'Unidade ' .$unidade->nome. ' foi excluída!');
        }
        catch (\Exception $e){
            if($e->getCode() == 23000 ){
                return redirect('unidade')->with('status-not', 'Unidade '.$unidade->nome.' não foi excluída! A mesma está sendo utilizada em outro cadastro!');
            }else{
                return redirect('unidade')->with('status-not', 'Unidade '.$unidade->nome.' não foi excluída! A mesma está sendo utilizada em outro cadastro!'.$e->getMessage());
            }

        }
    }
}
