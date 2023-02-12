<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ComponentsController extends Controller
{
    public function dripicons()
    {
        return inertia("Components/Icons/Dripicons");
    }
    public function remixicon()
    {
        return inertia("Components/Icons/Remixicon");
    }
    public function line()
    {
        return inertia("Components/Icons/Line");
    }
    public function unicons()
    {
        return inertia("Components/Icons/Unicons");
    }
    public function fontawesome()
    {
        return inertia("Components/Icons/Fontawesome");
    }
    public function data()
    {
        return inertia("Components/Tables/Data");
    }
    public function editable()
    {
        return inertia("Components/Tables/Editable");
    }
    public function basic()
    {
        return inertia("Components/Tables/Basic");
    }
    public function elements()
    {
        return inertia("Components/Forms/Elements");
    }
    public function validation()
    {
        return inertia("Components/Forms/Validation");
    }
    public function switch()
    {
        return inertia("Components/Forms/Switch");
    }
    public function checkbox()
    {
        return inertia("Components/Forms/Checkbox");
    }
    public function radio()
    {
        return inertia("Components/Forms/Radio");
    }
    public function wizard()
    {
        return inertia("Components/Wizards/Wizard");
    }
    public function wizardValidate()
    {
        return inertia("Components/Wizards/WizardValidate");
    }
    public function modal()
    {
        return inertia("Components/UI/Modal");
    }
    public function cards()
    {
        return inertia("Components/UI/Cards");
    }
    public function popovers()
    {
        return inertia("Components/UI/Popovers");
    }
    public function typography()
    {
        return inertia("Components/UI/Typography");
    }
    public function colors()
    {
        return inertia("Components/UI/Colors");
    }
    public function breadcrumb()
    {
        return inertia("Components/UI/Breadcrumb");
    }
    public function lists()
    {
        return inertia("Components/UI/Lists");
    }
    public function media()
    {
        return inertia("Components/UI/Media");
    }
    public function alerts()
    {
        return inertia("Components/UI/Alerts");
    }
    public function images()
    {
        return inertia("Components/UI/Images");
    }
    public function grid()
    {
        return inertia("Components/UI/Grid");
    }
    public function notifications()
    {
        return inertia("Components/UI/Notifications");
    }
    public function tabs()
    {
        return inertia("Components/UI/Tabs");
    }
    public function tooltips()
    {
        return inertia("Components/UI/Tooltips");
    }
    public function progressbar()
    {
        return inertia("Components/UI/Progressbar");
    }
    public function pagination()
    {
        return inertia("Components/UI/Pagination");
    }
    public function video()
    {
        return inertia("Components/UI/Video");
    }
    public function badges()
    {
        return inertia("Components/UI/Badges");
    }
    public function carousel()
    {
        return inertia("Components/UI/Carousel");
    }
    public function buttons()
    {
        return inertia("Components/UI/Buttons");
    }
}
