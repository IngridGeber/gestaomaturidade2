<?php

namespace App\Http\Controllers;

use App\Http\Requests\AreaRequest;
use Illuminate\Http\Request;
use App\Models\tb_area;
use Illuminate\Support\Facades\Validator;
use Yajra\DataTables\DataTables;
use Request as rq;

class TbAreaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    private $area;

    public function __construct()
    {
        $this->middleware('admin');

        $this->area=new tb_area();
    }


    public function index()
    {
        $areas = $this->area->all()->sortByDesc('nome');
        return view('admin.area.index',compact('areas'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $areas = $this->area;
        return view('admin.area.formulario',compact('areas'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function store(AreaRequest $request)
    {

        $this->area->nome = $request->nome;
        if ($this->area->save()){
            return redirect('area')->with('status', 'Área cadastrada com sucesso!');
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
        $areas = $this->area->find($id);
        return view('admin.area.formulario', compact('areas'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(AreaRequest $request, $id)
    {
        $area = $this->area->find($id);
        $area->nome = $request->nome;
        if ($area->update()){
            return redirect('area')->with('status', 'Área alterada com sucesso!');
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

        $area = $this->area->find($id);

        try{
            $this->area->destroy($id);
            return redirect('area')->with('status', 'Área ' .$area->nome. ' foi excluída!');
        }
        catch (\Exception $e){
            if($e->getCode() == 23000 ){
                return redirect('area')->with('status-not', 'Área '.$area->nome.' não foi excluída! A mesma está sendo utilizada em outro cadastro!');
            }else{
                return redirect('area')->with('status-not', 'Área '.$area->nome.' não foi excluída! A mesma está sendo utilizada em outro cadastro!'.$e->getMessage());
            }

        }

    }


}
