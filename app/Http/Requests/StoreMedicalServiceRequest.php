<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class StoreMedicalServiceRequest extends FormRequest
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
            'price' => 'required|numeric|min:0|max:10000000000',
            'name' => [
                'required', 'max:191',
                Rule::unique('medical_services')->ignore($this->medical_service),
            ],
            'service_rooms' => 'required|array',
        ];
    }

    public function messages()
    {
        return [
            'name.required' => 'Tên dịch vụ khám là trường bắt buộc.', 
            'name.max' => 'Tên dịch vụ khám không được dài quá :max ký tự.', 
            'name.unique' => 'Dịch vụ khám đã tồn tại.', 
            'price.required' => 'Giá dịch vụ khám là trường bắt buộc.', 
            'price.min' => 'Giá dịch vụ khám phải ít nhất là :min đồng.', 
            'price.max' => 'Giá dịch vụ khám lớn nhất là :min đồng.', 
            'service_rooms.required' => 'Vui lòng chọn phòng khám.',
            'service_rooms.array' => 'Vui lòng chọn phòng khám.',
        ];
    }
}
