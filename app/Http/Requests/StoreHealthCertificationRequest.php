<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Request;

class StoreHealthCertificationRequest extends FormRequest
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
    public function rules(Request $request)
    {
        $rules = [
//            'title' => 'required|max:191',
            'patient_id' => 'required', 
            'consulting_room_id' => 'required', 
            'medical_service_id' => 'required',
//            'user_id' => 'required',
            'start_date' => 'required|date',
            'end_date' => 'required|date|after_or_equal:start_date',
        ];

//        if (!$this->is_health_insurance_card) {
//            $rules['total_money'] = 'required|numeric|min:1|max:10000000000';
//        }
        
        return $rules;
    }

    public function messages()
    {
        return [
            'title.required' => 'Tiêu đề là trường bắt buộc.',
            'title.max' => 'Tiêu đề không được dài quá :max ký tự.',
            'patient_id.required' => 'Tên bệnh nhân là trường bắt buộc.', 
            'consulting_room_id.required' => 'Phòng khám là trường bắt buộc.', 
            'medical_service_id.required' => 'Dịch vụ khám là trường bắt buộc.',
            'user_id.required' => 'Bác sĩ là trường bắt buộc.',
            'total_money.required' => 'Giá là trường bắt buộc.',
            'total_money.min' => 'Giá nhỏ nhất là :min VNĐ.',
            'total_money.max' => 'Giá lớn nhất là :min VNĐ.',
            'start_date.required' => 'Ngày bắt đầu là trường bắt buộc.',
            'start_date.date' => 'Ngày bắt đầu không đúng định dạng.',
            'end_date.required' => 'Ngày kết thúc là trường bắt buộc.',
            'end_date.date' => 'Ngày kết thúc không đúng định dạng.',
            'end_date.after_or_equal' => 'Ngày kết thúc phải lớn hơn hoặc bằng ngày bắt đầu.',
        ];
    }
}
