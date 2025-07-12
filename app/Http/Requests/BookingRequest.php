<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class BookingRequest extends FormRequest
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
        $rules = [
            'doctor_id' => 'required',
            'date_booking' => 'required|after:yesterday',
            'medical_service_id' => 'required',
            'time_booking' => 'required',
        ];

        return $rules;
    }

    public function messages()
    {
        return [
            'doctor_id.required' => 'Dữ liệu không được phép để trống',
            'date_booking.required' => 'Dữ liệu không được phép để trống',
            'date_booking.after' => 'Ngày đặt lịch phải lớn hơn hoặc bằng ngày hiện tại',
            'medical_service_id.required' => 'Dữ liệu không được phép để trống',
            'time_booking.required' => 'Dữ liệu không được phép để trống',
        ];
    }
}
