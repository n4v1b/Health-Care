<?php

namespace App\Exports;

use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Concerns\FromView;
use App\Models\HealthCertification;
use Carbon\Carbon;

class HealthCertificationExportView implements FromView
{
    protected $data;

    public function __construct($data)
    {
        $this->data = $data;
    }

    public function view(): View
    {
        $data = $this->data;
        $start_date = Carbon::parse($data['start_date'])->startOfDay();
        $end_date = Carbon::parse($data['end_date'])->startOfDay();

        $health_certifications = HealthCertification::select('*')->where(['status' => 1, 'payment_status' =>  1])->whereBetween('end_date', [$start_date, $end_date])->get();
        $total_money = $health_certifications->sum('total_money');


        return view('exports.health_certification', compact('health_certifications', 'total_money', 'data'));
    }
}