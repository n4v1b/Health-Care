@extends('layouts.default')

@section('title') Quản lý giấy khám bệnh @endsection

@section('content')
    <div class="main-content">

        <div class="page-content">
            <div class="container-fluid">

                <!-- start page title -->
                <div class="row">
                    <div class="col-12">
                        <div class="page-title-box d-flex align-items-center justify-content-between">
                            <h4 class="mb-0 font-size-18">Danh sách giấy khám bệnh</h4>

                            <div class="page-title-right">
                                <ol class="breadcrumb m-0">
                                    <li class="breadcrumb-item"><a href="javascript: void(0);" title="Quản lý" data-toggle="tooltip" data-placement="top">Quản lý</a></li>
                                    <li class="breadcrumb-item active">Danh sách giấy khám bệnh</li>
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
                                <form method="GET" action="{{ route('health_certifications.index') }}">
                                    <div class="row mb-2">
                                        <div class="col-sm-9">
                                            <div class="search-box mr-2 mb-2 d-inline-block">
                                                <div class="position-relative">
                                                    <input type="text" name="search" class="form-control" placeholder="Nhập tên bệnh nhân">
                                                    <i class="bx bx-search-alt search-icon"></i>
                                                </div>
                                            </div>
                                            <div class="search-box mr-2 mb-2 d-inline-block">
                                                <input type="date" name="start_date" class="form-control" value="{{ request()->has('start_date') ? formatDate(request()->get('start_date')) : '' }}">
                                            </div>
                                            <div class="search-box mr-2 mb-2 d-inline-block">
                                                <input type="date" name="end_date" class="form-control" value="{{ request()->has('end_date') ? formatDate(request()->get('end_date')) : '' }}">
                                            </div>
                                            <button type="submit" class="btn btn-success waves-effect waves-light" value="submit" name="submit">
                                                <i class="bx bx-search-alt search-icon font-size-16 align-middle mr-2"></i> Tìm kiếm
                                            </button>
                                            {{--<button type="submit" class="btn btn-success waves-light" value="export" name="submit">--}}
                                                {{--<i class="bx bx-archive-in font-size-16 align-middle mr-2"></i> Export--}}
                                            {{--</button>--}}
                                        </div>

                                        @can('Thêm giấy khám bệnh')
                                        <div class="col-sm-3">
                                            <div class="text-sm-right">
                                                <a href="{{ route('health_certifications.create') }}" class="text-white btn btn-success btn-rounded waves-effect waves-light mb-2 mr-2"><i class="mdi mdi-plus mr-1"></i> Thêm giấy khám bệnh</a>
                                            </div>
                                        </div><!-- end col-->
                                        @endcan
                                    </div>
                                </form>

                                <div class="table-responsive">
                                    <table class="table table-centered table-nowrap">
                                        <thead class="thead-light">
                                            <tr>
                                                <th class="text-center">STT</th>
                                                <th>Mã</th>
                                                <th>Tên bệnh nhân</th>
                                                <th>Dịch vụ</th>
                                                <th>Phòng khám</th>
                                                <th>Bác sĩ</th>
                                                <th>Ngày</th>
                                                <th>Trạng thái</th>
                                                <th>Thanh toán</th>
                                                <th class="text-center">Hành động</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @php ($stt = 1)
                                            @foreach ($health_certifications as $health_certification)
                                                <tr>
                                                    <td class="text-center">{{ $stt++ }}</td>
                                                    <td>{{ $health_certification->code }}</td>
                                                    <td>
                                                        {{ $health_certification->patient->name }}
                                                    </td>
                                                    <td>
                                                        {{ isset($health_certification->medicalService) ? $health_certification->medicalService->name : '' }}
                                                    </td>
                                                    <td>{{ $health_certification->consultingRoom->name }}</td>
                                                    <td>{{ isset($health_certification->user) ?  $health_certification->user->name : '' }}</td>
                                                    <td>{{ date("d-m-Y", strtotime($health_certification->end_date)) }}</td>
                                                    <td>
                                                        @if ($health_certification->status == 1)
                                                            <label class="btn btn-success waves-effect waves-light">
                                                                <i class="bx bx-check-double font-size-16 align-middle mr-2"></i> Đã khám
                                                            </label>
                                                        @elseif($health_certification->status == 2)
                                                            <label class="btn btn-primary waves-effect waves-light font-size-12">Đang khám</label>
                                                        @else
                                                            <label class="btn btn-warning waves-effect waves-light font-size-12">Chưa khám</label>
                                                        @endif
                                                    </td>
                                                    <td>
                                                        @if ($health_certification->payment_status)
                                                            <label class="btn btn-success waves-effect waves-light">
                                                                <i class="bx bx-check-double font-size-16 align-middle mr-2"></i> Đã thanh toán
                                                            </label>
                                                        @else
                                                            <label class="btn btn-warning waves-effect waves-light font-size-12">Chưa thanh toán</label>
                                                        @endif
                                                    </td>
                                                    <td class="text-center">
                                                        <ul class="list-inline font-size-20 contact-links mb-0">
                                                            @can('Xem thông tin giấy khám bệnh')
                                                            <li class="list-inline-item px">
                                                                <a href="{{ route('health_certifications.show', $health_certification->id) }}" data-toggle="tooltip" data-placement="top" title="Xem thông tin"><i class="bx bx-user-circle text-success"></i></a>
                                                            </li>
                                                            @endcan

                                                            @can('In giấy khám bệnh')
                                                            <li class="list-inline-item px">
                                                                <a href="{{ route('health_certifications.print', $health_certification->id) }}" data-toggle="tooltip" data-placement="top" title="In giấy khám bệnh"><i class="bx bx-printer text-success"></i></a>
                                                            </li>
                                                            @endcan


                                                            @if (in_array($health_certification->status, [0, 2]))
                                                                @if ($health_certification->status == 0)
                                                                @can('Bắt đầu khám')
                                                                <li class="list-inline-item px">
                                                                    <a href="{{ route('start.to.check', $health_certification->id) }}" data-toggle="tooltip" data-placement="top" title="Bắt đầu khám"><i class="fa fa-play-circle text-success"></i></a>
                                                                </li>
                                                                @endcan
                                                                @endif
                                                                @if ($health_certification->payment_status == 1)
                                                                    @can('Kết luận khám giấy khám bệnh')
                                                                    <li class="list-inline-item px">
                                                                        <a href="{{ route('health_certifications.conclude', $health_certification->id) }}" data-toggle="tooltip" data-placement="top" title="Kết luận khám"><i class="bx bxs-calendar-check text-success"></i></a>
                                                                    </li>
                                                                    @endcan
                                                                @endif

                                                                @can('Chỉnh sửa giấy khám bệnh')
                                                                <li class="list-inline-item px">
                                                                    <a href="{{ route('health_certifications.edit', $health_certification->id) }}" data-toggle="tooltip" data-placement="top" title="Sửa"><i class="mdi mdi-pencil text-success"></i></a>
                                                                </li>
                                                                @endcan
                                                                
                                                                @can('Xóa giấy khám bệnh')
                                                                <li class="list-inline-item px">
                                                                    <form method="post" action="{{ route('health_certifications.destroy', $health_certification->id) }}">
                                                                        @csrf
                                                                        @method('DELETE')
                                                                        
                                                                        <button type="submit" data-toggle="tooltip" data-placement="top" title="Xóa" class="border-0 bg-white"><i class="mdi mdi-trash-can text-danger"></i></button>
                                                                    </form>
                                                                </li>
                                                                @endcan
                                                            @else
                                                                @if (!$health_certification->prescription)
                                                                    @can('Kê đơn thuốc')
                                                                    <li class="list-inline-item px">
                                                                        <a href="{{ route('prescriptions.create', ['health_certification_id' => $health_certification->id]) }}" data-toggle="tooltip" data-placement="top" title="Kê đơn thuốc"><i class="bx bxs-calendar-check text-success"></i></a>
                                                                    </li>
                                                                    @endcan
                                                                @endif

                                                            @endif
                                                        </ul>
                                                    </td>
                                                </tr>
                                            @endforeach
                                        </tbody>
                                    </table>
                                </div>

                                {{ $health_certifications->links() }}
                            </div>
                        </div>
                    </div>
                </div>
            </div> <!-- container-fluid -->
        </div>
        <!-- End Page-content -->


        
    </div>
@endsection