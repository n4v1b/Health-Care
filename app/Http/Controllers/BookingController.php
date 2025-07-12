<?php

namespace App\Http\Controllers;

use App\Models\Booking;
use App\Models\MedicalService;
use App\Models\User;
use App\Models\Patient;
use App\Models\Schedule;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Http\Requests\BookingRequest;

class BookingController extends Controller
{

    protected $booking;
    /**
     * HomeController constructor.
     */
    public function __construct(Booking $booking)
    {
        view()->share([
            'status' => Booking::STATUS,
            'class_status' => Booking::CLASS_STATUS,
        ]);
        $this->booking = $booking;
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        //
        $admin = Auth::user();

        $bookings = Booking::select('*')->with(['doctor', 'patient']);

        if (!$admin->hasRole(['Admin']) && !$admin->hasRole(['Bệnh nhân'])) {
            $bookings->where('doctor_id', $admin->id);
        }

        if ($admin->hasRole(['Bệnh nhân'])) {
            $bookings->where('patient_id', $admin->patient->id);
        }

        if ($request->user_code) {

            $user_code = $request->user_code;

            $bookings->whereIn('doctor_id', function ($query) use ($user_code) {
                $query->select('id')->from('users')->where('code', $user_code);
            });

            $bookings->orWhereIn('patient_id', function ($query) use ($user_code) {
                $query->select('id')->from('patients')->where('code', $user_code);
            });
        }

        $bookings = $bookings->orderByDesc('id')->paginate(NUMBER_PAGINATION);

        return view('booking.index', compact('bookings', 'admin'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
        $admin = Auth::user();

        $patients = Patient::all();
        $users = User::whereIn('id', function ($query) {
            $query->select('model_id')->from('model_has_roles')->whereIn('role_id', [2, 3, 9]);
        })->get();
        $medical_services = MedicalService::get();

        $data = [
            'patients' => $patients,
            'admin' => $admin,
            'users' => $users,
            'medical_services' => $medical_services,
        ];

        return view('booking.create', $data);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(BookingRequest $request)
    {
        //
        \DB::beginTransaction();
        try {
            $this->booking->createOrUpdate($request);
            \DB::commit();
            return redirect()->back()->with('alert-success', 'Lưu dữ liệu thành công');
        } catch (\Exception $exception) {
            \DB::rollBack();
            return redirect()->back()->with('alert-error', 'Đã xảy ra lỗi khi lưu dữ liệu');
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Booking  $booking
     * @return \Illuminate\Http\Response
     */
    public function show(Booking $booking)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Booking  $booking
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
        $admin = Auth::user();
        $booking = Booking::with('service')->find($id);
        $patients = Patient::all();
        $users = User::whereIn('id', function ($query) {
            $query->select('model_id')->from('model_has_roles')->whereIn('role_id', [2, 3, 9]);
        })->get();
        $medical_services = MedicalService::get();

        $schedules = Schedule::with('times')->where(['doctor_id' => $booking->doctor_id, 'date_schedule' => $booking->date_booking])->where('status', 1)->first();

        $data = [
            'patients' => $patients,
            'admin' => $admin,
            'users' => $users,
            'medical_services' => $medical_services,
            'data_edit' => $booking,
            'list_times' => $schedules->times ?? [],
        ];

        return view('booking.edit', $data);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Booking  $booking
     * @return \Illuminate\Http\Response
     */
    public function update(BookingRequest $request, $id)
    {
        //
        \DB::beginTransaction();
        try {
            $this->booking->createOrUpdate($request, $id);
            \DB::commit();
            return redirect()->back()->with('alert-success', 'Lưu dữ liệu thành công');
        } catch (\Exception $exception) {
            \DB::rollBack();
            return redirect()->back()->with('alert-error', 'Đã xảy ra lỗi khi lưu dữ liệu');
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Booking  $booking
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
        $booking = Booking::find($id);
        if (!$booking) {
            return redirect()->back()->with('alert-error', 'Dữ liệu không tồn tại');
        }

        try {
            $booking->delete();
            return redirect()->back()->with('alert-success', 'Xóa thành công');
        } catch (\Exception $exception) {
            return redirect()->back()->with('alert-error', 'Đã xảy ra lỗi không thể xóa dữ liệu');
        }
    }

    public function loadListService(Request $request)
    {
        if ($request->ajax()) {

            $doctor_id = $request->doctor_id;


            $user = User::find($doctor_id);

            if (!$user) {
                return response([
                    'code' => 404,
                    'message' => 'Không tìm thấy bác sĩ'
                ]);
            }

            if (empty($user->consulting_room_id)) {
                return response([
                    'code' => 404,
                    'message' => 'Bác sĩ chưa thuộc phòng khám nào'
                ]);
            }

            $serviceIds = \DB::table('service_rooms')->where('consulting_room_id', $user->consulting_room_id)->pluck('medical_service_id')->toArray();

            if (empty($serviceIds)) {
                return response([
                    'code' => 404,
                    'message' => 'Phòng khám chưa có dịch vụ khám chưa thể đặt lịch khám'
                ]);
            }

            $medical_services = MedicalService::whereIn('id', $serviceIds)->get();
            if ($request->date_booking) {
                $date_booking = Carbon::parse($request->date_booking)->format('Y-m-d');
                $schedules = Schedule::with('times')->where(['doctor_id' => $doctor_id, 'date_schedule' => $date_booking])->where('status', 1)->first();
            }


            return response([
                'code' => 200,
                'message' => 'Thành công',
                'services' => $medical_services,
                'list_times' => isset($schedules)&& isset($schedules->times) ? $schedules->times : [],
            ]);
        }
    }

    public function loadListTimes(Request $request)
    {
        if ($request->ajax()) {

            $doctor_id = $request->doctor_id;
            $date_booking = Carbon::parse($request->date_booking)->format('Y-m-d');

            $user = User::find($request->doctor_id);

            if (!$user) {
                return response([
                    'code' => 404,
                    'message' => 'Không tìm thấy bác sĩ'
                ]);
            }

            $schedules = Schedule::with('times')->where(['doctor_id' => $doctor_id, 'date_schedule' => $date_booking])->where('status', 1)->first();

            if (!$schedules || !isset($schedules->times)) {
                return response([
                    'code' => 404,
                    'message' => 'Không tìm thấy lịch làm việc của bác sĩ'
                ]);
            }

            return response([
                'code' => 200,
                'message' => 'Thành công',
                'list_times' => $schedules->times,
            ]);
        }
    }

    public function bookingDoctor(Request $request)
    {
        $admin = Auth::user();

        $bookings = Booking::select('*')->with(['doctor', 'patient']);

        if (!$admin->hasRole(['Admin']) && !$admin->hasRole(['Bệnh nhân'])) {
            $bookings->where('doctor_id', $admin->id);
        }

        if ($admin->hasRole(['Bệnh nhân'])) {
            $bookings->where('patient_id', $admin->patient->id);
        }

        if ($request->user_code) {

            $user_code = $request->user_code;

            $bookings->whereIn('doctor_id', function ($query) use ($user_code) {
                $query->select('id')->from('users')->where('code', $user_code);
            });

            $bookings->orWhereIn('patient_id', function ($query) use ($user_code) {
                $query->select('id')->from('patients')->where('code', $user_code);
            });
        }

        $bookings = $bookings->orderByDesc('id')->paginate(NUMBER_PAGINATION);

        return view('booking.doctor', compact('bookings', 'admin'));
    }
}
