<?php

namespace App\Exports;

use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Concerns\FromView;
use App\Models\ServiceVoucher;
use Carbon\Carbon;

class ServiceVoucherExportView implements FromView
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

        $service_vouchers = ServiceVoucher::select('*')->where(['status' => 1, 'payment_status' =>  1])->whereBetween('end_date', [$start_date, $end_date])->get();
        $total_money = $service_vouchers->sum('total_money');

        return view('exports.service_voucher', compact('service_vouchers', 'total_money', 'data'));
    }
}