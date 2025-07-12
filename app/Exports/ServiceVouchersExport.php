<?php

namespace App\Exports;

use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;

class ServiceVouchersExport implements FromCollection,WithHeadings
{
    private $service_vouchers;
    public function __construct($service_vouchers)
    {
        $this->service_vouchers = $service_vouchers;
    }

    /**
    * @return \Illuminate\Support\Collection
    */
    public function collection()
    {
        //
        $service_vouchers = $this->service_vouchers;
        $data = [];

        foreach ($service_vouchers as $key => $item) {

            $status = 'Chưa khám xong';
            $payment_status = 'Chưa thanh toán';

            if ($item->status) {
                $status = 'Đã khám';
            }

            if ($item->payment_status) {
                $payment_status = 'Đã thanh toán';
            }

            $data[] = [
                "stt" => $key + 1,
                "code" => $item->code,
                "patient_name" => $item->patient->name,
                "medical_service" => isset($item->medicalService) ? $item->medicalService->name : '',
                "health_certification" => isset($item->healthCertification) ? $item->healthCertification->code : '',
                "user_name" => isset($item->user) ? $item->user->name : '',
                "start_date" => date("d-m-Y", strtotime($item->start_date)),
                "end_date" => date("d-m-Y", strtotime($item->end_date)),
                "total_money" => number_format($item->total_money, 0, ',', '.'),
                "status" => $status,
                "payment_status" => $payment_status,
                "created_at" => date("d-m-Y", strtotime($item->created_at)),
            ];
        }

        return collect($data);
    }

    public function headings(): array
    {
        return [
            "STT",
            "Mã",
            "Tên bệnh nhân",
            "Dịch vụ cận lâm sàng",
            "Mã giấy khám",
            "Chuyên viên",
            "Ngày đăng ký",
            "Thời gian khám thực tế",
            "Tổng tiền (VNĐ)",
            "Trạng thái",
            "Thanh toán",
            "Ngày tạo"
        ];
    }
}
