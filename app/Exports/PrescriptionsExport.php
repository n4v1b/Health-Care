<?php

namespace App\Exports;

use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;

class PrescriptionsExport implements FromCollection, WithHeadings
{

    private $prescriptions;
    public function __construct($prescriptions)
    {
        $this->prescriptions = $prescriptions;
    }


    /**
    * @return \Illuminate\Support\Collection
    */
    public function collection()
    {
        //
        $prescriptions = $this->prescriptions;
        $data = [];

        foreach ($prescriptions as $key => $item) {

            $status = 'Chưa mua';

            if ($item->status) {
                $status = 'Hoàn thành';
            }

            $data[] = [
                "stt" => $key + 1,
                "code" => $item->code,
                "patient_name" => $item->patient->name,
                "user_name" => isset($item->user) ? $item->user->name : '',
                "total_money" => number_format($item->total_money, 0, ',', '.'),
                "status" => $status,
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
            "Bác sĩ",
            "Tổng tiền (VNĐ)",
            "Trạng thái",
            "Ngày"
        ];
    }
}
