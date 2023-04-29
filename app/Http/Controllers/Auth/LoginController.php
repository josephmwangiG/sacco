<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

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

    public function logout()
    {
        Auth::logout();
        return redirect()->route('login');
    }
}
