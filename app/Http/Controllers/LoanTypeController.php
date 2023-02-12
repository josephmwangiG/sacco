<?php

namespace App\Http\Controllers;

use App\Models\InterestType;
use App\Models\LoanStatus;
use App\Models\LoanType;
use App\Models\PaymentFrequency;
use App\Models\PenaltyFrequency;
use App\Models\PenaltyType;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LoanTypeController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $loanTypes = LoanType::paginate(10)->through(fn ($item) => [
            'id' => $item->id,
            'name' => $item->name,
            'description' => $item->description,
            'interest_rate' => $item->interest_rate,
            'interest_type_id' => $item->interest_type_id,
            'payment_frequency_id' => $item->payment_frequency_id,
            'repayment_period' => $item->repayment_period,
            'service_fee' => $item->service_fee,
            'penalty_type_id' => $item->penalty_type_id,
            'penalty_value' => $item->penalty_value,
            'penalty_frequency_id' => $item->penalty_frequency_id,
            'paymentFrequency' => $item->paymentFrequency,
            'penaltyFrequency' => $item->penaltyFrequency,
            'interestType' => $item->interestType,
            'penaltyType' => $item->penaltyType,

        ]);
        $filters = Request()->only('search');
        return inertia('Components/LoanTypes/LoanTypes', compact('loanTypes', 'filters'));
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
        $data  = $request->validate([
            'name' => 'required',
            'description' => '',
            'interest_rate' => 'required',
            'interest_type' => 'required',
            'payment_frequency' => 'required',
            'repayment_period' => 'required',
            'service_fee' => '',
            'penalty_type' => 'required',
            'penalty_value' => '',
            'penalty_frequency' => 'required',
        ]);


        $data['organization_id'] = Auth::user()->organization_id;
        $data['interest_type_id'] = $data['interest_type'];
        $data['payment_frequency_id'] = $data['payment_frequency'];
        $data['penalty_type_id'] = $data['penalty_type'];
        $data['penalty_frequency_id'] = $data['penalty_frequency'];

        LoanType::create($data);

        return back()->with('success', 'Loan type created successfully');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
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
        $data  = $request->validate([
            'name' => 'required',
            'description' => '',
            'interest_rate' => 'required',
            'interest_type' => 'required',
            'payment_frequency' => 'required',
            'repayment_period' => 'required',
            'service_fee' => '',
            'penalty_type' => 'required',
            'penalty_value' => '',
            'penalty_frequency' => 'required',
        ]);


        $data['interest_type_id'] = $data['interest_type'];
        $data['payment_frequency_id'] = $data['payment_frequency'];
        $data['penalty_type_id'] = $data['penalty_type'];
        $data['penalty_frequency_id'] = $data['penalty_frequency'];

        $loan_type = LoanType::where("id", $id)->firstOrFail();

        $loan_type->update($data);

        return back()->with('success', 'Loan type updated successfully');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $loan_type = LoanType::where("id", $id)->firstOrFail();

        $loan_type->delete();
        return back()->with('success', 'Loan type deleted successfully');
    }


    public function loanSettings()
    {
        $paymentFrequencies = PaymentFrequency::latest()->get();
        $interestTypes = InterestType::latest()->get();
        $penaltyTypes = PenaltyType::latest()->get();
        $penaltyFrequencies = PenaltyFrequency::latest()->get();

        return inertia('Settings/LoanSettings', compact('paymentFrequencies', 'interestTypes', 'penaltyTypes', 'penaltyFrequencies'));
    }
}
