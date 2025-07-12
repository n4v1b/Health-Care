<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Schedule;
use App\Models\User;
use App\Http\Requests\ScheduleRequest;
use Illuminate\Support\Facades\Auth;

class ScheduleController extends Controller
{
    //
    protected $schedule;
    /**
     * HomeController constructor.
     */
    public function __construct(Schedule $schedule)
    {
        view()->share([
            'schedule_active' => 'active',
            'list_times' => Schedule::LIST_TIMES,
            'date_schedule' => Schedule::DATE_SCHEDULE,
            'jumps' => Schedule::JUMPS,
            'status' => Schedule::STATUS,
            'class_status' => Schedule::CLASS_STATUS,
        ]);
        $this->schedule = $schedule;
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        //
        $user = Auth::user();

        $schedules = Schedule::select('*')->with(['doctor', 'times']);

        if (!$user->hasRole(['Admin'])) {
            $schedules->where('doctor_id', $user->id);
        }

        if ($request->user_code || $request->name) {

            $schedules->whereIn('doctor_id', function ($query) use ($request) {

                if ($request->user_code) {
                    $query->select('id')->from('users')->where('code', $request->user_code);
                }

                if ($request->name) {
                    $query->select('id')->from('users')->where('name', 'like', '%'.$request->name."%");
                }
            });
        }

        if ($request->status) {
            $schedules->where('status', $request->status);
        }

        if ($request->to_date_schedule) {
            $schedules->where('date_schedule', '>=', $request->to_date_schedule);
        }

        if ($request->from_date_schedule) {
            $schedules->where('date_schedule', '<=', $request->from_date_schedule);
        }

        $schedules = $schedules->orderByDesc('id')->paginate(NUMBER_PAGINATION);

        return view('schedule.index', compact('schedules', 'user'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
        $user = Auth::user();
        $users = null;
        if ($user->hasRole(['Admin'])) {
            $users = User::where('id', '<>', 1)->get();
        }

        return view('schedule.create', compact('users', 'user'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(ScheduleRequest $request)
    {
        //
        \DB::beginTransaction();
        try {
            $this->schedule->createOrUpdate($request);
            \DB::commit();
            return redirect()->back()->with('alert-success', 'Lưu dữ liệu thành công');
        } catch (\Exception $exception) {
            \DB::rollBack();
            return redirect()->back()->with('alert-error', 'Đã xảy ra lỗi khi lưu dữ liệu');
        }
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
        $user = Auth::user();
        $users = null;
        if ($user->hasRole(['Admin'])) {
            $users = User::where('id', '<>', 1)->get();
        }
        $schedule = Schedule::with('times')->find($id);
        $listTimes = $schedule->times->pluck('time_schedule')->toArray();
        if (!$schedule) {
            return redirect()->back()->with('alert-error', 'Dữ liệu không tồn tại');
        }

        return view('schedule.edit', compact('schedule', 'users', 'listTimes', 'user'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(ScheduleRequest $request, $id)
    {
        //
        \DB::beginTransaction();
        try {
            $this->schedule->createOrUpdate($request, $id);
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
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function delete($id)
    {
        //
        $schedule = Schedule::find($id);
        if (!$schedule) {
            return redirect()->back()->with('alert-error', 'Dữ liệu không tồn tại');
        }

        try {
            $schedule->delete();
            return redirect()->back()->with('alert-success', 'Xóa thành công');
        } catch (\Exception $exception) {
            return redirect()->back()->with('alert-error', 'Đã xảy ra lỗi không thể xóa dữ liệu');
        }
    }

    public function loadListTimes(Request $request)
    {
        if ($request->ajax()) {
            $list_times = Schedule::LIST_TIMES;
            $jump = $request->jump;

            $times = isset($list_times[$jump]) ? $list_times[$jump] : [];

            $html = view("components.schedule_time", compact('times'))->render();

            return response([
                'status_code' => 200,
                'html' => $html,
            ]);
        }

        return response([
            'status_code' => 404,
            'html' => '',
        ]);
    }
}
