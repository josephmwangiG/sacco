<?php

namespace App\Http\Controllers;

use App\Mail\GuaranteeRequest;
use App\Models\AssetLoanApplication;
use App\Models\Guarantor;
use App\Models\Loan;
use App\Models\LoanApplication;
use App\Models\LoanStatement;
use App\Models\LoanType;
use App\Models\Member;
use App\Models\PaymentFrequency;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Mail;

class LoanApplicationController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $loanApplications = LoanApplication::where("organization_id", Auth::user()->organization_id)
            ->when(Request()->input('search'), function ($query, $search) {

                $query->where('application_ref_number', "LIKE", "%{$search}%");
            })
            ->latest()->paginate(10)
            ->through(fn ($item) => [
                "id" => $item->id,
                "application_ref_number" => $item->application_ref_number,
                "loan_type_id" => $item->loan_type_id,
                "loanType" => $item->loanType,
                "member_id" => $item->member_id,
                "member" => $item->member,
                "user" => $item->member->user,
                "service_fee" => $item->service_fee,
                "amount_applied" => $item->amount_applied,
                "interest_rate" => $item->interest_rate,
                "application_date" => $item->application_date,
                "approved_on" => $item->approved_on,
                "rejected_on" => $item->rejected_on,
                "guarantors" => $item->guarantors,
            ]);

        $filters = Request()->only('search');
        $members = Member::where("organization_id", Auth::user()->organization_id)->with('user', 'account')->get();

        return inertia("Components/LoanApplications/LoanApplications", compact("loanApplications", "filters", "members"));
    }
    public function loansPendingApproval()
    {
        $loanApplications1 = LoanApplication::where("approver_1", Auth::user()->id)->where('approver_1_status', 'Pending')
            ->latest()
            ->with('member.user', 'loanType')->get();
        $loanApplications2 = LoanApplication::where("approver_2", Auth::user()->id)->where('approver_2_status', 'Pending')
            ->latest()
            ->with('member.user', 'loanType')->get();
        $loanApplications3 = LoanApplication::where("approver_3", Auth::user()->id)->where('approver_3_status', 'Pending')
            ->latest()
            ->with('member.user', 'loanType')->get();
        $loanApplications4 = LoanApplication::where("approver_4", Auth::user()->id)->where('approver_4_status', 'Pending')
            ->latest()
            ->with('member.user', 'loanType')->get();


        $loanApplications = $loanApplications1->concat($loanApplications2)->concat($loanApplications3)->concat($loanApplications4);

        $members = Member::where("organization_id", Auth::user()->organization_id)->with('user', 'account')->get();

        return inertia("Components/LoanApplications/PendingApproval", compact("loanApplications", "members"));
    }

    public function approveLoan()
    {
        $data = Request()->validate([
            "id" => "required",
        ]);

        $loanApplication = LoanApplication::find($data['id']);

        if ($loanApplication->approver_1 == Auth::user()->id) {
            $loanApplication->approver_1_status = "Approved";
        }
        if ($loanApplication->approver_2 == Auth::user()->id) {
            $loanApplication->approver_2_status = "Approved";
        }
        if ($loanApplication->approver_3 == Auth::user()->id) {
            $loanApplication->approver_3_status = "Approved";
        }
        if ($loanApplication->approver_4 == Auth::user()->id) {
            $loanApplication->approver_4_status = "Approved";
        }

        $loanApplication->save();

        return back()->with("success", "Status updated successfully");
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
        $data = $request->validate([
            'member' => "required",
            'loan_type' => "required",
            'amount_applied' => "required",
            'application_date' => "required",
        ]);


        $loan = LoanType::find($data['loan_type']);
        $member = Member::find($data['member']);

        $data['member_id'] = $member->id;
        $data['loan_type_id'] = $loan->id;
        $data['penalty_frequency_id'] = $loan->penalty_frequency_id;
        $data['penalty_value'] = $loan->penalty_value;
        $data['service_fee'] = $loan->service_fee;
        $data['penalty_frequency_id'] = $loan->penalty_frequency_id;
        $data['branch_id'] = $member->branch_id;
        $data['organization_id'] = $member->organization_id;
        $data['approver_1'] = $member->approver_1;
        $data['approver_2'] = $member->approver_2;
        $data['approver_3'] = $member->approver_3;
        $data['approver_4'] = $member->approver_4;
        $data['interest_type_id'] = $loan->interest_type_id;
        $data['interest_rate'] = $loan->interest_rate;
        $data['repayment_period'] = $loan->repayment_period;
        $data['payment_frequency_id'] = $loan->payment_frequency_id;

        $data['penalty_type_id'] = $loan->penalty_type_id;
        $data['loan_officer_id'] = Auth::user()->user_type == "member" ? 0 : Auth::user()->id;
        $data['disburse_method_id'] = 0;

        LoanApplication::create($data);

        return back()->with("success", "Loan application saved successfully");
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $loan = LoanApplication::where("id", $id)->with("guarantors", "loan", "loanType", "loanOfficer", "disburseMethod", "witnessType")->firstOrFail();
        $applicant = Member::where("id", $loan->member_id)->with("account")->firstOrFail();
        $paymentFrequency = $loan->loanType->paymentFrequency;

        return array("loanApplication" => array(
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
        $loanApplication = LoanApplication::where("id", $id)->with("guarantors")->first();
        return inertia("Components/LoanApplications/EditForm", compact("loanApplication"));
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
        $data = $request->validate([
            'member' => "required",
            'loan_type' => "required",
            'amount_applied' => "required",
            'application_date' => "required",
        ]);



        $loan = LoanType::find($data['loan_type']);
        $member = Member::find($data['member']);

        $data['member_id'] = $member->id;
        $data['loan_type_id'] = $loan->id;
        $data['penalty_frequency_id'] = $loan->penalty_frequency_id;
        $data['penalty_value'] = $loan->penalty_value;
        $data['penalty_frequency_id'] = $loan->penalty_frequency_id;
        $data['service_fee'] = $loan->service_fee;
        $data['repayment_period'] = $loan->repayment_period;
        $data['branch_id'] = $member->branch_id;
        $data['organization_id'] = $member->organization_id;
        $data['interest_type_id'] = $loan->interest_type_id;
        $data['interest_rate'] = $loan->interest_rate;
        $data['payment_frequency_id'] = $loan->payment_frequency_id;
        $data['penalty_type_id'] = $loan->penalty_type_id;

        $application = LoanApplication::find($id);

        $application->update($data);

        return back()->with("success", "Loan application updated.");
    }

    public function witness($id)
    {
        $loanApplication = LoanApplication::find($id);

        return inertia("Components/LoanApplications/WitnessForm", compact('loanApplication'));
    }


    public function updateWitness(Request $request, $id)
    {
        $data = $request->validate([
            'witness_first_name' => "required",
            'witness_first_name' => "required",
            'witness_type' => "required",
            'witness_country' => "required",
            'witness_county' => "",
            'witness_city' => "required",
            'witness_national_id' => "required",
            'witness_email' => "required",
            'witness_phone' => "required",
            'witness_postal_address' => "",
            'witness_residential_address' => "required",
        ]);

        $data['witness_type_id'] = $data['witness_type'];

        $application = LoanApplication::find($id);

        $application->update($data);

        return back()->with("success", "Loan application updated.");
    }

    public function guarantors($id)
    {
        $loanApplication = LoanApplication::where("id", $id)->firstOrFail();
        $guarantors = Guarantor::where("loan_application_id", $loanApplication->id)
            ->with('Member.Account', "Member.User")->get();

        $totalSum = Guarantor::where("loan_application_id", $loanApplication->id)
            ->sum("guarantee_amount");
        return inertia('Components/LoanApplications/Guarantors', compact("id", "guarantors", "loanApplication", "totalSum"));
    }

    public function createGuarantors(Request $request, $id)
    {
        $data = $request->validate([
            'member' => "required",
            'guarantee_amount' => "required",
            'notes' => "required",
        ]);

        $member = Member::find($data['member']);

        $data['member_id'] = $data['member'];
        $data['loan_application_id'] = $id;
        $data['branch_id'] = $member->branch_id;
        $data['organization_id'] = $member->organization_id;

        $guarantor = Guarantor::create($data);

        $data['guarantor'] = $guarantor;
        $data['loan'] = LoanApplication::find($id);
        $data['url'] = route('accept-guarantee-request', [$guarantor->id, Crypt::encrypt($member->user->email)]);

        Mail::to($member->user)->send(new GuaranteeRequest($data));

        return back()->with("success", "Loan guarantor added successfully. A notification email was sent to the member.");
    }

    public function acceptGuaranteeRequest($id, $token)
    {

        $user = User::where('email', Crypt::decrypt($token))->first();

        if ($user == null) {
            return back();
        }

        $guarantor = Guarantor::find($id);

        $guarantor->update(["status" => 'Approved']);

        return inertia('Components/LoanApplications/AcceptGuaranteeRequest');
    }

    public function updateGuarantors(Request $request, $id)
    {
        $data = $request->validate([
            'guarantee_amount' => "required",
            'notes' => "required",
        ]);

        $guarantor = Guarantor::find($id);
        $guarantor->update($data);

        return back()->with("success", "Loan guarantor updated successfully.");
    }

    public function deleteGuarantors(Request $request, $id)
    {
        $guarantor = Guarantor::find($id);
        $guarantor->delete();

        return back()->with("success", "Loan guarantor deleted successfully.");
    }

    public function collaterals($id)
    {
        $loanApplication = LoanApplication::where("id", $id)->firstOrFail();
        $member = Member::find($loanApplication->member_id);
        $collaterals = AssetLoanApplication::where("loan_application_id", $loanApplication->id)
            ->with("asset")->get();
        $assets = $member->assets;
        return inertia('Components/LoanApplications/Collaterals', compact("id", "collaterals", "assets", "loanApplication"));
    }

    public function createCollaterals(Request $request, $id)
    {
        $data = $request->validate([
            'member',
            'asset_number',
            'title',
            'description',
            'valuation_date',
            'valued_by',
            'valuer_phone',
            'valuation_amount',
            'location',
            'registration_number',
            'registered_to',
            'condition',
            'notes',
        ]);

        $member = Member::find($data['member']);

        $data['member_id'] = $data['member'];
        $data['loan_application_id'] = $id;
        $data['branch_id'] = $member->branch_id;
        $data['organization_id'] = $member->organization_id;

        Guarantor::create($data);

        return back()->with("success", "Loan guarantor added successfully.");
    }

    public function disbursement($id)
    {
        $loanApplication = LoanApplication::where("id", $id)->with("member")->first();
        $users = User::where("id", "!=", Auth::user()->id)
            ->where("organization_id", Auth::user()->organization_id)
            ->where("user_type", "!=", "member")
            ->with("role.permissions")->get();

        return inertia("Components/LoanApplications/DisburseForm", compact('loanApplication', "users"));
    }

    public function approval($id)
    {
        $loanApplication = LoanApplication::where("id", $id)->with("member", "approver1", "approver2", "approver3",     "approver4")->first();

        return inertia("Components/LoanApplications/Approval", compact('loanApplication'));
    }



    public function updateDisbursement(Request $request, $id)
    {
        $data = $request->validate([
            "disburse_method" => "required",
            "disburse_note" => "",
            "mpesa_number" => "",
            "mpesa_first_name" => "",
            "mpesa_middle_name" => "",
            "mpesa_last_name" => "",
            "cheque_number" => "",
            "bank_name" => "",
            "bank_branch" => "",
            "cheque_date" => "",
            "account_number" => "",
            "disbursement_date" => "",
        ]);

        $loanApplication = LoanApplication::find($id);

        $loanApplication->update($data);

        return back()->with("success", "Loan details updated successfully.");
    }

    public function confirm($id)
    {
        $loanApplication = LoanApplication::find($id);

        return inertia("Components/LoanApplications/ConfirmForm", compact('loanApplication'));
    }

    public function reject($id)
    {
        $loanApplication = LoanApplication::find($id);

        return inertia("Components/LoanApplications/RejectForm", compact('loanApplication'));
    }

    public function saveConfirm(Request $request, $id)
    {
        $data = $request->validate([
            "loan_officer" => "required",
            "reviewed_on" => "required",
            "approved_on" => "required",
            "amount_approved" => "required",
            "disburse_amount" => "required",
            "reviewed_by" => "required",
            "start_date" => "required",
        ]);

        $data['loan_officer_id'] = $data['loan_officer'];
        $data['reviewed_by_user_id'] = $data['reviewed_by'];

        $loanApplication = LoanApplication::find($id);

        $loanApplication->update($data);

        if ($loanApplication->loanType->interst_duration == 'year') {
            $interest = ($data['amount_approved'] * ($loanApplication->interest_rate / 12)) / 100;
        } else {
            $interest = ($data['amount_approved'] * ($loanApplication->interest_rate / 12)) / 100;
        }
        $loan_data = $loanApplication->toArray();


        $loan_data['loan_application_id'] = $loanApplication->id;
        $loan_data['amount_approved'] = $data['amount_approved'];
        $loan_data['disburse_amount'] = $data['disburse_amount'];
        $loan_data['start_date'] = $data['start_date'];
        $loan_data['payment_frequency_id'] = $loanApplication->loanType->payment_frequency_id;
        $loan_data['penalty_frequency_id'] = $loanApplication->loanType->penalty_frequency_id;
        $loan_data['penalty_type_id'] = $loanApplication->loanType->penalty_type_id;
        $loan_data['current_balance'] =  $data['amount_approved'];
        $loan_data['interest_due'] =  $interest;

        $loan = Loan::create($loan_data);

        LoanStatement::create([
            "loan_id" => $loan->id,
            "member_id" => $loan->member->id,
            "posting_date" => $loan->start_date,
            "document_number" => "Open Loan",
            "description" => "Loan",
            "debit_amount" => $loan->amount_approved,
            "credit_amount" => "0.00",
            "loan_balance" => $loan->amount_approved,
        ]);


        LoanStatement::create([
            "loan_id" => $loan->id,
            "member_id" => $loan->member->id,
            "posting_date" => $loan->start_date,
            "document_number" => "Open Bal",
            "description" => "Int Due",
            "debit_amount" => $interest,
            "credit_amount" => "0.00",
            "loan_balance" =>  $loan->amount_approved,
        ]);

        return back()->with("success", "Loan application approved.");
    }

    public function saveReject(Request $request, $id)
    {
        $data = $request->validate([
            "rejection_notes" => "required",
        ]);

        $data['rejected_on'] = date("Y-m-d");

        $loanApplication = LoanApplication::find($id);

        $loanApplication->update($data);

        return back()->with("success", "Loan application rejected.");
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


    // User 

    public function uLoanApplications()
    {
        $applications = LoanApplication::where("member_id", Auth::user()->member->id)
            // ->where("approved_on", null)
            ->latest()->paginate(10)
            ->through(fn ($item) => [
                "id" => $item->id,
                "loan_type_id" => $item->loan_type_id,
                "loanType" => $item->loanType,
                "member_id" => $item->member_id,
                "member" => $item->member,
                "paymentFrequency" => $item->paymentFrequency,
                "user" => $item->member->user,
                "service_fee" => $item->service_fee,
                "amount_applied" => $item->amount_applied,
                "interest_rate" => $item->interest_rate,
                "application_date" => $item->application_date,
                "guarantors" => $item->guarantors,
            ]);

        $member = Member::where("id", Auth::user()->member->id)->with("user", "account")->first();
        $filters = Request()->only('search');

        return inertia("User/Applications/Applications", compact("applications", "filters", "member"));
    }

    public function uEdit($id)
    {
        $loanApplication = LoanApplication::where("id", $id)->with("guarantors")->first();
        return inertia("User/Applications/EditForm", compact("loanApplication"));
    }


    public function uWitness($id)
    {
        $loanApplication = LoanApplication::find($id);

        return inertia("User/Applications/WitnessForm", compact('loanApplication'));
    }

    public function uGuarantors($id)
    {
        $loanApplication = LoanApplication::where("id", $id)->firstOrFail();
        $guarantors = Guarantor::where("loan_application_id", $loanApplication->id)
            ->with('Member.Account', "Member.User")->get();
        $totalSum = Guarantor::where("loan_application_id", $loanApplication->id)
            ->sum("guarantee_amount");

        return inertia('User/Applications/Guarantors', compact("id", "guarantors", "loanApplication", "totalSum"));
    }

    public function uCollaterals($id)
    {
        $loanApplication = LoanApplication::where("id", $id)->firstOrFail();
        $member = Member::find($loanApplication->member_id);
        $collaterals = AssetLoanApplication::where("loan_application_id", $loanApplication->id)
            ->with("asset")->get();
        $assets = $member->assets;
        return inertia('User/Applications/Collaterals', compact("id", "collaterals", "assets", "loanApplication"));
    }


    public function uDisbursement($id)
    {
        $loanApplication = LoanApplication::where("id", $id)->with("member")->first();

        return inertia("User/Applications/DisburseForm", compact('loanApplication'));
    }


    public function uConfirm($id)
    {
        $loanApplication = LoanApplication::find($id);
        return inertia("User/Applications/ConfirmForm", compact('loanApplication'));
    }

    public function uReject($id)
    {
        $loanApplication = LoanApplication::find($id);
        return inertia("User/Applications/RejectForm", compact('loanApplication'));
    }
}
