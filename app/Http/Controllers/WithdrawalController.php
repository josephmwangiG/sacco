<?php

namespace App\Http\Controllers;

use App\Models\Withdrawal;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class WithdrawalController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $withdrawals = Withdrawal::where('organization_id', Auth::user()->organization_id)
            ->paginate(10)
            ->through(fn ($item) => [
                'id' => $item->id,
                'branch_id' => $item->branch_id,
                'organization_id' => $item->organization_id,
                'member_id' => $item->member_id,
                'amount' => $item->amount,
                'withdrawal_date' => $item->withdrawal_date,
                'method_id' => $item->method_id,
                'withdrawal_number' => $item->withdrawal_number,
                'withdrawal_charges' => $item->withdrawal_charges,
                'balance_before_withdrawal' => $item->balance_before_withdrawal,
                'balance_after_withdrawal' => $item->balance_after_withdrawal,
                'status' => $item->status,
                'mpesa_number' => $item->mpesa_number,
                'first_name' => $item->first_name,
                'last_name' => $item->last_name,
                'cheque_number' => $item->cheque_number,
                'bank_name' => $item->bank_name,
                'bank_branch' => $item->bank_branch,
                'paymentMethod' => $item->paymentMethod,
                'member' => $item->member,
                'user' => $item->member->user,
                'account' => $item->member->account,
                'branch' => $item->branch,
            ]);

        $filters = Request()->only('search');
        return inertia("Components/Withdrawals/Withdrawals", compact('withdrawals', 'filters'));
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
            'member' => ['required'],
            'amount' => ['required'],
            'withdrawal_date' => ['required'],
            'payment_method' => ['required'],
            'mpesa_number' => '',
            'cheque_number' => '',
            'bank_name' => '',
            'bank_branch' => '',
            'cheque_date' => '',
        ]);


        $data['member_id'] = $data['member'];
        $data['method_id'] = $data['payment_method'];
        $data['organization_id'] = Auth::user()->organization_id;
        $data['branch_id'] = Auth::user()->branch_id;

        Withdrawal::create($data);

        return back()->with('success', 'Withdrawal added successfully');
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
        $data = $request->validate([
            'amount' => ['required'],
            'withdrawal_date' => ['required'],
            'payment_method' => ['required'],
            'mpesa_number' => '',
            'cheque_number' => '',
            'bank_name' => '',
            'bank_branch' => '',
            'cheque_date' => '',
        ]);


        $data['method_id'] = $data['payment_method'];
        $data['organization_id'] = Auth::user()->organization_id;
        $data['branch_id'] = Auth::user()->branch_id;

        $withdrawal = Withdrawal::find($id);

        $withdrawal->update($data);

        return back()->with('success', 'Withdrawal updated successfully');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $withdrawal = Withdrawal::find($id);
        $withdrawal->delete();
        return back()->with('success', 'Withdrawal deleted successfully');
    }
}
