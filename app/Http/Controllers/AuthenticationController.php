<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class AuthenticationController extends Controller
{
    public function login()
    {
        return inertia("Authentication/Login");
    }
    public function register()
    {
        return inertia("Authentication/Register");
    }
    public function confirm()
    {
        return inertia("Authentication/Confirm");
    }
    public function recover()
    {
        return inertia("Authentication/Recover");
    }
    public function lock()
    {
        return inertia("Authentication/Lock");
    }
}
