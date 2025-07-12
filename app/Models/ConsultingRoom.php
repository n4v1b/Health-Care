<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ConsultingRoom extends Model
{
    use HasFactory;

    protected $fillable = [
    	'code',
    	'name',
    	'address',
    ];

    public function healthCertifications()
    {
        return $this->hasMany(HealthCertification::class);
    }
}
