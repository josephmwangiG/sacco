<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ToolsController extends Controller
{
    public function calculator()
    {
        return inertia("Components/Tools/Calculator");
    }
}
