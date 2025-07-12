@extends('layouts.default')

@section('title') Danh sách báo cáo @endsection

@section('content')
    <div class="main-content">

        <div class="page-content">
            <div class="container-fluid">

                <!-- start page title -->
                <div class="row">
                    <div class="col-12">
                        <div class="page-title-box d-flex align-items-center justify-content-between">
                            <h4 class="mb-0 font-size-18">Danh sách báo cáo</h4>

                            <div class="page-title-right">
                                <ol class="breadcrumb m-0">
                                    <li class="breadcrumb-item"><a href="javascript: void(0);" title="Quản lý" data-toggle="tooltip" data-placement="top">Quản lý</a></li>
                                    <li class="breadcrumb-item active">Danh sách báo cáo</li>
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
                                <div class="table-responsive">
                                    <table class="table table-centered table-nowrap">
                                        <thead class="thead-light">
                                            <tr>
                                                <th style="width: 70px;" class="text-center">STT</th>
                                                <th>Báo cáo</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>1</td>
                                                <td><a href="" class="report-statistics report-health-certifications" report="health">Báo cáo giấy khám bệnh</a></td>
                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td><a href="" class="report-statistics report-prescriptions" report="prescription">Báo cáo đơn thuốc</a></td>
                                            </tr>
                                            <tr>
                                                <td>3</td>
                                                <td><a href="" class="report-statistics report-service-vouchers" report="service">Báo cáo phiếu cận lâm sàng</a></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div> <!-- container-fluid -->
        </div>
        <!-- End Page-content -->
        <!-- Modal -->
        <div class="modal fade report-modal" id="reportModal" tabindex="-1" role="dialog" aria-labelledby="reportModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="reportModalLabel">Chọn ngày báo cáo</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form method="POST" action="{{ route('report.export.data') }}" enctype="multipart/form-data">

                        <div class="modal-body">
                            @csrf
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <label for="start_date">Từ ngày <span class="text-danger">*</span></label>
                                        <input id="start_date" name="start_date" type="date" class="form-control" required>
                                        {!! $errors->first('start_date', '<span class="error">:message</span>') !!}
                                    </div>
                                </div>
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <label for="end_date">Đến ngày <span class="text-danger">*</span></label>
                                        <input id="end_date" name="end_date" type="date" class="form-control" required>
                                        {!! $errors->first('end_date', '<span class="error">:message</span>') !!}
                                    </div>
                                </div>

                                <input type="hidden" class="input-report" name="report">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                            <button type="submit" class="btn btn-primary" value="report">Tạo báo cáo</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection
@section('js')
    <script>
        $(function () {
            $(".report-statistics").click(function (event) {
                event.preventDefault();

                var report = $(this).attr('report');
                console.log(report)
                $('.input-report').val(report);

                $(".report-modal").modal('show');
            })
        })
    </script>
@endsection