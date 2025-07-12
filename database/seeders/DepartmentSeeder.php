<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use App\Models\User;

class DepartmentSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        $admin = Role::find(1);

        $view_department = Permission::create(['name' => 'Danh sách phòng ban']);
        $create_department = Permission::create(['name' => 'Tạo mới phòng ban']);
        $edit_department = Permission::create(['name' => 'Chỉnh sửa phòng ban']);
        $delete_department = Permission::create(['name' => 'Xóa phòng ban']);

        $admin->givePermissionTo($view_department);
        $admin->givePermissionTo($create_department);
        $admin->givePermissionTo($edit_department);
        $admin->givePermissionTo($delete_department);
    }
}
