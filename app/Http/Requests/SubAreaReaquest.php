<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class SubAreaReaquest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {

        $image = request()->isMethod('put') ? 'nullable|mimes:png|max:300' : 'required|mimes:png|max:300';


        return [
            'nome' => 'required|max:50',
            'id_area_fk' => 'required',
            'imagem' => $image,
        ];
    }

    public function messages()
    {
        return [
            'nome.required' => 'O campo DESCRIÇÃO é obrigatório!',
            'nome.max' => 'O campo DESCRIÇÃO ultrapassou o limte de caracteres!',
            'id_area_fk.required' => 'O campo ÁREA é obrigatório!',
            'imagem.required' =>'O campo IMAGEM é obrigatório!',
            'imagem.mimes' => 'A imagem dever ser do tipo PNG com no máximo 300kb!'
        ];
    }
}
