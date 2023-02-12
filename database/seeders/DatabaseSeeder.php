<?php

use database\seeders\PermissionSeeder;
use database\seeders\RoleSeeder;
use database\seeders\UsersTableSeeder;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;


class DatabaseSeeder extends Seeder
{

    protected $tables = [];

    protected $seeders = [
        'database\seeders\PermissionSeeder'
    ];

    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $this->call([
            UsersTableSeeder::class,
            PermissionSeeder::class,
            RoleSeeder::class,
        ]);
    }

    /**
     * Clean out the database for a new seed generation
     */
    private function cleanDatabase()
    {
        foreach ($this->tables as $table) {
            DB::statement('TRUNCATE TABLE ' . $table . ' CASCADE;');
        }
    }
}
