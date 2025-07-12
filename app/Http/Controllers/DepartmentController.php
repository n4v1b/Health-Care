<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Department;
use App\Http\Requests\DepartmentRequest;
use DB;

class DepartmentController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        //
        $departments = Department::select('*');

        if ($request->search) {
            $departments->where('name', 'like', '%'.$request->search.'%');
            $departments->appends(['search' => $request->search]);
        }
        $departments = $departments->orderByDesc('id')->paginate(10);

        $data = [
            'departments' => $departments
        ];

        return view('department.index', $data);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
        return view('department.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(DepartmentRequest $request)
    {
        //
        try {
            DB::beginTransaction();

            $create = Department::create([
                'code' => '',
                'name' => $request->name,
            ]);

            $create->update([
                'code' => 'DE'.str_pad($create->id, 6, '0', STR_PAD_LEFT)
            ]);

            DB::commit();
            return redirect()->route('department.index')->with('alert-success','Thêm phòng ban thành công!');
        } catch (Exception $e) {
            DB::rollback();
            return redirect()->back()->with('alert-error','Thêm loại thuốc thất bại!');
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(Department $department)
    {
        //
        $data = [
            'data_edit' => $department
        ];

        return view('department.edit', $data);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(DepartmentRequest $request, Department $department)
    {
        //
        try {
            DB::beginTransaction();

            $department->update([
                'name' => $request->name,
            ]);

            DB::commit();
            return redirect()->route('department.index')->with('alert-success','Sửa phòng ban thành công!');
        } catch (Exception $e) {
            DB::rollback();
            return redirect()->back()->with('alert-error','Sửa loại thuốc thất bại!');
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Department $department)
    {
        //
        try {
            DB::beginTransaction();
            $department->destroy($department->id);

            DB::commit();
            return redirect()->route('department.index')->with('alert-success','Xóa phòng ban thành công!');
        } catch (Exception $e) {
            DB::rollback();
            return redirect()->back()->with('alert-error','Xóa loại thuốc thất bại!');
        }
    }
}
