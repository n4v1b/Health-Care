<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\User;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // Tạo admin
        User::create([
        	'code' => 'ADMIN',
        	'name' => 'Admin',
        	'email' => 'vikhangksst@gmail.com',
        	'gender' => 'Nam',
        	'password' => bcrypt('123123123'),
        	'birthday' => '2000-08-17',
        	'phone' => '0394121584',
        	'address' => 'Sóc Trăng - Cần Thơ',
        ]);
    }
}
