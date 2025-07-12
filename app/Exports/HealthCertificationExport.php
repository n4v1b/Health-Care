<?php

namespace App\Exports;

use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;

class HealthCertificationExport implements FromCollection, WithHeadings
{
    private $healthCertification;
    public function __construct($healthCertification)
    {
        $this->healthCertification = $healthCertification;
    }

    /**
    * @return \Illuminate\Support\Collection
    */
    public function collection()
    {
        //
        $health_certifications = $this->healthCertification;
        $data = [];

        foreach ($health_certifications as $key => $item) {

            $status = 'Chưa khám';
            $payment_status = 'Chưa thanh toán';

            if ($item->status == 1) {
                $status = 'Đã khám';
            } else if ($item->status == 2) {
                $status = 'Đang khám';
            }

            if ($item->payment_status) {
                $payment_status = 'Đã thanh toán';
            }

            $data[] = [
                "stt" => $key + 1,
                "code" => $item->code,
                "patient_name" => $item->patient->name,
                "medical_service" => isset($item->medicalService) ? $item->medicalService->name : '',
                "consulting_room" => isset($item->consultingRoom) ? $item->consultingRoom->name : '',
                "user_name" => isset($item->user) ? $item->user->name : '',
                "created_at" => date("d-m-Y", strtotime($item->created_at)),
                "status" => $status,
                "payment_status" => $payment_status,
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
            "Dịch vụ",
            "Phòng khám",
            "Bác sĩ",
            "Ngày",
            "Trạng thái",
            "Thanh toán",
        ];
    }
}
