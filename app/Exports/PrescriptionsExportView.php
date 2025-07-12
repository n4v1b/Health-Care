<?php

namespace App\Exports;

use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Concerns\FromView;
use App\Models\Prescription;
use Carbon\Carbon;

class PrescriptionsExportView implements FromView
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

        $prescriptions = Prescription::select('*')->where(['status' => 1])->whereBetween('created_at', [$start_date, $end_date])->get();
        $total_money = $prescriptions->sum('total_money');

        return view('exports.prescription', compact('prescriptions', 'total_money', 'data'));
    }
}