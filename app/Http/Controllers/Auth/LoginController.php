<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Mail\ResetPassword;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;

class LoginController extends Controller
{

    protected $redirectTo = '/';

    public function __construct()
    {
        $this->middleware('guest')->except('logout');
    }

    public function login()
    {
        return inertia('Auth/Login');
    }

    public function authenticate(Request $request)
    {

        $credentials = $request->validate([
            'email' => ['required', 'email', 'exists:users'],
            'password' => ['required']
        ]);

        if (Auth::attempt($credentials)) {
            // Authentication passed...
            if (Auth::user()->role_id == 1) {
                return redirect()->intended('/s-admin/dashboard')->with('success', "Login Successful");
            } else if (Auth::user()->role_id == 0) {
                return redirect()->intended('/u/dashboard')->with('success', "Login Successful");
            } else {
                return redirect()->intended('/')->with('success', "Login Successful");
            }
        } else {
            return redirect()->back()->with('danger', "Invalid Credentials");
        }
    }


    public function resetPassword()
    {
        return inertia('Auth/Recover');
    }


    public function updatePassword()
    {
        $data = request()->validate([
            "email" => "required|email|exists:users"
        ]);

        $user = User::where('email', $data['email'])->first();

        $data['url'] = route('change-password', ['token' => Crypt::encrypt($data['email'])]);

        Mail::to($user)->send(new ResetPassword($data));

        $email = $data['email'];

        return inertia('Auth/Confirm', compact('email'));
    }


    public function changePassword($token)
    {
        return inertia('Auth/ChangePassword', compact('token'));
    }

    public function savePassword()
    {
        $data = request()->validate([
            "password" => "required",
            "confirm_password" => "required|same:password",
            "token" => "required",
        ]);

        $user = User::where('email', Crypt::decrypt($data['token']))->first();

        // Change user password

        $user->password = Hash::make($data['password']);
        $user->save();

        return redirect()->route('login')->with('success', "Password Updated");
    }

    public function logout()
    {
        Auth::logout();
        return redirect()->route('login');
    }
}
