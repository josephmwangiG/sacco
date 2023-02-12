<?php

namespace database\seeders;

use App\Models\Permission;
use App\Models\Role;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class RoleSeeder extends Seeder
{

    public function run()
    {

        DB::table('roles')->delete();

        $admin = DB::table('roles')->insert([
            'name' => 'SuperAdmin',
            'organization_id' => 0,
            'display_name' => 'Admin',
            'description' => "site admin"
        ]);
    }
}
