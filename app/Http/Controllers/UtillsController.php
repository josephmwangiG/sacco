<?php

namespace App\Http\Controllers;

use App\Models\AccountClass;
use App\Models\Branch;
use App\Models\InterestType;
use App\Models\LoanType;
use App\Models\Member;
use App\Models\PaymentFrequency;
use App\Models\PaymentMethod;
use App\Models\PenaltyFrequency;
use App\Models\PenaltyType;
use App\Models\Role;
use App\Models\User;
use App\Models\WitnessType;
use Illuminate\Http\Request;

class UtillsController extends Controller
{
    public function capitalBranches()
    {
        return [Branch::all(), PaymentMethod::all()];
    }


    public function loanItemTypes()
    {
        return [InterestType::all(), PenaltyType::all(), PaymentFrequency::all(), PenaltyFrequency::all()];
    }

    public function paymentMethods()
    {
        return PaymentMethod::all();
    }

    public function branches()
    {
        $items = ["branches" => Branch::all(), "roles" => Role::all()];
        return $items;
    }

    public function accountTypeItems()
    {
        return AccountClass::all();
    }


    public function loanApplicationItems()
    {
        $items = [
            "members" => Member::with("account")->latest()->get(),
            "officer" => User::all(),
            "loanType" => LoanType::with("paymentFrequency", "interestType")->latest()->get(),
            "witnessType" => WitnessType::all(),
            "disbursementMethods" => PaymentMethod::all(),
        ];
        return $items;
    }


    public function depositItems()
    {
        $items = [
            "members" => Member::with("account")->latest()->get(),
            "paymentMethod" => PaymentMethod::all(),
        ];
        return $items;
    }

    public function getGuarantorItems()
    {
        $members = Member::with("account")->latest()->get();
        return $members;
    }
}