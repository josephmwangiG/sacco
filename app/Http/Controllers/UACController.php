<?php

namespace App\Http\Controllers;

use App\Mail\AddUser;
use App\Models\Permission;
use App\Models\Role;
use App\Models\RolePermission;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;

class UACController extends Controller
{
    public function getUsers()
    {
        $users = User::where("user_type", "!=", "member")
            ->where("organization_id", Auth::user()->organization->id)
            ->with("role")
            ->when(Request()->input('search'), function ($query, $search) {
                $query->where('first_name', "like", "%{$search}%")
                    ->orwhere('last_name', "like", "%{$search}%");
            })
            ->latest()
            ->paginate(10);
        $filters = Request()->only('search');

        $roles = Role::where("organization_id", Auth::user()->organization->id)
            ->get();

        return inertia("Components/uac/Users", compact("users", "roles", "filters"));
    }

    public function getRoles()
    {
        $filters = Request()->only('search');

        $roles = Role::where("organization_id", Auth::user()->organization->id)
            ->with("permissions")
            ->paginate(10);
        $permissions = Permission::latest()->get();

        return inertia("Components/uac/Roles", compact("roles", "filters", "permissions"));
    }

    public function storeUser()
    {
        $data = Request()->validate([
            "last_name" => "required",
            "first_name" => "required",
            "role_id" => "required",
            "email" => "required",
            "phone" => "",
        ]);

        $password = uniqid();

        User::create([
            "first_name" => $data['first_name'],
            "last_name" => $data['last_name'],
            "role_id" => $data['role_id'],
            "email" => $data['email'],
            "phone" => $data['phone'],
            "user_type" => "user",
            "branch_id" => Auth::user()->branch_id,
            "organization_id" => Auth::user()->organization_id,
            "password" => Hash::make($password),
        ]);

        $user = User::where('email', $data['email'])->first();

        $data['url'] = route('login');
        $data['email'] = $data['email'];
        $data['password'] = $password;

        Mail::to($user)->send(new AddUser($data));

        return back()->with('success', "User Added Successfully");
    }

    public function updateUser($id)
    {
        $data = Request()->validate([
            "last_name" => "required",
            "first_name" => "required",
            "role_id" => "required",
            "email" => "required",
            "phone" => "",
        ]);

        $user = User::find($id);
        $user->update($data);

        return back()->with('success', "User Updated Successfully");
    }

    public function storeRole()
    {
        $data = Request()->validate([
            "permissions" => "required",
            "name" => "required",
        ]);

        $data['organization_id'] =  Auth::user()->organization->id;
        $data['display_name'] =  $data['name'];

        $role = Role::create($data);

        foreach ($data['permissions'] as $permission) {
            RolePermission::create([
                "role_id" =>  $role->id,
                "permission_id" => $permission
            ]);
        }

        return back()->with('success', "Role Added Successfully");
    }

    public function updateRole($id)
    {
        $data = Request()->validate([
            "permissions" => "required",
            "name" => "required",
        ]);

        $role = Role::find($id);
        $role->update($data);

        RolePermission::destroy($role->permmissions);

        foreach ($data['permissions'] as $permission) {
            RolePermission::create([
                "role_id" =>  $role->id,
                "permission_id" => $permission
            ]);
        }

        return back()->with('success', "Role Updated Successfully");
    }
}
