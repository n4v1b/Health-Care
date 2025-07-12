<div class="card">
    <div class="card-body">

        <h4 class="card-title">Thông tin cơ bản</h4>
        <p class="card-title-desc">Điền tất cả thông tin bên dưới</p>
        @csrf
        <div class="row">
            <div class="col-sm-12">
                <div class="form-group">
                    <label for="medical_service_id">Giấy khám bệnh <span class="text-danger">*</span></label>
                    <select class="form-control select2" id="health_certification_id" name="health_certification_id">
                        <option value="">Chọn giấy khám bệnh</option>
                        @foreach ($health_certifications as $health_certification)
                            <option value="{{ $health_certification->id }}" {{ isset($data_edit->health_certification_id) && $data_edit->health_certification_id == $health_certification->id ? 'selected' : '' }}>{{ $health_certification->code }}</option>
                        @endforeach
                    </select>
                    {!! $errors->first('health_certification_id', '<span class="error">:message</span>') !!}
                </div>
            </div>
            <div class="col-sm-6">
                <div class="row">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label for="patient_id">Tên bệnh nhân <span class="text-danger">*</span></label>
                            <select class="form-control select2" name="patient_id" onchange="getInsuranceCard($(this).val())">
                                <option value="">Chọn bệnh nhân</option>
                                @foreach ($patients as $patient)
                                    <option value="{{ $patient->id }}" {{ isset($data_edit->patient_id) && $data_edit->patient_id == $patient->id ? 'selected' : '' }}>{{ $patient->name }}</option>
                                @endforeach
                            </select>
                            {!! $errors->first('patient_id', '<span class="error">:message</span>') !!}
                        </div>

                    </div>

                    <div class="col-sm-6">
                        <label for="patient_id" class="mt-2">Thẻ BHYT</label>
                        <div class="custom-control custom-checkbox  custom-checkbox-danger mb-3">
                            <input type="checkbox" class="custom-control-input" id="check_insurance_card" disabled {{ isset($data_edit->patient->healthInsuranceCard) && $data_edit->patient->healthInsuranceCard ? 'checked' : '' }}>
                            <input type="checkbox" hidden id="is_health_insurance_card" name="is_health_insurance_card" {{ isset($data_edit->patient->healthInsuranceCard) && $data_edit->patient->healthInsuranceCard ? 'checked' : '' }}>
                            <label class="custom-control-label" for="check_insurance_card"></label>
                        </div>
                    </div>

                </div>
                <div class="form-group">
                    <label for="start_date">Ngày đăng ký <span class="text-danger">*</span></label>
                    <div class="docs-datepicker">
                        <div class="input-group">
                            <input type="text" class="form-control docs-date" name="start_date" placeholder="Chọn ngày" autocomplete="off" value="{{ old('start_date', isset($data_edit->start_date) ? date('d-m-Y', strtotime($data_edit->start_date)) : '') }}">
                            <div class="input-group-append">
                                <button type="button" class="btn btn-outline-secondary docs-datepicker-trigger" disabled="">
                                    <i class="fa fa-calendar" aria-hidden="true"></i>
                                </button>
                            </div>
                        </div>
                        <div class="docs-datepicker-container"></div>
                    </div>
                    {!! $errors->first('start_date', '<span class="error">:message</span>') !!}
                </div>
            </div>

            <div class="col-sm-6">
                <div class="form-group">
                    <label for="user_id">Chuyên viên <span class="text-danger">*</span></label>
                    <select class="form-control select2" name="user_id">
                        @if ($admin->hasRole(['Admin']))
                            <option value="">Chuyên viên</option>
                        @endif
                        @if ($admin->hasRole(['Admin']))
                            @foreach ($users as $user)
                                <option value="{{ $user->id }}" {{ old('user_id', isset($data_edit) ? $data_edit->user_id : '') == $user->id ? 'selected' : '' }}>{{ $user->name }}</option>
                            @endforeach
                        @else
                            @foreach ($users as $user)
                                @if ($admin->id == $user->id)
                                    <option value="{{ $user->id }}" {{ old('user_id', isset($admin) ? $admin->id : '') == $user->id ? 'selected' : '' }}>{{ $user->name }}</option>
                                @endif
                            @endforeach
                        @endif
                    </select>
                    {!! $errors->first('user_id', '<span class="error">:message</span>') !!}
                </div>
                <div class="form-group">
                    <label for="end_date">Thời gian khám thực tế  <span class="text-danger">*</span></label>
                    <div class="docs-datepicker">
                        <div class="input-group">
                            <input type="text" class="form-control docs-date" name="end_date" placeholder="Chọn ngày" autocomplete="off" value="{{ old('end_date', isset($data_edit->end_date) ? date('d-m-Y', strtotime($data_edit->end_date)) : '') }}">
                            <div class="input-group-append">
                                <button type="button" class="btn btn-outline-secondary docs-datepicker-trigger" disabled="">
                                    <i class="fa fa-calendar" aria-hidden="true"></i>
                                </button>
                            </div>
                        </div>
                        <div class="docs-datepicker-container"></div>
                    </div>
                    {!! $errors->first('end_date', '<span class="error">:message</span>') !!}
                </div>
            </div>

            <div class="col-sm-12">
                <div class="form-group">
                    <label for="medical_service_id">Dịch vụ cận lâm sàng <span class="text-danger">*</span></label>
                    <select class="form-control select2" id="medical_service_id" name="medical_service_id">
                        <option value="">Chọn dịch vụ cận lâm sàng</option>
                        @foreach ($medical_services as $medical_service)
                            <option value="{{ $medical_service->id }}" {{ isset($data_edit->medical_service_id) && $data_edit->medical_service_id == $medical_service->id ? 'selected' : '' }} price="{{ number_format($medical_service->price, 0, ',', '.') }} vnđ">{{ $medical_service->name }}</option>
                        @endforeach
                    </select>
                    {!! $errors->first('medical_service_id', '<span class="error">:message</span>') !!}
                    <p style="margin-top: 15px"> Giá dịch vụ : <span class="text-price">{{ isset($data_edit) ? number_format($data_edit->medicalService->price, 0, ',', '.') . ' vnđ' : '' }}</span></p>
                </div>
            </div>
        </div>
    </div>
</div>

@if (isset($data_edit) && $data_edit->serviceVoucherDetails->count())
    <div class="card">
        <div class="card-body">
            <h4 class="card-title mb-3">Kết quả</h4>

            <div class="row">
                <div class="col-sm-12">
                    <label>Chi tiết khám :</label>
                </div>

                <div class="col-sm-12">
                    <div class="table-responsive">
                        <table class="table table-centered table-nowrap">
                            <thead class="thead-light">
                                <tr>
                                    <th class="text-center" width="70px">STT</th>
                                    <th>Ngày khám</th>
                                    <th>Kết quả</th>
                                    <th>File Kết quả</th>
                                    <th width="100px">Thao tác</th>
                                </tr>
                            </thead>
                            <tbody>
                                @php ($stt = 1)
                                @foreach ($data_edit->serviceVoucherDetails as $service_voucher_detail)
                                    <tr>
                                        <td class="text-center">{{ $stt++ }}</td>
                                        <td>{{ date("d-m-Y", strtotime($service_voucher_detail->date)) }}</td>
                                        <td>
                                            {!! $service_voucher_detail->result !!}
                                        </td>
                                        <td>
                                            @if ($service_voucher_detail->result_file)
                                                <a href="{{ asset('/uploads/result_file/'. $service_voucher_detail->result_file) }}" target="_blank" download>Link File</a>
                                            @endif
                                        </td>
                                        <td class="text-center">
                                            <ul class="list-inline font-size-20 contact-links mb-0">
                                                    <li class="list-inline-item px">
                                                        <a href="{{ route('service_voucher_details.edit', $service_voucher_detail->id) }}" data-toggle="tooltip" data-placement="top" title="Sửa"><i class="mdi mdi-pencil text-success"></i></a>
                                                    </li>
                                                    
                                                    <li class="list-inline-item px">
                                                        <a href="{{ route('service_voucher_details.delete', $service_voucher_detail->id) }}" data-toggle="tooltip" data-placement="top" title="Xóa"><i class="mdi mdi-trash-can text-danger"></i></a>
                                                    </li>

                                            </ul>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

    </div>
@endif

<div class="card">
    <div class="card-body">
        <button type="submit" class="btn btn-primary mr-1 waves-effect waves-light">Lưu lại</button>
        <a href="{{ route('service_vouchers.index') }}" class="btn btn-secondary waves-effect">Quay lại</a>
    </div>
</div>