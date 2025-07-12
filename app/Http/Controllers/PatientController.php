<?php

namespace App\Http\Controllers;

use App\Models\Patient;
use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Requests\StorePatientRequest;
use DB;
use Illuminate\Support\Facades\Storage;

class PatientController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $patients = Patient::orderByDesc('id')->paginate(10);

        if ($request->search) {
            $patients = Patient::where('name', 'like', '%'.$request->search.'%')->orderByDesc('id')->paginate(10);
            $patients->appends(['search' => $request->search]);
        }

        $data = [
            'patients' => $patients
        ];

        return view('patient.index', $data);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('patient.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StorePatientRequest $request)
    {
        try {
            DB::beginTransaction();

            $file_path = '';
            if ($request->file('avatar')) {
                $name = time().'_'.$request->avatar->getClientOriginalName();
                $file_path = 'uploads/avatar/patient/'.$name;
                Storage::disk('public_uploads')->putFileAs('avatar/patient', $request->avatar, $name);
            }
            
            $create = Patient::create([
                'code' => '',
                'name' => $request->name,
                'gender' => $request->gender,
                'birthday' => date("Y-m-d", strtotime($request->birthday)),
                'phone' => $request->phone,
                'address' => $request->address,
                'avatar' => $file_path,
                'email' => $request->email,
                'password' => $request->password,
            ]);

            $code = 'BN'.str_pad($create->id, 6, '0', STR_PAD_LEFT);

            $patient = $create->update([
                'code' => $code
            ]);

            if ($patient) {
                $user = [
                    'name' => $create->name,
                    'code' => $code,
                    'password' => bcrypt($request->password),
                    'email' => $create->email,
                    'birthday' => $create->birthday,
                    'gender' => $create->gender,
                    'address' => $create->address,
                    'phone' => $create->phone,
                    'avatar' => $create->avatar,
                ];
                User::create($user);
            }
            
            DB::commit();
            return redirect()->route('patients.index')->with('alert-success','Thêm bệnh nhân thành công!');
        } catch (Exception $e) {
            DB::rollback();
            return redirect()->back()->with('alert-error','Thêm bệnh nhân thất bại!');
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Patient  $patient
     * @return \Illuminate\Http\Response
     */
    public function show(Patient $patient)
    {

    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Patient  $patient
     * @return \Illuminate\Http\Response
     */
    public function edit(Patient $patient)
    {
        $data = [
            'data_edit' => $patient
        ];

        return view('patient.edit', $data);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Patient  $patient
     * @return \Illuminate\Http\Response
     */
    public function update(StorePatientRequest $request, Patient $patient)
    {
        $id = $patient->id;
        try {
            DB::beginTransaction();

            if ($request->file('avatar')) {
                $name = time().'_'.$request->avatar->getClientOriginalName();
                $file_path = 'uploads/avatar/patient/'.$name;
                Storage::disk('public_uploads')->putFileAs('avatar/patient', $request->avatar, $name);
                
                $patient->update([
                    'name' => $request->name,
                    'gender' => $request->gender,
                    'birthday' => date("Y-m-d", strtotime($request->birthday)),
                    'phone' => $request->phone,
                    'address' => $request->address,
                    'avatar' => $file_path,
                    'email' => $request->email,
                ]);
            }
            else {
                $patient->update([
                    'name' => $request->name,
                    'gender' => $request->gender,
                    'birthday' => date("Y-m-d", strtotime($request->birthday)),
                    'phone' => $request->phone,
                    'address' => $request->address,
                    'email' => $request->email,
                ]);
            }

            $patient = Patient::find($id);
            $user = User::where(['code' => $patient->code])->first();

            if ($user) {
                $data = [
                    'name' => $patient->name,
                    'email' => $patient->email,
                    'birthday' => $patient->birthday,
                    'gender' => $patient->gender,
                    'address' => $patient->address,
                    'phone' => $patient->phone,
                    'avatar' => $patient->avatar,
                ];

                $user->update($data);
            } else {
                $data = [
                    'code' => $patient->code,
                    'password' => bcrypt($patient->password),
                    'name' => $patient->name,
                    'email' => $patient->email,
                    'birthday' => $patient->birthday,
                    'gender' => $patient->gender,
                    'address' => $patient->address,
                    'phone' => $patient->phone,
                    'avatar' => $patient->avatar,
                ];
                User::create($data);
            }

            DB::commit();
            return redirect()->route('patients.index')->with('alert-success','Sửa bệnh nhân thành công!');
        } catch (Exception $e) {
            DB::rollback();
            return redirect()->back()->with('alert-error','Sửa bệnh nhân thất bại!');
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Patient  $patient
     * @return \Illuminate\Http\Response
     */
    public function destroy(Patient $patient)
    {
        try {
            DB::beginTransaction();

            if ($patient->healthCertifications->count() > 0) {
                return redirect()->back()->with('alert-error','Xóa bệnh nhân thất bại! Bệnh nhân '.$patient->name.' đang có giấy khám bệnh.');
            }
            elseif ($patient->healthInsuranceCard) {
                return redirect()->back()->with('alert-error','Xóa bệnh nhân thất bại! Bệnh nhân '.$patient->name.' đang có thẻ hiểm.');
            }
            elseif ($patient->serviceVouchers->count() > 0) {
                return redirect()->back()->with('alert-error','Xóa bệnh nhân thất bại! Bệnh nhân '.$patient->name.' đang có phiếu dịch vụ.');
            }
            elseif ($patient->prescriptions->count() > 0) {
                return redirect()->back()->with('alert-error','Xóa bệnh nhân thất bại! Bệnh nhân '.$patient->name.' đang có đơn thuốc.');
            }

            Patient::destroy($patient->id);
            
            DB::commit();
            return redirect()->route('patients.index')->with('alert-success','Xóa bệnh nhân thành công!');
        } catch (Exception $e) {
            DB::rollback();
            return redirect()->back()->with('alert-error','Xóa bệnh nhân thất bại!');
        }
    }
}
