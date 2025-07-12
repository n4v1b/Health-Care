@extends('layouts.default')

@section('title') Đặt lịch khám @endsection

@section('content')
    <div class="main-content">

        <div class="page-content">
            <div class="container-fluid">

                <!-- start page title -->
                <div class="row">
                    <div class="col-12">
                        <div class="page-title-box d-flex align-items-center justify-content-between">
                            <h4 class="mb-0 font-size-18">Danh sách đặt lịch khám</h4>

                            <div class="page-title-right">
                                <ol class="breadcrumb m-0">
                                    <li class="breadcrumb-item"><a href="javascript: void(0);" title="Quản lý" data-toggle="tooltip" data-placement="top">Quản lý</a></li>
                                    <li class="breadcrumb-item active">Danh sách đặt lịch khám</li>
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
                                <form method="GET" action="{{ route('booking.index') }}">
                                    <div class="row mb-2">
                                        <div class="col-sm-5">
                                            <div class="search-box mr-2 mb-2 d-inline-block">
                                                <div class="position-relative">
                                                    <input type="text" name="user_code" class="form-control" placeholder="Nhập mã bệnh nhân or mã bác sĩ ">
                                                    <i class="bx bx-search-alt search-icon"></i>
                                                </div>
                                            </div>

                                            <button type="submit" class="btn btn-success waves-effect waves-light">
                                                <i class="bx bx-search-alt search-icon font-size-16 align-middle mr-2"></i> Tìm kiếm
                                            </button>
                                        </div>
                                        
                                        @can('Thêm mới lịch khám')
                                        <div class="col-sm-7">
                                            <div class="text-sm-right">
                                                <a href="{{ route('booking.create') }}" class="text-white btn btn-success btn-rounded waves-effect waves-light mb-2 mr-2"><i class="mdi mdi-plus mr-1"></i> Đặt lịch khám</a>
                                            </div>
                                        </div><!-- end col-->
                                        @endcan
                                    </div>
                                </form>

                                <div class="table-responsive">
                                    <table class="table table-centered">
                                        <thead class="thead-light">
                                            <tr>
                                                <th style="width: 70px;" class="text-center">STT</th>
                                                <th>Bác sĩ</th>
                                                <th>Bệnh nhân</th>
                                                <th>Dịch vụ</th>
                                                <th>Ngày hẹn</th>
                                                <th>Giờ hẹn</th>
                                                <th>Trạng thái</th>
                                                <th>Ngày tạo</th>
                                                <th class="text-center">Hành động</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @php ($stt = 1)
                                            @foreach ($bookings as $booking)
                                                <tr>
                                                    <td class="text-center">{{ $stt++ }}</td>
                                                    <td>{{ $booking->doctor->name ?? '' }} - {{ $booking->doctor->code ?? '' }}</td>
                                                    <td>{{ $booking->patient->name ?? '' }} - {{ $booking->patient->code ?? '' }}</td>
                                                    <td>{{ $booking->service->name ?? '' }}</td>
                                                    <td>{{ $booking->date_booking }}</td>
                                                    <td>{{ $booking->time_booking }}</td>
                                                    <td style="vertical-align: middle">
                                                        <button type="button" class="btn btn-block {{ isset($class_status[$booking->status]) ? $class_status[$booking->status] : '' }} btn-sm">{{ isset($status[$booking->status]) ? $status[$booking->status] : '' }}</button>
                                                    </td>
                                                    <td>{{ formatDate($booking->created_at) }}</td>
                                                    <td class="text-center">
                                                        <ul class="list-inline font-size-20 contact-links mb-0">
                                                            @can('Chỉnh sửa lịch khám')
                                                            <li class="list-inline-item px">
                                                                <a href="{{ route('booking.update', $booking->id) }}" data-toggle="tooltip" data-placement="top" title="Sửa"><i class="mdi mdi-pencil text-success"></i></a>
                                                            </li>
                                                            @endcan

                                                            @can('Xóa lịch khám')
                                                            <li class="list-inline-item px">
                                                                <form method="post" action="{{ route('booking.delete', $booking->id) }}">
                                                                    @csrf
                                                                    @method('DELETE')
                                                                    
                                                                    <button type="submit" data-toggle="tooltip" data-placement="top" title="Xóa" class="border-0 bg-white"><i class="mdi mdi-trash-can text-danger"></i></button>
                                                                </form>
                                                            </li>
                                                            @endcan
                                                        </ul>
                                                    </td>
                                                </tr>
                                            @endforeach
                                        </tbody>
                                    </table>
                                </div>

                                {{ $bookings->links() }}
                            </div>
                        </div>
                    </div>
                </div>
            </div> <!-- container-fluid -->
        </div>
        <!-- End Page-content -->


       
    </div>
@endsection