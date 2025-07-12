@extends('layouts.default')
@section('title', '')
@section('content')
    <div class="main-content">

        <div class="page-content">
            <div class="container-fluid">

                <!-- start page title -->
                <div class="row">
                    <div class="col-12">
                        <div class="page-title-box d-flex align-items-center justify-content-between">
                            <h4 class="mb-0 font-size-18">Lịch làm việc</h4>

                            <div class="page-title-right">
                                <ol class="breadcrumb m-0">
                                    <li class="breadcrumb-item"><a href="javascript: void(0);" title="Quản lý" data-toggle="tooltip" data-placement="top">Quản lý</a></li>
                                    <li class="breadcrumb-item active">Lịch làm việc</li>
                                </ol>
                            </div>

                        </div>
                    </div>
                </div>
                <!-- end page title -->

                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <form method="GET" action="{{ route('schedule.index') }}">
                                    <div class="row mb-2">
                                        <div class="col-sm-5">
                                            <div class="search-box mr-2 mb-2 d-inline-block">
                                                <div class="position-relative">
                                                    <input type="text" name="user_code" class="form-control mg-r-15" placeholder="Mã bác sĩ">
                                                    <i class="bx bx-search-alt search-icon"></i>
                                                </div>
                                            </div>
                                            <button type="submit" class="btn btn-success waves-effect waves-light">
                                                <i class="bx bx-search-alt search-icon font-size-16 align-middle mr-2"></i> Tìm kiếm
                                            </button>
                                        </div>
                                        @can('Thêm mới lịch làm việc')
                                        <div class="col-sm-7">
                                            <div class="text-sm-right">
                                                <a href="{{ route('schedule.create') }}" class="text-white btn btn-success btn-rounded waves-effect waves-light mb-2 mr-2"><i class="mdi mdi-plus mr-1"></i> Thêm lịch làm việc</a>
                                            </div>
                                        </div><!-- end col-->
                                        @endcan
                                    </div>
                                </form>

                                <div class="table-responsive">
                                    <table class="table table-hover table-bordered">
                                        <thead>
                                        <tr>
                                            <th width="4%" class=" text-center">STT</th>
                                            <th>Mã bác sĩ</th>
                                            <th>Tên bác sĩ</th>
                                            <th>Ngày đăng ký</th>
                                            <th width="30%">Lịch làm việc</th>
                                            <th>Trạng thái</th>
                                            <th>Hành động</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        @if (!$schedules->isEmpty())
                                            @php $i = $schedules->firstItem(); @endphp
                                            @foreach($schedules as $schedule)
                                                <tr>
                                                    <td class=" text-center" style="vertical-align: middle">{{ $i }}</td>
                                                    <td style="vertical-align: middle">{{isset($schedule->doctor)? $schedule->doctor->code : ''}}</td>
                                                    <td style="vertical-align: middle">{{isset($schedule->doctor)? $schedule->doctor->name : ''}}</td>
                                                    <td style="vertical-align: middle"><span class="label label-success">{{$schedule->date_schedule}}</span></td>
                                                    <td width="30%" style="vertical-align: middle">
                                                        @if(isset($schedule->times))
                                                            @foreach($schedule->times as $time)
                                                                <small class="badge badge-primary">{{$time->time_schedule}}</small>
                                                            @endforeach
                                                        @endif
                                                    </td>
                                                    <td style="vertical-align: middle">
                                                        <button type="button" class="btn btn-block {{ isset($class_status[$schedule->status]) ? $class_status[$schedule->status] : '' }} btn-xs">{{ isset($status[$schedule->status]) ? $status[$schedule->status] : '' }}</button>
                                                    </td>
                                                    <td class="text-center" style="vertical-align: middle">
                                                        @can('Chỉnh sửa lịch làm việc')
                                                        <a class="btn btn-primary btn-sm" href="{{ route('schedule.update', $schedule->id) }}">
                                                            <i class="fas fa-pencil-alt"></i>
                                                        </a>
                                                        @endcan
                                                        @can('Xóa lịch làm việc')
                                                        <a class="btn btn-danger btn-sm btn-delete btn-confirm-delete" href="{{ route('schedule.delete', $schedule->id) }}">
                                                            <i class="fas fa-trash"></i>
                                                        </a>
                                                        @endcan
                                                    </td>
                                                </tr>
                                                @php $i++ @endphp
                                            @endforeach
                                        @endif
                                        </tbody>
                                    </table>
                                </div>

                                {{ $schedules->links() }}
                            </div>
                        </div>
                    </div>
                </div>
            </div> <!-- container-fluid -->
        </div>
        <!-- End Page-content -->



    </div>
@stop
