<div class="row content-role default">
    @foreach($times as $time)
        <div class="col-md-2 role-item">
            <div class="icheck-primary d-inline">
                <input type="checkbox" class="{{safeTitle($time)}}"
                       value="{{$time}}" name="list_times[]" id="checkbox{{ safeTitle($time) }}">
                <label for="checkbox{{ safeTitle($time) }}">
                    {{$time}}
                </label>
            </div>
        </div>
    @endforeach
</div>