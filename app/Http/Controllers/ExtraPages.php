<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ExtraPages extends Controller
{
    public function timeline()
    {
        return inertia("Extra/Timeline");
    }
    public function invoice()
    {
        return inertia("Extra/Invoice");
    }
    public function blank()
    {
        return inertia("Extra/Blank");
    }
    public function error404()
    {
        return inertia("Extra/Error404");
    }
    public function error500()
    {
        return inertia("Extra/Error500");
    }
    public function pricing()
    {
        return inertia("Extra/Pricing");
    }
    public function pricing1()
    {
        return inertia("Extra/Pricing1");
    }
    public function maintenance()
    {
        return inertia("Extra/Maintenance");
    }
    public function comingSoon()
    {
        return inertia("Extra/ComingSoon");
    }
    public function faq()
    {
        return inertia("Extra/Faq");
    }
}
