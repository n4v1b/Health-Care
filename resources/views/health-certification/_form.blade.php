<div class="card">
    <div class="card-body">
        <h4 class="card-title">Thông tin cơ bản</h4>
        <p class="card-title-desc">Điền tất cả thông tin bên dưới</p>
        @csrf
        <div class="row">
            <div class="col-sm-12">
                {{--<div class="form-group">--}}
                    {{--<label for="title">Tiêu đề <span class="text-danger">*</span></label>--}}
                    {{--<input id="title" name="title" type="text" class="form-control" placeholder="Tiêu đề" value="{{ old('title', $data_edit->title ?? '') }}">--}}
                    {{--{!! $errors->first('title', '<span class="error">:message</span>') !!}--}}
                {{--</div>--}}
                <div class="form-group">
                    <label for="medical_service_id">Dịch vụ khám <span class="text-danger">*</span></label>
                    <select class="form-control select2" id="medical_service_id" name="medical_service_id">
                        <option value="">Dịch vụ khám</option>
                        @foreach ($medical_services as $medical_service)
                            <option value="{{ $medical_service->id }}" {{ old('medical_service_id', isset($data_edit) ? $data_edit->medical_service_id : '')  == $medical_service->id ? 'selected' : '' }} price="{{ number_format($medical_service->price, 0, ',', '.') }} vnđ">{{ $medical_service->name }}</option>
                        @endforeach
                    </select>
                    {!! $errors->first('medical_service_id', '<span class="error">:message</span>') !!}
                    <p style="margin-top: 15px"> Giá dịch vụ : <span class="text-price">{{ isset($data_edit) && isset($data_edit->medicalService) ?  number_format($data_edit->medicalService->price, 0, ',', '.') . ' vnđ' : '' }}</span></p>
                </div>
                <div class="form-group">
                    <label for="consulting_room_id">Phòng khám <span class="text-danger">*</span></label>
                    <select class="form-control select2" id="consulting_room_id" name="consulting_room_id">
                        <option value="">Chọn phòng khám</option>
                        @foreach ($consulting_rooms as $consulting_room)
                            <option value="{{ $consulting_room->id }}" {{ old('consulting_room_id', isset($data_edit) ? $data_edit->consulting_room_id : '') == $consulting_room->id ? 'selected' : '' }}
                            address="{{ $consulting_room->address }}">{{ $consulting_room->name }}</option>
                        @endforeach
                    </select>
                    <p style="margin-top: 15px"> Địa chỉ : <span class="text-address">{{ isset($data_edit) ? $data_edit->consultingRoom->address : '' }}</span></p>
                    {!! $errors->first('consulting_room_id', '<span class="error">:message</span>') !!}
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
                                    <option value="{{ $patient->id }}" {{ old('patient_id', isset($data_edit) ? $data_edit->patient_id : '') == $patient->id ? 'selected' : '' }}>{{ $patient->name }}</option>
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

                    {{--<div class="col-sm-12">--}}
                        {{--<div class="form-group">--}}
                            {{--<label for="total_money">Giá <span class="text-danger">*</span></label>--}}
                            {{--<input id="total_money" name="total_money" type="number" class="form-control" placeholder="Giá" value="{{ old('total_money', $data_edit->total_money ?? '') }}">--}}
                            {{--{!! $errors->first('total_money', '<span class="error">:message</span>') !!}--}}
                        {{--</div>--}}
                    {{--</div>--}}
                    <div class="col-sm-12">
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
                </div>
            </div>

            <div class="col-sm-6">

                <div class="form-group">
                    <label for="user_id">Bác sĩ </label>
                    <select class="form-control select2" name="user_id">
                        @if ($admin->hasRole(['Admin']))
                        <option value="">Chọn bác sĩ</option>
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

                <div class="col-sm-12">
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
            </div>
        </div>




        <button type="submit" class="btn btn-primary mr-1 waves-effect waves-light">Lưu lại</button>
        <a href="{{ route('health_certifications.index') }}" class="btn btn-secondary waves-effect">Quay lại</a>
    </div>
</div>