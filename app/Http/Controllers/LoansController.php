<?php

namespace App\Http\Controllers;

use App\Models\AssetLoanApplication;
use App\Models\Guarantor;
use App\Models\Loan;
use App\Models\LoanApplication;
use App\Models\LoanPayment;
use App\Models\LoanStatement;
use App\Models\Member;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LoansController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $activeLoans = Loan::where("organization_id", Auth::user()->organization_id)
            ->when(Request()->input('search'), function ($query, $search) {
                $query->where('loan_reference_number', "LIKE", "%{$search}%");
            })
            ->latest()->paginate(10)
            ->through(fn ($item) => [
                "id" => $item->id,
                "loan_type_id" => $item->loan_type_id,
                "loanType" => $item->loanType,
                "member_id" => $item->member_id,
                "member" => $item->member,
                "payments" => $item->payments('paymentMethod')->get(),
                "statements" => $item->statements('statements')->get(),
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

        $filters = Request()->only('search');

        return inertia("Components/Loans/ActiveLoans", compact("activeLoans", "filters"));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $data = $request->all();
        $data["approved_by_user_id"] = $request->user()->id;
        $loan = Loan::create($data);
        $loanApplication = LoanApplication::where("id", $data["loan_application_id"])->firstOrFail();
        $loanApplication->update(["approved_on" => date("Y-m-d H:i:s")]);
        return $loan;
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $loan = Loan::where("id", $id)->with(
            "loanApplication",
            "loanType",
            "loanOfficer",
            "payments",
            "interestType",
            "penaltyFrequency",
            "paymentFrequency"
        )->firstOrFail();
        $applicant = Member::where("id", $loan->member_id)->with("account")->firstOrFail();
        $paymentFrequency = $loan->loanType->paymentFrequency;

        return array("loanDetails" => array(
            "loan" => $loan,
            "applicant" => $applicant,
            "paymentFrequency" => $paymentFrequency
        ));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $activeLoan = Loan::where("id", $id)->first();
        return inertia("Components/Loans/EditForm", compact("activeLoan"));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }


    public function collateral($id)
    {
        $activeLoan = Loan::find($id);
        $collaterals = AssetLoanApplication::where("loan_application_id", $activeLoan->loan_application_id)
            ->with("asset")
            ->get();

        $member = Member::find($activeLoan->member_id);
        $assets = $member->assets;
        return inertia('Components/Loans/Collaterals', compact("id", "collaterals", "activeLoan", "assets"));
    }


    public function guarantors($id)
    {
        $activeLoan = Loan::find($id);
        $guarantors = Guarantor::where("loan_application_id", $activeLoan->loan_application_id)
            ->with("Member.Account", "Member.User")
            ->get();
        return inertia('Components/Loans/Guarantors', compact("id", "guarantors", "activeLoan"));
    }


    public function payments($id)
    {
        $activeLoan = Loan::find($id);
        $payments = LoanPayment::where("loan_id", $activeLoan->id)
            ->with("Member.Account", "Member.User", "loan", "paymentMethod")
            ->get();
        $member = Member::where("id", $activeLoan->member_id)->with("account", "user")->first();
        return inertia('Components/Loans/Payments', compact("id", "payments", "activeLoan", "member"));
    }

    public function accrue($id)
    {
        $activeLoan = Loan::where("id", $id)->with("paymentFrequency", "payments", "interestType")->first();
        $payments_sum = $activeLoan->payments->sum('amount');
        $date_diff = date_diff(date_create($activeLoan->start_date), date_create(date("Y-m-d")));

        $years = $date_diff->format("%r%y%") * 12;
        $months = $date_diff->format("%r%m%") + $years;

        return inertia('Components/Loans/Accrue', compact("id", "activeLoan", "payments_sum", "months"));
    }


    public function createPayments(Request $request, $id)
    {
        $data = $request->validate([
            "loan_id" => "required",
            "member" => "required",
            "amount" => "required",
            "payment_method" => "required",
            "payment_date" => "required",
            "description" => "",
            "account_number" => "required",
            "id_number" => "required",
            "bank_name" => "",
            "bank_branch" => "",
            "cheque_date" => "",
            "cheque_number" => "",
        ]);

        $data['organization_id'] = Auth::user()->organization_id;
        $member = Member::find($data['member']);

        LoanPayment::create([
            'branch_id' => $member->branch_id,
            'member_id' => $member->id,
            'loan_id' => $data['loan_id'],
            'organization_id' => $data['organization_id'],
            'amount' => $data['amount'],
            'method_id' => $data['payment_method'],
            'payment_date' => $data['payment_date'],
            'notes' => $data['description'],


            'cheque_number' => $data['cheque_number'],
            'bank_name' => $data['bank_name'],
            'bank_branch' => $data['bank_branch'],
            'cheque_date' => $data['cheque_date'],
        ]);

        $loan = Loan::where("id", $data['loan_id'])->first();
        $amount_after_interest = $data['amount'] - $loan->interest_due;

        $loan->update(
            ["interest_due" => $amount_after_interest > 0  ? 0 : -1 * $amount_after_interest]
        );

        LoanStatement::create([
            "loan_id" => $loan->id,
            "member_id" => $loan->member->id,
            "posting_date" => date('Y-m-d'),
            "document_number" => "Interest Payment",
            "description" => "Pay Interest",
            "debit_amount" => $amount_after_interest > 0  ? $loan->interest_due : $data['amount'],
            "credit_amount" => "0.00",
            "loan_balance" => $loan->current_balance,
        ]);

        if ($amount_after_interest > 0) {
            LoanStatement::create([
                "loan_id" => $loan->id,
                "member_id" => $loan->member->id,
                "posting_date" => date('Y-m-d'),
                "document_number" => "Loan Payment",
                "description" => "Loan Payment",
                "debit_amount" => $amount_after_interest,
                "credit_amount" => "0.00",
                "loan_balance" => $loan->amount_approved - $amount_after_interest,
            ]);

            $loan->update(
                ["current_balance" => $loan->current_balance - $amount_after_interest]
            );
        }

        return back()->with("success", "Loan payment added successfully.");
    }

    public function updatePayments(Request $request, $id)
    {
        $data = $request->validate([
            "member" => "required",
            "amount" => "required",
            "payment_method" => "required",
            "payment_date" => "required",
            "description" => "",
            "account_number" => "required",
            "id_number" => "required",
            "bank_name" => "",
            "bank_branch" => "",
            "cheque_date" => "",
            "cheque_number" => "",
        ]);

        $data['organization_id'] = Auth::user()->organization_id;
        $member = Member::find($data['member']);

        $loan_pay = LoanPayment::find($id);

        $loan_pay->update([
            'branch_id' => $member->branch_id,
            'member_id' => $member->id,
            'organization_id' => $data['organization_id'],
            'amount' => $data['amount'],
            'method_id' => $data['payment_method'],
            'payment_date' => $data['payment_date'],
            'notes' => $data['description'],
            'cheque_number' => $data['cheque_number'],
            'bank_name' => $data['bank_name'],
            'bank_branch' => $data['bank_branch'],
            'cheque_date' => $data['cheque_date'],
        ]);

        return back()->with("success", "Loan payment updated successfully.");
    }

    public function deletePayments(Request $request, $id)
    {
        $loan_pay = LoanPayment::find($id);

        $loan_pay->delete();

        return back()->with("success", "Loan payment deleted successfully.");
    }


    public function deleteGuarantors(Request $request, $id)
    {
        $payment = LoanPayment::find($id);
        $payment->delete();

        return back()->with("success", "Loan payment deleted successfully.");
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }


    // Users

    public function uLoans()
    {

        $activeLoans = Loan::where("member_id", Auth::user()->member->id)
            ->latest()->paginate(10)
            ->through(fn ($item) => [
                "id" => $item->id,
                "loan_type_id" => $item->loan_type_id,
                "loanType" => $item->loanType,
                "member_id" => $item->member_id,
                "member" => $item->member,
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

        $guarantors = Guarantor::where("member_id", Auth::user()->member->id)
            ->with("LoanApplication.Loan", "LoanApplication.Member.User", "LoanApplication.Member", "LoanApplication.loanType")
            ->get();

        $filters = Request()->only('search');

        return inertia("User/Loans", compact("activeLoans", "filters", "guarantors"));
    }

    public function uViewLoan($id)
    {
        $activeLoan = Loan::where("id", $id)->with("Member.User")->first();

        $guarantors = Guarantor::where("member_id", Auth::user()->member->id)
            ->with("LoanApplication.Loan", "LoanApplication.Member.User", "LoanApplication.Member", "LoanApplication.loanType")
            ->get();

        return inertia("User/EditForm", compact("activeLoan"));
    }


    public function uCollateral($id)
    {
        $activeLoan = Loan::find($id);
        $collaterals = AssetLoanApplication::where("loan_application_id", $activeLoan->loan_application_id)
            ->with("asset")
            ->get();

        $member = Member::find($activeLoan->member_id);
        $assets = $member->assets;
        return inertia('User/Collaterals', compact("id", "collaterals", "activeLoan", "assets"));
    }


    public function uGuarantors($id)
    {
        $activeLoan = Loan::find($id);
        $guarantors = Guarantor::where("loan_application_id", $activeLoan->loan_application_id)
            ->with("Member.Account", "Member.User")
            ->get();
        return inertia('User/Guarantors', compact("id", "guarantors", "activeLoan"));
    }


    public function uPayments($id)
    {
        $activeLoan = Loan::find($id);
        $payments = LoanPayment::where("loan_id", $activeLoan->id)
            ->with("Member.Account", "Member.User", "loan", "paymentMethod")
            ->get();
        $member = Member::where("id", $activeLoan->member_id)->with("account", "user")->first();
        return inertia('User/Payments', compact("id", "payments", "activeLoan", "member"));
    }

    public function uAccrue($id)
    {
        $activeLoan = Loan::where("id", $id)->with("paymentFrequency", "payments", "interestType")->first();
        $payments_sum = $activeLoan->payments->sum('amount');
        $date_diff = date_diff(date_create($activeLoan->start_date), date_create(date("Y-m-d")));

        $years = $date_diff->format("%r%y%") * 12;
        $months = $date_diff->format("%r%m%") + $years;

        return inertia('User/Accrue', compact("id", "activeLoan", "payments_sum", "months"));
    }
}
