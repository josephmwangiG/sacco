<?php

namespace App\Http\Controllers;

use App\Models\Lead;
use App\Models\Loan;
use App\Models\LoanApplication;
use App\Models\Member;
use App\Models\Payment;
use App\Models\Withdrawal;
use Illuminate\Support\Facades\Auth;
use Pdf;

class PDFController extends Controller
{
    public function members()
    {
        // ->setPaper('a4', 'landscape');
        $members = Member::where("organization_id", Auth::user()->organization_id)
            ->latest()->get();

        $data = [
            "organization" => Auth::user()->organization,
            "title" => "Members Report",
            "members" => $members,
            "items_name" => "Members",
            "items_count" => count($members),
        ];
        $pdf = Pdf::loadView('pdfs.members', $data)
            ->setOptions(['defaultFont' => 'sans-serif']);

        $pdf->set_option('javascript-delay', 30000);
        $pdf->set_option('isHtml5ParserEnabled', true);
        $pdf->set_option('isRemoteEnabled', true);

        return $pdf->stream("members.pdf");
    }


    public function leads()
    {
        $leads = Lead::where("organization_id", Auth::user()->organization_id)
            ->latest()->get();

        $data = [
            "organization" => Auth::user()->organization,
            "title" => "Leads Report",
            "leads" => $leads,
            "items_name" => "Leads",
            "items_count" => count($leads),
        ];
        $pdf = Pdf::loadView('pdfs.leads', $data)
            ->setOptions(['defaultFont' => 'sans-serif']);
        $pdf->set_option('javascript-delay', 30000);
        $pdf->set_option('isHtml5ParserEnabled', true);
        $pdf->set_option('isRemoteEnabled', true);

        return $pdf->stream("leads.pdf");
    }


    public function deposits()
    {
        $deposits = Payment::where("organization_id", Auth::user()->organization_id)
            ->latest()->get();

        $data = [
            "organization" => Auth::user()->organization,
            "title" => "Deposits Report",
            "deposits" => $deposits,
            "items_name" => "Deposits",
            "items_count" => count($deposits),
        ];
        $pdf = Pdf::loadView('pdfs.deposits', $data)
            ->setOptions(['defaultFont' => 'sans-serif']);
        $pdf->set_option('javascript-delay', 30000);
        $pdf->set_option('isHtml5ParserEnabled', true);
        $pdf->set_option('isRemoteEnabled', true);

        return $pdf->stream("deposits.pdf");
    }

    // pdf logic for shares
    public function shares()
    {
        $shareTypes = ShareType::where("organization_id", Auth::user()->organization_id)
            ->latest()->get();

        $data = [
            "organization" => Auth::user()->organization,
            "title" => "share report",
            "deposits" => $deposits,
            "items_name" => "ShareTypes",
            "items_count" => count($shareTypes),
        ];
        $pdf = Pdf::loadView('pdfs.deposits', $data)
            ->setOptions(['defaultFont' => 'sans-serif']);
        $pdf->set_option('javascript-delay', 30000);
        $pdf->set_option('isHtml5ParserEnabled', true);
        $pdf->set_option('isRemoteEnabled', true);

        return $pdf->stream("shareTypes.pdf");
    }


    public function withdrawals()
    {
        $withdrawals = Withdrawal::where("organization_id", Auth::user()->organization_id)
            ->latest()->get();

        $data = [
            "organization" => Auth::user()->organization,
            "title" => "Withdrawals Report",
            "withdrawals" => $withdrawals,
            "items_name" => "Withdrawals",
            "items_count" => count($withdrawals),
        ];
        $pdf = Pdf::loadView('pdfs.withdrawals', $data)
            ->setOptions(['defaultFont' => 'sans-serif']);
        $pdf->set_option('javascript-delay', 30000);
        $pdf->set_option('isHtml5ParserEnabled', true);
        $pdf->set_option('isRemoteEnabled', true);

        return $pdf->stream("withdrawals.pdf");
    }

    public function loans()
    {
        $loans = Loan::where("organization_id", Auth::user()->organization_id)
            ->latest()->get();

        $data = [
            "organization" => Auth::user()->organization,
            "title" => "Loans Report",
            "loans" => $loans,
            "items_name" => "Loans",
            "items_count" => count($loans),
        ];
        $pdf = Pdf::loadView('pdfs.loans', $data)
            ->setOptions(['defaultFont' => 'sans-serif']);
        $pdf->set_option('javascript-delay', 30000);
        $pdf->set_option('isHtml5ParserEnabled', true);
        $pdf->set_option('isRemoteEnabled', true);

        return $pdf->stream("loans.pdf");
    }

    public function loansApplications()
    {
        $loan_applications = LoanApplication::where("organization_id", Auth::user()->organization_id)
            ->latest()->get();

        $data = [
            "organization" => Auth::user()->organization,
            "title" => "Loan Applications Report",
            "loan_applications" => $loan_applications,
            "items_name" => "Loan Applications",
            "items_count" => count($loan_applications),
        ];
        $pdf = Pdf::loadView('pdfs.loan-applications', $data)
            ->setOptions(['defaultFont' => 'sans-serif']);
        $pdf->set_option('javascript-delay', 30000);
        $pdf->set_option('isHtml5ParserEnabled', true);
        $pdf->set_option('isRemoteEnabled', true);

        return $pdf->stream("loan-applications.pdf");
    }

    public function downloadPDF()
    {
        $loan_applications = LoanApplication::where("organization_id", Auth::user()->organization_id)
            ->latest()->get();

        $data = [
            "organization" => Auth::user()->organization,
            "title" => "Loan Applications Report",
            "loan_applications" => $loan_applications,
            "items_name" => "Loan Applications",
            "items_count" => count($loan_applications),
        ];
        $pdf = Pdf::loadView('pdfs.loan-applications', $data)
            ->setOptions(['defaultFont' => 'sans-serif']);
        $pdf->set_option('javascript-delay', 30000);
        $pdf->set_option('isHtml5ParserEnabled', true);
        $pdf->set_option('isRemoteEnabled', true);

        return $pdf->download("loan-applications.pdf");
    }
}
