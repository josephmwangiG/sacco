<?php

namespace App\Http\Controllers;

use App\Models\Branch;
use App\Models\Loan;
use App\Models\LoanApplication;
use App\Models\Payment;
use App\Models\Withdrawal;

class HomeController extends Controller
{
    public function dashboard()
    {

        $dashboard_data = array(
            "payments" => Payment::latest()->take(5)->get(),
            "loan_applications" => LoanApplication::latest()->with("member", "loanType")->take(2)->get(),
            "active_loans" => Loan::latest()->take(5)->get(),
            "withdrawals" => Withdrawal::latest()->take(5)->get(),
            "total_payments" => Payment::sum('amount'),
            "total_loan_applications" => LoanApplication::sum('amount_applied'),
            "total_active_loans" => Loan::sum('amount_approved'),
            "total_member_withdrawals" => Withdrawal::sum('amount'),
            "branches" => Branch::latest()->with("members")->get(),
        );

        return $dashboard_data;
    }
}
