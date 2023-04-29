<?php

namespace App\Http\Controllers;

use App\Models\Member;
use App\Models\Payment;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

use function PHPUnit\Framework\isEmpty;
use function PHPUnit\Framework\isNull;

class DepositController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $deposits = Payment::with("Member.Account", "paymentMethod", "Member.User")->latest()->paginate(10);
        $filters = array("filters" => Request()->only('search'));
        return inertia("Components/Deposits/Deposits", compact("deposits", "filters"));
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


        Payment::create([
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
        return back()->with("success", "Deposit Added successfully");
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
        $payment = Payment::find($id);
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


        $payment->update([
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
        return back()->with("success", "Deposit updated successfully");
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $payment = Payment::find($id);
        $payment->delete();
        return back()->with("success", "Deposit delete successfully");
    }
}
