<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Exports\HealthCertificationExportView;
use App\Exports\PrescriptionsExportView;
use App\Exports\ServiceVoucherExportView;
use App\Http\Requests\StatisticRequest;


class StatisticController extends Controller
{
    //
    public function statistic(Request $request)
    {
        return view('statistics.index');
    }

    public function exportData(StatisticRequest $request)
    {
        $data = $request->except('_token', 'report');

        ob_end_clean();
        try {
            if ($request->report == 'health') {
                $name = 'bao-cao-giay-kham-benh-';
                return \Excel::download(new HealthCertificationExportView($data), $name . \Carbon\Carbon::now() .'.xlsx');
            } elseif ($request->report == 'prescription') {
                $name = 'bao-cao-don-thuoc-';
                return \Excel::download(new PrescriptionsExportView($data), $name . \Carbon\Carbon::now() .'.xlsx');
            } else {
                $name = 'bao-cao-can-lam-san-';
                return \Excel::download(new ServiceVoucherExportView($data), $name . \Carbon\Carbon::now() .'.xlsx');
            }
        } catch (\Exception $exception) {
            return redirect()->back()->with('alert-error','Export data thất bại!');
        }

    }
}
