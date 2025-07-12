<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MedicalService extends Model
{
    use HasFactory;

    protected $fillable = [
    	'code',
    	'name',
    	'price',
    	'type',
    	'description',
    ];

    const TYPES = [
        1 => 'Loại thường',
        2 => 'Loại cận lâm sàng'
    ];

    public function serviceVouchers()
    {
        return $this->hasMany(ServiceVoucher::class);
    }

    public function serviceRooms()
    {
        return $this->belongsToMany(ConsultingRoom::class, 'service_rooms', 'medical_service_id', 'consulting_room_id');
    }
}
