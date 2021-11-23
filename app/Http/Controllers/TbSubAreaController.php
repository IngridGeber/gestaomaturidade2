<?php

namespace App\Http\Controllers;

use App\Http\Requests\SubAreaReaquest;
use App\Models\tb_area;
use App\Models\tb_subarea;
use Illuminate\Http\Request;

class TbSubAreaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    private $area;
    private $subarea;

    public function __construct()
    {
        $this->middleware('admin');

        $this->area=new tb_area();
        $this->subarea=new tb_subarea();
    }

    public function index()
    {

        $subareas = $this->subarea->all()->sortByDesc('nome');
        return view('admin.subarea.index',compact('subareas'));


    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $areas = $this->area->all();
        $subareas = $this->subarea;
        return view('admin.subarea.formulario',compact('areas','subareas'));

    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(SubAreaReaquest $request)
    {

        if ($request->file('imagem')){
            $file = $request->file('imagem');
            $filename = $request->id_area_fk . "_" . date('dmYhms') . "." . $file->extension();
            $upload = $file->storeAs('imagens', $filename, 'public');
        }

        $this->subarea->nome = $request->nome;
        $this->subarea->id_area_fk = $request->id_area_fk;
        $this->subarea->imagem = $filename;


        try {

            if(!$upload){
               return back()->with('status-not','Falha ao salvar a imagem!');
            }else {

                $this->subarea->save();
               return redirect('subarea')->with('status', 'Sub Área cadastrada com sucesso!');
            }

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
        $subareas = $this->subarea->find($id);
        $areas = $this->area->find($subareas->id_area_fk);
        return view('admin.subarea.formulario', compact('areas','subareas'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(SubAreaReaquest $request, $id)
    {


        $subarea = $this->subarea->find($id);

        if ($request->file('imagem')){
            $file = $request->file('imagem');
            $filename = $request->id_area_fk . "_" . date('dmYhms') . "." . $file->extension();
            $upload = $file->storeAs('imagens', $filename, 'public');
            $subarea->imagem = $filename;
            if(!$upload) {
                return back()->with('status-not','Falha ao salvar a imagem!');
            }
        }

        $subarea->nome = $request->nome;
        //$this->subarea->id_area_fk = $request->id_area_fk;


        try {

               $subarea->save();
               return redirect('subarea')->with('status', 'Sub Área atualizada com sucesso!');

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
        $subarea = $this->subarea->find($id);
        try{
            $this->subarea->destroy($id);
            return redirect('subarea')->with('status', 'Sub Área ' .$subarea->nome. ' foi excluída!');
        }
        catch (\Exception $e){
            if($e->getCode() == 23000 ){
                return redirect('subarea')->with('status-not', 'Sub Área '.$subarea->nome.' não foi excluída! A mesma está sendo utilizada em outro cadastro!');
            }else{
                return redirect('subarea')->with('status-not', 'Sub Área '.$subarea->nome.' não foi excluída! A mesma está sendo utilizada em outro cadastro!'.$e->getMessage());
            }

        }
    }
}
