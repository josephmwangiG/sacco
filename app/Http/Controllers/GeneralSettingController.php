<?php

namespace App\Http\Controllers;

use App\Models\GeneralSetting;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class GeneralSettingController extends Controller
{
    public function index()
    {
        return inertia("Settings/Profile");
    }

    public function edit()
    {
        $organization = Auth::user()->organization;
        return inertia("Settings/Edit", compact('organization'));
    }

    public function changePassword()
    {
        $user = User::find(Auth::user()->id);
        $data = Request()->validate([
            'password' => ['required', 'confirmed'],
            'password_confirmation' => ['required'],
            'old_password' => [function ($attribute, $value, $fail) use ($user) {
                if (!Hash::check($value, $user->password)) {
                    $fail("Incorrect Password");
                }
            }]
        ]);

        $user->update(["password" => Hash::make($data['password'])]);

        return back()->with('success', "Password Changed");
    }
}
