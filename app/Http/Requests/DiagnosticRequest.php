<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class DiagnosticRequest extends FormRequest
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
        return [
            //
            'diagnostic' => 'required',
        ];
    }

    public function messages()
    {
        return [
            'diagnostic.required' => 'Vui lòng nhập thông tin chuẩn đoán ban đầu.',
        ];
    }
}
