<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\HealthCertification;
use App\Models\ServiceVoucher;
use App\Models\Prescription;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use App\Models\Schedule;

class DashboardController extends Controller
{
    public function index(Request $request)
    {
        $admin = Auth::user();
    	$health_certification = HealthCertification::whereDay('created_at', date('d'))->whereMonth('created_at', date('m'))->whereYear('created_at', date('Y'));
        $service_voucher = ServiceVoucher::whereDay('created_at', date('d'))->whereMonth('created_at', date('m'))->whereYear('created_at', date('Y'));
        $prescription = Prescription::whereDay('created_at', date('d'))->whereMonth('created_at', date('m'))->whereYear('created_at', date('Y'));

        if (!$admin->hasRole(['Admin'])) {

            $health_certification->where('user_id', $admin->id);
            $service_voucher->where('user_id', $admin->id);
            $prescription->where('user_id', $admin->id);
        }

        $health_certification = $health_certification->count();
        $service_voucher = $service_voucher->count();
        $prescription = $prescription->count();

        $currentDay = date('Y-m-d');
        $schedule = Schedule::with('times')->where(['doctor_id' => $admin->id, 'date_schedule' => $currentDay])->first();

    	if ($request->start_day) {
            $start_day = Carbon::parse($request->start_day)->startOfDay();
        } else {
            $start_day = Carbon::now()->startOfDay();
        }

        if ($request->end_day) {
            $end_day = Carbon::parse($request->end_day)->endOfDay();
        } else {
            $end_day =  Carbon::now()->endOfDay();
        }

        if ($request->select_month) {
            $select_month = $request->select_month;
        } else {
            $select_month = date('m');
        }

        if ($request->select_year) {
            $select_year = $request->select_year;
        } else {
            $select_year = date('Y');
        }
        // TODO doanh thu giấy khám bệnh theo khoảng thời gian

        $statistical_health_day = HealthCertification::where('payment_status', 1)->whereBetween('created_at', [$start_day, $end_day])->sum("total_money");
        $statistical_health_month = HealthCertification::where('payment_status', 1)->whereMonth('created_at', $select_month)->whereYear('created_at', $select_year)->sum("total_money");
        $statistical_health_year = HealthCertification::where('payment_status', 1)->whereYear('created_at', $select_year)->sum("total_money");

        // TODO doanh thu đơn thuốc

        $statistical_prescription_day = Prescription::where('status', 1)->whereBetween('created_at', [$start_day, $end_day])->sum("total_money");
        $statistical_prescription_month = Prescription::where('status', 1)->whereMonth('created_at', $select_month)->whereYear('created_at', $select_year)->sum("total_money");
        $statistical_prescription_year = Prescription::where('status', 1)->whereYear('created_at', $select_year)->sum("total_money");

        // TODO doanh thu phiếu cận lâm sàn

        $statistical_voucher_day = ServiceVoucher::where('payment_status', 1)->whereBetween('created_at', [$start_day, $end_day])->sum("total_money");
        $statistical_voucher_month = ServiceVoucher::where('payment_status', 1)->whereMonth('created_at', $select_month)->whereYear('created_at', $select_year)->sum("total_money");
        $statistical_voucher_year = ServiceVoucher::where('payment_status', 1)->whereYear('created_at', $select_year)->sum("total_money");

    	$data = [
    		'health_certification' => $health_certification,
    		'schedule' => $schedule,
    		'currentDay' => $currentDay,
    		'service_voucher' => $service_voucher,
    		'prescription' => $prescription,
            'statistical_health_day' => $statistical_health_day,
            'statistical_health_month' => $statistical_health_month,
            'statistical_health_year' => $statistical_health_year,
            'statistical_prescription_day' => $statistical_prescription_day,
            'statistical_prescription_month' => $statistical_prescription_month,
            'statistical_prescription_year' => $statistical_prescription_year,
            'statistical_voucher_day' => $statistical_voucher_day,
            'statistical_voucher_month' => $statistical_voucher_month,
            'statistical_voucher_year' => $statistical_voucher_year,
    	];

    	return view('dashboard', $data);
    }
}
