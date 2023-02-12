<?php

namespace App\Http\Controllers;

use App\Models\AccountType;
use App\Models\Branch;
use App\Models\Permission;
use App\Models\Role;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    public function index()
    {
        return [User::with("role", "branch")->latest()->get(), Permission::all(), Role::all()];
    }

    public function user()
    {
        $user = request()->user();
        $branch_id = $user->branch_id;
        $accountType = AccountType::where("name", "MEMBER DEPOSIT")->firstOrFail();
        $branch = Branch::where("id", $branch_id)->firstOrFail();
        return $branch->name;
        return request()->user();
    }

    public function user2()
    {
        $user = request()->user();
        $accountType = AccountType::where("name", "MEMBER DEPOSIT")->firstOrFail();
        $branch = Branch::where("id", "f892ca7b-b65a-4f00-80f8-a49629ae46a0")->firstOrFail();
        return $branch->id;
        return request()->user();
    }

    public function store()
    {
        $data = request()->all();

        User::create([
            "first_name" => $data['first_name'],
            "last_name" => $data['last_name'],
            "role_id" => $data['role_id'],
            "email" => $data['email'],
            "branch_id" => $data['branch_id'],
            "password" => Hash::make("password"),
        ]);


        return User::with("role", "branch")->latest()->get();
    }

    public function update($id)
    {
        $data = request()->all();
        $user = User::find($id);
        $user->update($data);
        return User::with("role", "branch")->latest()->get();
    }

    public function destroy($id)
    {
        $user = User::find($id);
        $user->delete();
        return User::with("role", "branch")->latest()->get();
    }
}