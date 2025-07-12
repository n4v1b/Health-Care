<link href="{{ asset('css/bootstrap.min.css') }}" id="bootstrap-style" rel="stylesheet" type="text/css">
<link href="{{ asset('css/app.min.css') }}" id="app-style" rel="stylesheet" type="text/css">

<div class="body">
    <table>
        <thead>
        <tr>
            <td colspan="5"></td>
        </tr>
        <tr>
            <th style="width: 50px;"></th>
            <th colspan="5" style="width: 100%"><h3 style="margin-left: 50px; font-family: 'Courier New', Courier, monospace; font-weight: bold">BỆNH VIỆN ĐA KHOA TIỀN HẢI</h3></th>
        </tr>
        <tr>
            <th style="width: 50px;"></th>
            <th colspan="5"><p style="margin-left: 50px; font-family: 'Courier New', Courier, monospace">Địa chỉ : Thôn Nam, Xã Tây Giang, Huyện Tiền Hải, Tỉnh Thái Bình</p></th>
        </tr>
        <tr>
            <th style="width: 50px;"></th>
            <th colspan="5"><p style="margin-left: 50px; font-family: 'Courier New', Courier, monospace">Điện thoại: 02273.823.373</p></th>
        </tr>
        <tr>
            <th style="width: 50px;"></th>
            <th colspan="5"><p style="margin-left: 50px; font-family: 'Courier New', Courier, monospace">Email: benhviendktienhai@gmail.com</p></th>
        </tr>
        </thead>
    </table>
</div>
<div class="row">
    <div class="col-md-12" style="text-align: center">
        <table>
            <thead>
            <tr>
                <th colspan="5" style="width: 100%; text-align: center; "><h3 style="font-family: 'Courier New', Courier, monospace; font-weight: bold"><b>BÁO CÁO DOANH THU BÁN THUỐC</b></h3></th>
            </tr>
            </thead>
        </table>
    </div>
    <div class="col-md-12" style="text-align: center">
        <table class="table" style="border: 1px solid #000000;">
            <thead style="border: 1px solid #000000;">
            <tr>
                <th></th>
                <th colspan="2"><span>Từ ngày: {{ $data['start_date'] }}</span></th>
                <th colspan="2"><span>Đến ngày: {{ $data['end_date'] }}</span></th>
            </tr>
            <tr>
                <td colspan="7"></td>
            </tr>
            <tr style="border: 1px solid">
                <th style="width: 30px; text-align: center; border: 1px solid #000000;"><b>STT</b></th>
                <th style="width: 200px; border: 1px solid #000000;"><b>Mã đơn thuốc</b></th>
                <th style="width: 150px; border: 1px solid #000000;"><b>Tên bệnh nhân</b></th>
                <th style="width: 150px; border: 1px solid #000000;"><b>Giá</b></th>
            </tr>
            @php ($stt = 1)
            @foreach ($prescriptions as $prescription)
                <tr style="border: 1px solid #000000;">
                    <td style="width: 20px; text-align: center;border: 1px solid #000000;">{{ $stt++ }}</td>
                    <td style="width: 150px; border: 1px solid #000000;">{{ $prescription->code }}</td>
                    <td style="width: 150px; border: 1px solid #000000;">{{ $prescription->patient->name }}</td>
                    <td style="width: 150px; border: 1px solid #000000;">{{ number_format($prescription->total_money, 0, ',', '.') }} vnđ</td>
                </tr>
            @endforeach
            <tr>
                <td colspan="5"></td>
            </tr>
            <tr style="border: 1px solid #000000;">
                <td colspan="2" style="text-align: center; width: 100%; border: 1px solid #000000;"><b>Tổng doanh thu </b></td>
                <td colspan="2" style="text-align: center; width: 100%; border: 1px solid #000000;"><b>{{ number_format($total_money, 0, ',', '.') }} vnđ</b></td>
            </tr>
            </thead>
        </table>
    </div>
</div>
