@csrf
<div class="row">
    <div class="col-sm-6">
        <div class="form-group">
            <label for="name">Tên dịch vụ khám <span class="text-danger">*</span></label>
            <input id="name" name="name" type="text" class="form-control" placeholder="Tên dịch vụ khám" value="{{ old('name', $data_edit->name ?? '') }}">
            {!! $errors->first('name', '<span class="error">:message</span>') !!}
        </div>

        <div class="form-group">
            <label for="type_id">Loại dịch vụ <span class="text-danger">*</span></label>
            <select class="form-control" name="type">
                @foreach ($types as $key => $type)
                    <option value="{{ $key }}" {{ isset($data_edit->type) && $data_edit->type == $key ? 'selected' : '' }}>{{ $type }}</option>
                @endforeach
            </select>
            {!! $errors->first('type', '<span class="error">:message</span>') !!}
        </div>
    </div>

    <div class="col-sm-6">
        <div class="form-group">
            <label for="price">Giá <span class="text-danger">*</span></label>
            <input id="price" name="price" type="number" class="form-control" placeholder="Giá" value="{{ old('price', $data_edit->price ?? '') }}">
            {!! $errors->first('price', '<span class="error">:message</span>') !!}
        </div>

        <div class="form-group">
            <label for="type_id">Phòng khám <span class="text-danger">*</span></label>
            <select class="form-control select2" name="service_rooms[]" multiple>
                @foreach ($consultingRooms as $key => $room)
                    <option value="{{ $room->id }}" {{ isset($arrayRooms) && in_array($room->id, $arrayRooms) ? 'selected' : '' }}>{{ $room->name }}</option>
                @endforeach
            </select>
            {!! $errors->first('service_rooms', '<span class="error">:message</span>') !!}
        </div>
    </div>
    <div class="col-sm-12" style="padding: 0px">
        <div class="card">
            <div class="card-body">
                <h4 class="card-title mb-3">Mô tả</h4>

                <textarea id="description" class="summernote mb-2" name="description">{{ isset($data_edit->description) ? $data_edit->description : '' }}</textarea>

                <div class="mt-3">
                    <button type="submit" class="btn btn-primary mr-1 waves-effect waves-light">Lưu lại</button>
                    <a href="{{ route('medical_services.index') }}" class="btn btn-secondary waves-effect">Quay lại</a>
                </div>
            </div>

        </div>
    </div>
</div>
