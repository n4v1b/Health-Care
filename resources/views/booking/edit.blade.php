@extends('layouts.default')

@section('title') Cập nhật lịch hẹn @endsection

@section('content')
    <div class="main-content">

        <div class="page-content">
            <div class="container-fluid">

                <!-- start page title -->
                <div class="row">
                    <div class="col-12">
                        <div class="page-title-box d-flex align-items-center justify-content-between">
                            <h4 class="mb-0 font-size-18">Cập nhật lịch hẹn</h4>

                            <div class="page-title-right">
                                <ol class="breadcrumb m-0">
                                    <li class="breadcrumb-item"><a href="{{ route('booking.index') }}" title="Quản lý lịch hẹn" data-toggle="tooltip" data-placement="top">Quản lý lịch hẹn</a></li>
                                    <li class="breadcrumb-item active">Cập nhật lịch hẹn</li>
                                </ol>
                            </div>

                        </div>
                    </div>
                </div>
                <!-- end page title -->

                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">

                                <form method="POST" action="" enctype="multipart/form-data">
                                    @include('booking._form')
                                </form>

                            </div>
                        </div>
                    </div>
                </div>
                <!-- end row -->

            </div> <!-- container-fluid -->
        </div>
        <!-- End Page-content -->


      
    </div>
@endsection

@push('js')
    <!-- select 2 plugin -->
    <script src="{{ asset('libs\select2\js\select2.min.js') }}"></script>

    <!-- init js -->
    <script src="{{ asset('js\pages\ecommerce-select2.init.js') }}"></script>

    <!-- datepicker -->
    <script src="{{ asset('libs\bootstrap-datepicker\js\bootstrap-datepicker.min.js') }}"></script>
    <script src="{{ asset('libs\bootstrap-colorpicker\js\bootstrap-colorpicker.min.js') }}"></script>
    <script src="{{ asset('libs\bootstrap-timepicker\js\bootstrap-timepicker.min.js') }}"></script>
    <script src="{{ asset('libs\bootstrap-touchspin\jquery.bootstrap-touchspin.min.js') }}"></script>
    <script src="{{ asset('libs\bootstrap-maxlength\bootstrap-maxlength.min.js') }}"></script>
    <script src="{{ asset('libs\@chenfengyuan\datepicker\datepicker.min.js') }}"></script>
    <!-- form advanced init -->
    <script src="{{ asset('js\pages\form-advanced.init.js') }}"></script>
    <script type="text/javascript">

        $('.docs-date').datepicker({
            format: 'dd-mm-yyyy',
        });
        $(function () {
            var urlGetTimes = '{{ route("load.list.times") }}';
            var urlGetService = '{{ route("load.list.service") }}';

            $('#medical_service_id').change(function () {
                var price = $("option:selected", this).attr("price");
                $('.text-price').text(price);
            })

            $('.select_doctor').change(function () {

                var doctor_id = $(this).val();
                var date_booking = $('.docs-date').val();

                if (date_booking == '') {
                    Command: toastr["error"]('Vui lòng chọn ngày hẹn')
                }

                $.ajax({
                    url: urlGetService,
                    type: 'GET',
                    dataType: 'json',
                    data : {
                        doctor_id : doctor_id,
                        date_booking : date_booking
                    }
                }).done(function (result) {
                    if (result.code == 404) {
                        Command: toastr["error"](result.message)
                    }

                    var html = '<option value="">Chọn dịch vụ</option>';
                    var htmlTime = '<option value="">Chọn giờ hẹn</option>';
                    if (result.code == 200) {
                        $.each(result.services, function(index, service) {
                            html += '<option value="'+ service.id +'">'+ service.name +'</option>'
                        });

                        $.each(result.list_times, function(index, list_time) {
                            htmlTime += '<option value="'+ list_time.time_schedule +'">'+ list_time.time_schedule +'</option>'
                        });
                    }
                    $('#time_booking').html(htmlTime);
                    $('#medical_service_id').html(html);
                })
            })

            $('.docs-date').change(function () {
                var date_booking = $(this).val();
                var doctor_id = $('.select_doctor').val();


                if (doctor_id == '') {
                    Command: toastr["error"]('Vui lòng chọn bác sĩ')
                    return false
                }

                if (date_booking == '') {
                    Command: toastr["error"]('Vui lòng chọn ngày hẹn');
                    return false
                }

                $.ajax({
                    url: urlGetTimes,
                    type: 'GET',
                    dataType: 'json',
                    data : {
                        doctor_id : doctor_id,
                        date_booking : date_booking,
                    }
                }).done(function (result) {

                    if (result.code == 404) {
                        Command: toastr["error"](result.message)
                    }

                    var html = '<option value="">Chọn giờ hẹn</option>';
                    if (result.code == 200) {
                        $.each(result.list_times, function(index, list_time) {
                            html += '<option value="'+ list_time.time_schedule +'">'+ list_time.time_schedule +'</option>'
                        });
                    }
                    $('#time_booking').html(html);
                })
            })
        })
    </script>
@endpush

@push('css')
    <!-- datepicker css -->
    <link href="{{ asset('libs\bootstrap-datepicker\css\bootstrap-datepicker.min.css') }}" rel="stylesheet" type="text/css">
    <link href="{{ asset('libs\bootstrap-colorpicker\css\bootstrap-colorpicker.min.css') }}" rel="stylesheet" type="text/css">
    <link href="{{ asset('libs\bootstrap-timepicker\css\bootstrap-timepicker.min.css') }}" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="{{ asset('libs\@chenfengyuan\datepicker\datepicker.min.css') }}">
    <!-- select2 css -->
    <link href="{{ asset('libs\select2\css\select2.min.css') }}" rel="stylesheet" type="text/css">
@endpush