@extends('layouts.default')

@section('title') Trang chủ @endsection

@section('content')
    <div class="main-content">

        <div class="page-content">
            <div class="container-fluid">

                <!-- start page title -->
                <div class="row">
                    <div class="col-12">
                        <div class="page-title-box d-flex align-items-center justify-content-between">
                            <h4 class="mb-0 font-size-18">Trang chủ</h4>

                            <div class="page-title-right">
                                <ol class="breadcrumb m-0">
                                    <li class="breadcrumb-item"><a href="javascript: void(0);">Trang chủ</a></li>
                                    <li class="breadcrumb-item active">Trang chủ</li>
                                </ol>
                            </div>

                        </div>
                    </div>
                </div>
                <!-- end page title -->

                <div class="row">
                    <div class="col-xl-4">
                        <div class="card overflow-hidden">
                            <div class="bg-soft-primary">
                                <div class="row">
                                    <div class="col-7">
                                        <div class="text-primary p-3">
                                            <h5 class="text-primary">Chào mừng trở lại!</h5>
                                        </div>
                                    </div>
                                    <div class="col-5 align-self-end">
                                        <img src="{{ asset('images\profile-img.png') }}" alt="" class="img-fluid">
                                    </div>
                                </div>
                            </div>
                            <div class="card-body pt-0">
                                <div class="row">
                                    <div class="col-sm-4">
                                        <div class="avatar-md profile-user-wid mb-4">
                                            @if (auth()->user()->avatar)
                                            <img src="{{ asset(auth()->user()->avatar) }}" alt="" class="img-thumbnail rounded-circle">
                                            @else
                                            <div class="avatar-md">
                                                <span class="avatar-title rounded-circle text-uppercase">
                                                    {{ substr(auth()->user()->name, 0, 1) }}
                                                </span>
                                            </div>
                                            @endif
                                        </div>
                                        <h5 class="font-size-15 text-truncate">{{ auth()->user()->name }}</h5>
                                        <p class="text-muted mb-0 text-truncate">
                                            @foreach (auth()->user()->roles as $role)
                                            <span class="badge badge-dark text-white">{{ $role->name }}</span>
                                            @endforeach
                                        </p>
                                    </div>

                                    <div class="col-sm-8">
                                        <div class="pt-4">
                                         
                                            <div class="row">
                                                <div class="col-6">
                                                    <h5 class="font-size-15">Mã</h5>
                                                    <p class="text-muted mb-0">{{ auth()->user()->code }}</p>
                                                </div>
                                                <div class="col-6">
                                                    <h5 class="font-size-15">Giới tính</h5>
                                                    <p class="text-muted mb-0">{{ auth()->user()->gender }}</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- end card -->

                        
                    </div>  
                    <div class="col-xl-8">
                        <div class="row">
                            @can('Xem danh sách giấy khám bệnh')
                            <div class="col-md-4">
                                <div class="card mini-stats-wid">
                                    <div class="card-body">
                                        <div class="media">
                                            <div class="media-body">
                                                <p class="text-muted font-weight-medium">Giấy khám bệnh</p>
                                                <h4 class="mb-0">{{ $health_certification }}</h4>
                                            </div>

                                            <div class="mini-stat-icon avatar-sm rounded-circle bg-primary align-self-center">
                                                <span class="avatar-title">
                                                    <i class="bx bx-copy-alt font-size-24"></i>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            @endcan
                            @can('Xem danh sách phiếu dịch vụ')
                            <div class="col-md-4">
                                <div class="card mini-stats-wid">
                                    <div class="card-body">
                                        <div class="media">
                                            <div class="media-body">
                                                <p class="text-muted font-weight-medium">Phiếu dịch vụ</p>
                                                <h4 class="mb-0">{{ $service_voucher }}</h4>
                                            </div>

                                            <div class="avatar-sm rounded-circle bg-primary align-self-center mini-stat-icon">
                                                <span class="avatar-title rounded-circle bg-primary">
                                                    <i class="bx bx-archive-in font-size-24"></i>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            @endcan
                            @can('Xem danh sách đơn thuốc')
                            <div class="col-md-4">
                                <div class="card mini-stats-wid">
                                    <div class="card-body">
                                        <div class="media">
                                            <div class="media-body">
                                                <p class="text-muted font-weight-medium">Đơn thuốc</p>
                                                <h4 class="mb-0">{{ $prescription }}</h4>
                                            </div>

                                            <div class="avatar-sm rounded-circle bg-primary align-self-center mini-stat-icon">
                                                <span class="avatar-title rounded-circle bg-primary">
                                                    <i class="bx bx-purchase-tag-alt font-size-24"></i>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            @endcan
                        </div>
                        <!-- end row -->
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card mini-stats-wid">
                                    <div class="card-body">
                                        <div class="md-col-12">
                                            <p class="text-muted font-weight-medium">Lịch làm việc ngày : {{ $currentDay }}</p>
                                        </div>

                                        <div class="md-col-12">
                                            @if(isset($schedule->times))
                                                @foreach($schedule->times as $time)
                                                    <small class="badge badge-primary">{{$time->time_schedule}}</small>
                                                @endforeach
                                            @endif
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- end row -->
                <!-- container-fluid -->
                @can('Quản lý báo cáo')
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <form action="">
                                    <div class="row">
                                        <div class="col-sm-12 col-md-2">
                                            <div class="form-group">
                                                <lable>Ngày bắt đầu</lable>
                                                <input type="date" class="form-control" name="start_day" value="{{ request()->has('start_day') ? formatDate(request()->get('start_day')) : formatDate() }}">
                                            </div>
                                        </div>
                                        <div class="col-sm-12 col-md-2">
                                            <div class="form-group">
                                                <lable>Ngày kết thúc</lable>
                                                <input type="date" class="form-control" name="end_day" value="{{ request()->has('end_day') ? formatDate(request()->get('end_day')) : formatDate() }}">
                                            </div>
                                        </div>
                                        <div class="col-sm-12 col-md-2">
                                            <?php $month = date('m'); ?>
                                            <div class="form-group">
                                                <lable>Tháng</lable>
                                                <select name="select_month" id="" class="form-control">
                                                    @for($i = 1; $i < 13; $i++)
                                                        @if(Request::get('select_month'))
                                                            <option {{ Request::get('select_month') == $i ? "selected='selected'" : '' }} value="{{$i}}">{{$i}}</option>
                                                        @else
                                                            <option {{ $month == $i ? "selected='selected'" : '' }} value="{{$i}}">{{$i}}</option>
                                                        @endif
                                                    @endfor
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-sm-12 col-md-2">
                                            <?php $year = date('Y'); ?>
                                            <div class="form-group">
                                                <lable>Năm</lable>
                                                <select name="select_year" id="" class="form-control">
                                                    @for($i = $year - 15; $i <= $year + 5; $i++)
                                                        @if(Request::get('select_year'))
                                                            <option {{ Request::get('select_year') == $i ? "selected='selected'" : '' }} value="{{$i}}">{{$i}}</option>
                                                        @else
                                                            <option {{ $year == $i ? "selected='selected'" : '' }} value="{{$i}}">{{$i}}</option>
                                                        @endif
                                                    @endfor
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-sm-12 col-md-2">
                                            <div class="input-group-append">
                                                <button type="submit" class="btn btn-success " style="margin-right: 10px; margin-top: 20px"><i class="fa fa-fw fa-search"></i> Lọc dữ liệu </button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="page-title-box d-flex align-items-center justify-content-between">
                            <h4 class="mb-0 font-size-18">Thống kê doanh thu giấy khám bệnh</h4>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="card mini-stats-wid">
                                            <div class="card-body">
                                                <div class="media">
                                                    <div class="media-body">
                                                        <p class="text-muted font-weight-medium"><span title="Doanh thu">DT</span> từ {{ request()->has('start_day') ? formatDate(request()->get('start_day')) : formatDate() }}
                                                            đến
                                                            {{ request()->has('end_day') ? formatDate(request()->get('end_day')) : formatDate() }}</p>
                                                        <h4 class="mb-0">{{ number_format($statistical_health_day, 0, ',', '.') }} VNĐ</h4>
                                                    </div>

                                                    <div class="mini-stat-icon avatar-sm rounded-circle bg-primary align-self-center">
                                                <span class="avatar-title">
                                                    <i class="bx bx-dollar-circle font-size-24"></i>
                                                </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="card mini-stats-wid">
                                            <div class="card-body">
                                                <div class="media">
                                                    <div class="media-body">
                                                        <p class="text-muted font-weight-medium"><span title="Doanh thu">DT</span> tháng {{ request()->has('select_month') ? request()->get('select_month') : $month }}</p>
                                                        <h4 class="mb-0">{{ number_format($statistical_health_month, 0, ',', '.') }} VNĐ</h4>
                                                    </div>

                                                    <div class="mini-stat-icon avatar-sm rounded-circle bg-primary align-self-center">
                                                <span class="avatar-title">
                                                    <i class="bx bx-dollar-circle font-size-24"></i>
                                                </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="card mini-stats-wid">
                                            <div class="card-body">
                                                <div class="media">
                                                    <div class="media-body">
                                                        <p class="text-muted font-weight-medium"><span title="Doanh thu">DT</span> năm {{ request()->has('select_year') ? request()->get('select_year') : $year}}</p>
                                                        <h4 class="mb-0">{{ number_format($statistical_health_year, 0, ',', '.') }} VNĐ</h4>
                                                    </div>

                                                    <div class="mini-stat-icon avatar-sm rounded-circle bg-primary align-self-center">
                                                <span class="avatar-title">
                                                    <i class="bx bx-dollar-circle font-size-24"></i>
                                                </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-12">
                        <div class="page-title-box d-flex align-items-center justify-content-between">
                            <h4 class="mb-0 font-size-18">Thống kê doanh thu đơn thuốc</h4>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="card mini-stats-wid">
                                            <div class="card-body">
                                                <div class="media">
                                                    <div class="media-body">
                                                        <p class="text-muted font-weight-medium"><span title="Doanh thu">DT</span> từ {{ request()->has('start_day') ? formatDate(request()->get('start_day')) : formatDate() }}
                                                            đến
                                                            {{ request()->has('end_day') ? formatDate(request()->get('end_day')) : formatDate() }}</p>
                                                        <h4 class="mb-0">{{ number_format($statistical_prescription_day, 0, ',', '.') }} VNĐ</h4>
                                                    </div>

                                                    <div class="mini-stat-icon avatar-sm rounded-circle bg-primary align-self-center">
                                                <span class="avatar-title">
                                                    <i class="bx bx-dollar-circle font-size-24"></i>
                                                </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="card mini-stats-wid">
                                            <div class="card-body">
                                                <div class="media">
                                                    <div class="media-body">
                                                        <p class="text-muted font-weight-medium"><span title="Doanh thu">DT</span> tháng {{ request()->has('select_month') ? request()->get('select_month') : $month }}</p>
                                                        <h4 class="mb-0">{{ number_format($statistical_prescription_month, 0, ',', '.') }} VNĐ</h4>
                                                    </div>

                                                    <div class="mini-stat-icon avatar-sm rounded-circle bg-primary align-self-center">
                                                <span class="avatar-title">
                                                    <i class="bx bx-dollar-circle font-size-24"></i>
                                                </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="card mini-stats-wid">
                                            <div class="card-body">
                                                <div class="media">
                                                    <div class="media-body">
                                                        <p class="text-muted font-weight-medium"><span title="Doanh thu">DT</span> năm {{ request()->has('select_year') ? request()->get('select_year') : $year }}</p>
                                                        <h4 class="mb-0">{{ number_format($statistical_prescription_year, 0, ',', '.') }} VNĐ</h4>
                                                    </div>

                                                    <div class="mini-stat-icon avatar-sm rounded-circle bg-primary align-self-center">
                                                <span class="avatar-title">
                                                    <i class="bx bx-dollar-circle font-size-24"></i>
                                                </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-12">
                        <div class="page-title-box d-flex align-items-center justify-content-between">
                            <h4 class="mb-0 font-size-18">Thống kê doanh thu phiếu cận lâm sàn</h4>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="card mini-stats-wid">
                                            <div class="card-body">
                                                <div class="media">
                                                    <div class="media-body">
                                                        <p class="text-muted font-weight-medium"><span title="Doanh thu">DT</span> từ {{ request()->has('start_day') ? formatDate(request()->get('start_day')) : formatDate() }}
                                                            đến
                                                            {{ request()->has('end_day') ? formatDate(request()->get('end_day')) : formatDate() }}</p>
                                                        <h4 class="mb-0">{{ number_format($statistical_voucher_day, 0, ',', '.') }} VNĐ</h4>
                                                    </div>

                                                    <div class="mini-stat-icon avatar-sm rounded-circle bg-primary align-self-center">
                                                <span class="avatar-title">
                                                    <i class="bx bx-dollar-circle font-size-24"></i>
                                                </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="card mini-stats-wid">
                                            <div class="card-body">
                                                <div class="media">
                                                    <div class="media-body">
                                                        <p class="text-muted font-weight-medium"><span title="Doanh thu">DT</span> tháng {{ request()->has('select_month') ? request()->get('month_voucher') : $month }}</p>
                                                        <h4 class="mb-0">{{ number_format($statistical_voucher_month, 0, ',', '.') }} VNĐ</h4>
                                                    </div>

                                                    <div class="mini-stat-icon avatar-sm rounded-circle bg-primary align-self-center">
                                                <span class="avatar-title">
                                                    <i class="bx bx-dollar-circle font-size-24"></i>
                                                </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="card mini-stats-wid">
                                            <div class="card-body">
                                                <div class="media">
                                                    <div class="media-body">
                                                        <p class="text-muted font-weight-medium"><span title="Doanh thu">DT</span> năm {{ request()->has('select_year') ? request()->get('select_year') : $year}}</p>
                                                        <h4 class="mb-0">{{ number_format($statistical_voucher_year, 0, ',', '.') }} VNĐ</h4>
                                                    </div>

                                                    <div class="mini-stat-icon avatar-sm rounded-circle bg-primary align-self-center">
                                                <span class="avatar-title">
                                                    <i class="bx bx-dollar-circle font-size-24"></i>
                                                </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                @endcan
            </div>
            <!-- End Page-content -->

            
        </div>
@endsection