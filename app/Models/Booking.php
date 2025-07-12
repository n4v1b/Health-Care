<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;

class Booking extends Model
{
    use HasFactory;

    protected $table = 'bookings';

    protected $fillable = [
        'doctor_id',
        'patient_id',
        'medical_service_id',
        'date_booking',
        'time_booking',
        'note',
        'status',
        'created_at',
        'updated_at'
    ];
    public $timestamps = true;

    public function doctor()
    {
        return $this->belongsTo(User::class, 'doctor_id', 'id');
    }

    public function patient()
    {
        return $this->belongsTo(Patient::class, 'patient_id', 'id');
    }

    public function service()
    {
        return $this->belongsTo(MedicalService::class, 'medical_service_id', 'id');
    }

    const STATUS = [
        0 => 'Chờ xác nhận',
        1 => 'Đã xác nhận',
        2 => 'Đã khám',
        3 => 'Hủy khám'
    ];

    const CLASS_STATUS = [
        0 => 'btn-secondary',
        1 => 'btn-primary ',
        2 => 'btn-success',
        3 => 'btn-danger',
        4 => 'btn-warning',
    ];

    /**
     * @param $request
     * @param string $id
     * @return mixed
     */
    public function createOrUpdate($request , $id ='')
    {
        $params = $request->except(['_token', 'images', 'date_booking']);

        $admin = Auth::user();
        if($id == '') {
            $params['patient_id'] = $admin->patient->id;
        }

        $params['date_booking'] = Carbon::parse($request->date_booking)->format('Y-m-d');

        if ($id) {
            return $this->find($id)->update($params);
        }
        return $this->create($params);
    }
}
