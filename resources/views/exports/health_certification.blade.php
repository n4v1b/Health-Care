<link href="{{ asset('css/bootstrap.min.css') }}" id="bootstrap-style" rel="stylesheet" type="text/css">
<link href="{{ asset('css/app.min.css') }}" id="app-style" rel="stylesheet" type="text/css">

<div class="body">
    <table>
        <thead>
            <tr>
                <td colspan="8"></td>
            </tr>
            <tr>
                <th style="width: 50px;"></th>
                <th colspan="7" style="width: 100%"><h3 style="margin-left: 50px; font-family: 'Courier New', Courier, monospace; font-weight: bold">BỆNH VIỆN ĐA KHOA TIỀN HẢI</h3></th>
            </tr>
            <tr>
                <th style="width: 50px;"></th>
                <th colspan="7"><p style="margin-left: 50px; font-family: 'Courier New', Courier, monospace">Địa chỉ : Thôn Nam, Xã Tây Giang, Huyện Tiền Hải, Tỉnh Thái Bình</p></th>
            </tr>
            <tr>
                <th style="width: 50px;"></th>
                <th colspan="7"><p style="margin-left: 50px; font-family: 'Courier New', Courier, monospace">Điện thoại: 02273.823.373</p></th>
            </tr>
            <tr>
                <th style="width: 50px;"></th>
                <th colspan="7"><p style="margin-left: 50px; font-family: 'Courier New', Courier, monospace">Email: benhviendktienhai@gmail.com</p></th>
            </tr>
        </thead>
    </table>
</div>
<div class="row">
    <div class="col-md-12" style="text-align: center">
        <table>
            <thead>
                <tr>
                    <th colspan="7" style="width: 100%; text-align: center; "><h3 style="font-family: 'Courier New', Courier, monospace; font-weight: bold"><b>BÁO CÁO DOANH THU KHÁM BỆNH</b></h3></th>
                </tr>
            </thead>
        </table>
    </div>
    <div class="col-md-12" style="text-align: center">
        <table class="table" style="border: 1px solid #000000;">
            <thead style="border: 1px solid #000000;">
                <tr>
                    <th style="width: 50px;"></th>
                    <th colspan="3" style="text-align: right"><span>Từ ngày: {{ $data['start_date'] }}</span></th>
                    <th colspan="3"><span>Đến ngày: {{ $data['end_date'] }}</span></th>
                </tr>
                <tr>
                    <td colspan="7"></td>
                </tr>
                <tr style="border: 1px solid">
                    <th style="width: 30px; text-align: center; border: 1px solid #000000;"><b>STT</b></th>
                    <th style="width: 200px; border: 1px solid #000000;"><b>Mã giấy khám bệnh</b></th>
                    <th style="width: 150px; border: 1px solid #000000;"><b>Tên bệnh nhân</b></th>
                    <th style="width: 150px; border: 1px solid #000000;"><b>Tên dịch vụ</b></th>
                    <th style="width: 300px; border: 1px solid #000000;"><b>Kết quả khám</b></th>
                    <th style="width: 150px; border: 1px solid #000000;"><b>Ngày khám</b></th>
                    <th style="width: 150px; border: 1px solid #000000;"><b>Giá</b></th>
                </tr>
                @php ($stt = 1)
                @foreach ($health_certifications as $health_certification)
                    <tr style="border: 1px solid #000000;">
                        <td style="width: 30px; text-align: center;border: 1px solid #000000;">{{ $stt++ }}</td>
                        <td style="width: 150px; border: 1px solid #000000;">{{ $health_certification->code }}</td>
                        <td style="width: 150px; border: 1px solid #000000;">{{ $health_certification->patient->name }}</td>
                        <td style="width: 150px; border: 1px solid #000000;">{{ isset($health_certification->medicalService) ? $health_certification->medicalService->name : '' }}</td>
                        <td style="width: 300px; border: 1px solid #000000;">{!! $health_certification->conclude !!}</td>
                        <td style="width: 150px; border: 1px solid #000000;">{{ date("d-m-Y", strtotime($health_certification->created_at)) }}</td>
                        <td style="width: 150px; border: 1px solid #000000;">{{ number_format($health_certification->total_money, 0, ',', '.') }} vnđ</td>
                    </tr>
                @endforeach
                <tr>
                    <td colspan="7"></td>
                </tr>
                <tr style="border: 1px solid #000000;">
                    <td colspan="5" style="text-align: center; width: 100%; border: 1px solid #000000;"><b>Tổng doanh thu </b></td>
                    <td colspan="2" style="text-align: center; width: 100%; border: 1px solid #000000;"><b>{{ number_format($total_money, 0, ',', '.') }} vnđ</b></td>
                </tr>
            </thead>
        </table>
    </div>
</div>
