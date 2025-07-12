<?php

namespace App\Http\Controllers;

use App\Models\HealthCertification;
use App\Models\Patient;
use App\Models\ConsultingRoom;
use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Requests\StoreHealthCertificationRequest;
use App\Http\Requests\UpdateHealthCertificationRequest;
use App\Http\Requests\DiagnosticRequest;
use DB;
use Illuminate\Database\Eloquent\Builder;
use App\Models\MedicalService;
use App\Exports\HealthCertificationExport;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;

class HealthCertificationController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $admin = Auth::user();

        $health_certifications = HealthCertification::select('*');

        if (!$admin->hasRole(['Admin']) && !$admin->hasRole(['Bệnh nhân'])) {
            $health_certifications->where('user_id', $admin->id);
        } else if ($admin->hasRole(['Bệnh nhân'])) {
            $health_certifications->where('patient_id', $admin->patient->id);
        }


        if ($request->search) {
            $health_certifications->whereHas('patient', function (Builder $query) use ($request) {
                $query->where('name', 'like', '%'.$request->search.'%');
            });
        }

        if ($request->start_date) {
            $start_date = Carbon::parse($request->start_date)->startOfDay();
            $health_certifications->where('created_at', '>=', $start_date);
        }

        if ($request->end_date) {
            $end_date = Carbon::parse($request->end_date)->startOfDay();
            $health_certifications->where('created_at', '<=', $end_date);
        }
        if ($request->submit == 'export') {
            $name = 'giay-kham-benh-';
            return \Excel::download(new HealthCertificationExport($health_certifications->get()), $name . Carbon::now() .'.xlsx');
        }

        $health_certifications = $health_certifications->orderByDesc('id')->paginate(10);
        $data = [
            'health_certifications' => $health_certifications
        ];

        return view('health-certification.index', $data);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $patients = Patient::all();
        $consulting_rooms = ConsultingRoom::all();
        $users = User::whereIn('id', function ($query) {
            $query->select('model_id')->from('model_has_roles')->whereIn('role_id', [2, 3, 9]);
        })->get();
        $admin = Auth::user();
        $medical_services = MedicalService::where('type', 1)->get();

        $data = [
            'patients' => $patients,
            'admin' => $admin,
            'consulting_rooms' => $consulting_rooms,
            'users' => $users,
            'medical_services' => $medical_services,
        ];

        return view('health-certification.create', $data);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreHealthCertificationRequest $request)
    {
        $is_health_insurance_card = $request->is_health_insurance_card ? 1 : 0;

        $health_certifications = HealthCertification::whereBetween('created_at', [date('Y-m-d 00:00:00'), date('Y-m-d 23:59:59')])->get();
        if ($health_certifications->count() == 0) {
            $number = 1;
        }
        else {
            $number = $health_certifications->last()->number + 1;
        }

        $medicalService = MedicalService::find($request->medical_service_id);

        $total_money = 0;
        if ($medicalService) {
            $total_money = !$request->is_health_insurance_card ? $medicalService->price : healthInsuranceCard($medicalService->price);
        }

        try {
            DB::beginTransaction();

            $create = HealthCertification::create([
                'code' => '',
                'title' => $request->title,
                'patient_id' => $request->patient_id,
                'consulting_room_id' => $request->consulting_room_id,
                'medical_service_id' => $request->medical_service_id,
                'user_id' => $request->user_id,
                'status' => 0,
                'number' => $number,
                'total_money' => $total_money,
                'is_health_insurance_card' => $is_health_insurance_card,
                'start_date' => date("Y-m-d", strtotime($request->start_date)),
                'end_date' => date("Y-m-d", strtotime($request->end_date)),
            ]);

            $create->update([
                'code' => 'GKB'.str_pad($create->id, 6, '0', STR_PAD_LEFT)
            ]);
            
            DB::commit();
            return redirect()->route('health_certifications.index')->with('alert-success','Thêm giấy khám bệnh thành công!');
        } catch (Exception $e) {
            DB::rollback();
            return redirect()->back()->with('alert-error','Thêm giấy khám bệnh thất bại!');
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\HealthCertification  $healthCertification
     * @return \Illuminate\Http\Response
     */
    public function show(HealthCertification $healthCertification)
    {
        $patients = Patient::all();
        $consulting_rooms = ConsultingRoom::all();
        $users = User::whereIn('id', function ($query) {
            $query->select('model_id')->from('model_has_roles')->whereIn('role_id', [2, 3, 9]);
        })->get();

        $data = [
            'patients' => $patients,
            'consulting_rooms' => $consulting_rooms,
            'users' => $users,
            'data_edit' => $healthCertification,
        ];

        return view('health-certification.show', $data);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\HealthCertification  $healthCertification
     * @return \Illuminate\Http\Response
     */
    public function edit(HealthCertification $healthCertification)
    {
        $patients = Patient::all();
        $consulting_rooms = ConsultingRoom::all();
        $users = User::whereIn('id', function ($query) {
            $query->select('model_id')->from('model_has_roles')->whereIn('role_id', [2, 3, 9]);
        })->get();
        $admin = Auth::user();
        $medical_services = MedicalService::where('type', 1)->get();

        $data = [
            'patients' => $patients,
            'admin' => $admin,
            'consulting_rooms' => $consulting_rooms,
            'users' => $users,
            'data_edit' => $healthCertification,
            'medical_services' => $medical_services,
        ];

        return view('health-certification.edit', $data);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\HealthCertification  $healthCertification
     * @return \Illuminate\Http\Response
     */
    public function update(StoreHealthCertificationRequest $request, HealthCertification $healthCertification)
    {

        $medicalService = MedicalService::find($request->medical_service_id);

        $total_money = 0;
        if ($medicalService) {
            $total_money = !$request->is_health_insurance_card ? $medicalService->price : healthInsuranceCard($medicalService->price);
        }

        try {
            DB::beginTransaction();
            
            $healthCertification->update([
                'title' => $request->title,
                'patient_id' => $request->patient_id,
                'consulting_room_id' => $request->consulting_room_id,
                'medical_service_id' => $request->medical_service_id,
                'user_id' => $request->user_id,
                'total_money' => $total_money,
                'start_date' => date("Y-m-d", strtotime($request->start_date)),
                'end_date' => date("Y-m-d", strtotime($request->end_date)),
            ]);
            
            DB::commit();
            return redirect()->route('health_certifications.index')->with('alert-success','Cập nhật giấy khám bệnh thành công!');
        } catch (Exception $e) {
            DB::rollback();
            return redirect()->back()->with('alert-error','Cập nhật giấy khám bệnh thất bại!');
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\HealthCertification  $healthCertification
     * @return \Illuminate\Http\Response
     */
    public function destroy(HealthCertification $healthCertification)
    {
        try {
            DB::beginTransaction();

            HealthCertification::destroy($healthCertification->id);
            
            DB::commit();
            return redirect()->route('health_certifications.index')->with('alert-success','Xóa giấy khám bệnh thành công!');
        } catch (Exception $e) {
            DB::rollback();
            return redirect()->back()->with('alert-error','Xóa giấy khám bệnh thất bại!');
        }
    }

    public function viewConclude(HealthCertification $healthCertification)
    {
        $data = [
            'data_edit' => $healthCertification,
        ];

        return view('health-certification.conclude', $data);
    }

    public function conclude(UpdateHealthCertificationRequest $request, HealthCertification $healthCertification)
    {
        try {
            DB::beginTransaction();
            
            $healthCertification->update([
                'status' => 1,
                'conclude' => $request->conclude,
                'treatment_guide' => $request->treatment_guide,
                'suggestion' => $request->suggestion,
                're_examination_date' => date("Y-m-d", strtotime($request->re_examination_date)),
            ]);
            
            DB::commit();
            return redirect()->route('health_certifications.index')->with('alert-success','Kết luận giấy khám bệnh thành công!');
        } catch (Exception $e) {
            DB::rollback();
            return redirect()->back()->with('alert-error','Kết luận giấy khám bệnh thất bại!');
        }
    }

    public function print(HealthCertification $healthCertification)
    {
        $patients = Patient::all();
        $consulting_rooms = ConsultingRoom::all();
        $users = User::whereIn('id', function ($query) {
            $query->select('model_id')->from('model_has_roles')->whereIn('role_id', [2, 3, 9]);
        })->get();

        $data = [
            'patients' => $patients,
            'consulting_rooms' => $consulting_rooms,
            'users' => $users,
            'data_edit' => $healthCertification,
        ];

        return view('health-certification.print', $data);
    }

    public function loadRooms(Request $request)
    {
        if($request->ajax()) {

            $medical_service_id = $request->medical_service_id;

            $listRooms = DB::table('service_rooms')->where('medical_service_id', $medical_service_id)->pluck('consulting_room_id');
            $roomIds = [];
            if ($listRooms->count() > 0) {
                $roomIds = $listRooms->toArray();
            }

            if (!empty($roomIds)) {
                $rooms = ConsultingRoom::whereIn('id', $roomIds)->get();
            }

            if (isset($rooms)) {
                return response([
                    'code' => 200,
                    'rooms' => $rooms
                ]);
            }

            return response([
                'code' => 404,
                'rooms' => ''
            ]);
        }
    }

    public function startToCheck(HealthCertification $healthCertification)
    {
        $data = [
            'data_edit' => $healthCertification,
        ];

        return view('health-certification.start_to_check', $data);
    }

    public function updateToCheck(DiagnosticRequest $request, HealthCertification $healthCertification)
    {
        try {
            DB::beginTransaction();

            $healthCertification->update([
                'status' => 2,
                'diagnostic' => $request->diagnostic,
            ]);

            DB::commit();
            return redirect()->route('health_certifications.index')->with('alert-success','Kết luận giấy khám bệnh thành công!');
        } catch (Exception $e) {
            DB::rollback();
            return redirect()->back()->with('alert-error','Kết luận giấy khám bệnh thất bại!');
        }
    }
}
