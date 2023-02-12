<?php

namespace App\Http\Controllers;

use App\Models\Branch;
use App\Models\Lead;
use App\Models\Loan;
use App\Models\LoanApplication;
use App\Models\LoanPayment;
use App\Models\Member;
use App\Models\Payment;
use App\Models\Withdrawal;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class DashboardController extends Controller
{
    public function dashboard()
    {
        $branches = Branch::where("organization_id", Auth::user()->organization_id)->get();
        $members = Member::where("organization_id", Auth::user()->organization_id)->get();
        $leads = Lead::where("organization_id", Auth::user()->organization_id)->get();
        $loans = Loan::where("organization_id", Auth::user()->organization_id)->get();
        $loans_total = Loan::where("organization_id", Auth::user()->organization_id)->sum("amount_approved");
        $applications = LoanApplication::where("organization_id", Auth::user()->organization_id)
            ->with("member", "loanType")
            ->get();
        $deposits = Payment::where("organization_id", Auth::user()->organization_id)->get();
        $deposits_total = Payment::where("organization_id", Auth::user()->organization_id)->sum("amount");
        $withdrawals = Withdrawal::where("organization_id", Auth::user()->organization_id)->get();
        $withdrawals_total = Withdrawal::where("organization_id", Auth::user()->organization_id)->sum("amount");
        $payments = LoanPayment::where("organization_id", Auth::user()->organization_id)->get();


        return inertia('Dashboard', compact("branches", 'members', "leads", "loans", "loans_total", "applications", "payments", "withdrawals", "deposits", "withdrawals_total", "deposits_total"));
    }
}
