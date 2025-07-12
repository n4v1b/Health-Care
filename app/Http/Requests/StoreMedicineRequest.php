<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreMedicineRequest extends FormRequest
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
            'name' => 'required|max:191|unique:medicines', 
            'price' => 'required|numeric|min:1|max:10000000000',
            'type_id' => 'required',
            'unit' => 'required|max:50',
        ];
    }

    public function messages()
    {
        return [
            'name.required' => 'Tên thuốc là trường bắt buộc.', 
            'name.max' => 'Tên thuốc không được dài quá :max ký tự.', 
            'name.unique' => 'Tên thuốc đã tồn tại.', 
            'price.required' => 'Giá là trường bắt buộc.',
            'price.min' => 'Giá là không được nhỏ hơn :min đồng.',
            'price.max' => 'Giá là không được lớn hơn :min đồng.',
            'type_id.required' => 'Loại thuốc là trường bắt buộc.',
            'unit.required' => 'Đơn vị tính là trường bắt buộc.',
            'unit.max' => 'Đơn vị tính không được dài quá :max ký tự.',
        ];
    }
}
