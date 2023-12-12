<?php

namespace App\Console\Commands;

use App\Models\Loan;
use App\Models\LoanStatement;
use DateInterval;
use DateTime;
use Illuminate\Console\Command;

class LoanStatementCron extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'loan-statement:cron';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        $loans = Loan::where('closed_on', null)->get();

        foreach ($loans as $loan) {
            if ($loan->next_repayment_date == date('Y-m-d')) {

                if ($loan->loanType->interest_duration == 'year') {
                    $interest = (($loan->current_balance + $loan->interest_due) * ($loan->interest_rate / 12)) / 100;
                } else {
                    $interest = (($loan->current_balance + $loan->interest_due) * $loan->interest_rate) / 100;
                }



                LoanStatement::create([
                    "loan_id" => $loan->id,
                    "member_id" => $loan->member->id,
                    "posting_date" => date('Y-m-d'),
                    "document_number" => "Interest Due",
                    "description" => "Interest Due",
                    "debit_amount" => $interest + $loan->interest_due,
                    "credit_amount" => "0.00",
                    "loan_balance" => $loan->current_balance,
                ]);

                $currentDate = new DateTime(); // Get the current date
                $currentDate->add(new DateInterval('P1M')); // Add 1 month

                $next_repayment_date = $currentDate->format('Y-m-d'); // Format the new date as per your needs (Y-m-d is year-month-day)

                $loan->update([
                    "interest_due" => $interest,
                    "next_repayment_date" => $next_repayment_date
                ]);
            }
        }
    }
}
