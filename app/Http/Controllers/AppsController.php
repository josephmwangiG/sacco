<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class AppsController extends Controller
{
    public function inbox()
    {
        return inertia("Apps/Email/Inbox");
    }
    public function compose()
    {
        return inertia("Apps/Email/Compose");
    }
    public function todo()
    {
        return inertia("Apps/Todo");
    }
    public function chat()
    {
        return inertia("Apps/Chat");
    }
    public function productList()
    {
        return inertia("Apps/Ecommerce/ProductsList");
    }
    public function productDetails()
    {
        return inertia("Apps/Ecommerce/ProductDetails");
    }
    public function wishList()
    {
        return inertia("Apps/Ecommerce/Wishlist");
    }
    public function checkout()
    {
        return inertia("Apps/Ecommerce/Checkout");
    }
}
