<?php

namespace App\Http\Controllers;

use App\Models\Loan;
use App\Models\LoanPayment;
use App\Models\LoanStatement;
use Illuminate\Http\Request;

class LoanStatementController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $loan = Loan::where('id', '=', 2)->first();
        $balance = $loan->amount_approved;
        $date = $loan->start_date;

        for ($i = 1; $i <= $loan->repayment_period; $i++) {
            $date = strtotime($date);
            $date = date("Y-m-d", strtotime("+1 month", $date));
            $balance =  $balance + 6500;
            $stmt = LoanStatement::create([
                "loan_id" => $loan->id,
                "member_id" => $loan->member->id,
                "posting_date" => $date,
                "document_number" => "Int Due",
                "description" => "Int Due",
                "debit_amount" => 6500,
                "credit_amount" => "0.00",
                "loan_balance" => $balance,
            ]);


            $balance =  $balance - 6500;

            $stmt = LoanStatement::create([
                "loan_id" => $loan->id,
                "member_id" => $loan->member->id,
                "posting_date" => $date,
                "document_number" => "XLASTSGS",
                "description" => "Int Pain",
                "debit_amount" => '0.00',
                "credit_amount" => 6500,
                "loan_balance" => $balance,
            ]);

            $balance =  $balance - 11000;

            $loan_re = LoanPayment::create([
                'branch_id' => 1,
                'member_id' => $loan->member->id,
                'loan_id' => $loan->id,
                'organization_id' => $loan->organization_id,
                'amount' => 11000,
                'method_id' => 1,
                'payment_date' => $date,
                'notes' => "Description",
            ]);

            LoanStatement::create([
                "loan_id" => $loan->id,
                "member_id" => $loan->member->id,
                "posting_date" => $date,
                "document_number" => $loan_re->receipt_number,
                "description" => "Repayment",
                "debit_amount" => "0.00",
                "credit_amount" => 11000,
                "loan_balance" => $balance,
            ]);
        }
        return $loan;
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
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\LoanStatement  $loanStatement
     * @return \Illuminate\Http\Response
     */
    public function show(LoanStatement $loanStatement)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\LoanStatement  $loanStatement
     * @return \Illuminate\Http\Response
     */
    public function edit(LoanStatement $loanStatement)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\LoanStatement  $loanStatement
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, LoanStatement $loanStatement)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\LoanStatement  $loanStatement
     * @return \Illuminate\Http\Response
     */
    public function destroy(LoanStatement $loanStatement)
    {
        //
    }
}
