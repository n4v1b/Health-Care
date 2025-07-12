@csrf
<div class="row">
    <div class="form-group col-sm-6">
        <label for="user_id">Bác sĩ <span class="text-danger">*</span></label>
        <select class="form-control select2 select_doctor" name="doctor_id" required>
            <option value="">Chọn bác sĩ</option>
            @foreach ($users as $user)
                <option value="{{ $user->id }}" {{ old('doctor_id', isset($data_edit) ? $data_edit->doctor_id : '') == $user->id ? 'selected' : '' }}>{{ $user->name }}</option>
            @endforeach
        </select>
        {!! $errors->first('user_id', '<span class="error">:message</span>') !!}
    </div>
    <div class="form-group col-sm-6">
        <label for="start_date">Ngày hẹn <span class="text-danger">*</span></label>
        <div class="docs-datepicker">
            <div class="input-group">
                <input type="text" class="form-control docs-date" name="date_booking" placeholder="Chọn ngày" autocomplete="off" value="{{ old('date_booking', isset($data_edit->date_booking) ? date('d-m-Y', strtotime($data_edit->date_booking)) : '') }}" required>
                <div class="input-group-append">
                    <button type="button" class="btn btn-outline-secondary docs-datepicker-trigger" disabled="">
                        <i class="fa fa-calendar" aria-hidden="true"></i>
                    </button>
                </div>
            </div>
            <div class="docs-datepicker-container"></div>
        </div>
        {!! $errors->first('date_booking', '<span class="error">:message</span>') !!}
    </div>

    <div class="form-group col-sm-6">
        <label for="medical_service_id">Dịch vụ khám <span class="text-danger">*</span></label>
        <select class="form-control select2" id="medical_service_id" name="medical_service_id">
            <option value="">Dịch vụ khám</option>
            @foreach ($medical_services as $medical_service)
                <option value="{{ $medical_service->id }}" {{ old('medical_service_id', isset($data_edit) ? $data_edit->medical_service_id : '')  == $medical_service->id ? 'selected' : '' }} price="{{ number_format($medical_service->price, 0, ',', '.') }} vnđ">{{ $medical_service->name }}</option>
            @endforeach
        </select>
        {!! $errors->first('medical_service_id', '<span class="error">:message</span>') !!}
        <p style="margin-top: 15px"> Giá dịch vụ : <span class="text-price">{{ isset($data_edit) && isset($data_edit->service) ?  number_format($data_edit->service->price, 0, ',', '.') . ' vnđ' : '' }}</span></p>
    </div>
    <div class="form-group col-sm-6">
        <label for="time_booking">Giờ hẹn <span class="text-danger">*</span></label>
        <select class="form-control select2" id="time_booking" name="time_booking">
            <option value="">Chọn giờ hẹn khám</option>
            @if (isset($data_edit) && $list_times)
                @foreach($list_times as $time)
                    <option value="{{ $time->time_schedule }}" {{ old('time_booking', isset($data_edit) ? $data_edit->time_booking : '')  == $time->time_schedule ? 'selected' : '' }}>{{ $time->time_schedule }}</option>
                @endforeach
            @endif
        </select>
        {!! $errors->first('time_booking', '<span class="error">:message</span>') !!}
    </div>
    @can('Cập nhật trạng thái lịch khám hẹn trước')
    <div class="form-group col-sm-6">
        <label for="time_booking">Trạng thái khám <span class="text-danger">*</span></label>
        <select name="status" id="" class="form-control">
            @foreach($status as $key => $item)
                <option value="{{ $key }}" {{ old('status', isset($data_edit) ? $data_edit->status : '')  == $key ? 'selected' : '' }}>{{ $item }}</option>
            @endforeach
        </select>
    </div>
    @endcan
</div>

<button type="submit" class="btn btn-primary mr-1 waves-effect waves-light" value="create">Lưu lại</button>
<a href="{{ route('booking.index') }}" class="btn btn-secondary waves-effect">Quay lại</a>