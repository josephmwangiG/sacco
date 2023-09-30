<?php

namespace App\Http\Controllers;

use App\Models\Loan;
use App\Models\LoanType;
use App\Models\Payment;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ReportController extends Controller
{
    public function loans()
    {
        $activeLoans = Loan::where("organization_id", Auth::user()->organization_id)
            ->latest()->get()
            ->map(fn ($item) => [
                "id" => $item->id,
                "loan_type_id" => $item->loan_type_id,
                "loanType" => $item->loanType,
                "member_id" => $item->member_id,
                "member" => $item->member,
                "payments" => $item->payments('paymentMethod')->get(),
                "user" => $item->member->user,
                "account" => $item->member->account,
                "payment_sum" => $item->payments->sum('amount'),
                "start_date" => $item->start_date,
                "service_fee" => $item->service_fee,
                "amount_approved" => $item->amount_approved,
                "interest_rate" => $item->interest_rate,
                "application_date" => $item->application_date,
                "paymentFrequency" => $item->paymentFrequency,
                "interestType" => $item->interestType,
                "branch" => $item->branch,
                "loanOfficer" => $item->loanOfficer,
                'loan_reference_number' => $item->loan_reference_number,
                'repayment_period' => $item->repayment_period,
                'loan_status_id' => $item->loan_status_id,
                'penalty_value' => $item->penalty_value,
                'end_date' => $item->end_date,
            ]);


        $loanTypes = LoanType::where("organization_id", Auth::user()->organization_id)->pluck("name");


        return inertia("reports/Loans", compact("activeLoans", "loanTypes"));
    }

    public function deposits()
    {
        $deposits = Payment::with("Member.Account", "paymentMethod", "Member.User")->latest()->get();
        $filters = array("filters" => Request()->only('search'));
        return inertia("reports/Deposits", compact("deposits", "filters"));
    }

    public function payments()
    {
        return inertia("User/Statements/SavingStatements");
    }

    public function applications()
    {
        return inertia("User/Statements/GuarantorStatements");
    }
}
