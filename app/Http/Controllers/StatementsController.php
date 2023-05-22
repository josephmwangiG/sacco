<?php

namespace App\Http\Controllers;

use App\Models\Guarantor;
use App\Models\Loan;
use App\Models\Member;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Pdf;

class StatementsController extends Controller
{
    public function statements()
    {
        return inertia("User/Statements/MemberStatements");
    }

    public function loans()
    {
        return inertia("User/Statements/LoanStatements");
    }

    public function savings()
    {
        return inertia("User/Statements/SavingStatements");
    }

    public function guarantors()
    {
        return inertia("User/Statements/GuarantorStatements");
    }

    public function guarantees()
    {
        return inertia("User/Statements/GuaranteeStatements");
    }

    public function statementsPdf()
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

        return $pdf->output();
    }

    public function loansPdf()
    {
        // ->setPaper('a4', 'landscape');
        $loans = Loan::where("member_id", Auth::user()->member->id)
            ->latest()->get();

        $data = [
            "organization" => Auth::user()->organization,
            "title" => "Loan Statements",
            "loans" => $loans,
            "items_name" => "Loans",
            "items_count" => count($loans),
        ];
        $pdf = Pdf::loadView('pdfs.loan-statements', $data)
            ->setOptions(['defaultFont' => 'sans-serif']);

        $pdf->set_option('javascript-delay', 30000);
        $pdf->set_option('isHtml5ParserEnabled', true);
        $pdf->set_option('isRemoteEnabled', true);

        return $pdf->output();
    }

    public function savingsPdf()
    {
        // ->setPaper('a4', 'landscape');
        $loans = Loan::where("member_id", Auth::user()->member->id)
            ->latest()->get();

        $data = [
            "organization" => Auth::user()->organization,
            "title" => "Loan Statements",
            "loans" => $loans,
            "items_name" => "Loans",
            "items_count" => count($loans),
        ];
        $pdf = Pdf::loadView('pdfs.loan-statements', $data)
            ->setOptions(['defaultFont' => 'sans-serif']);

        $pdf->set_option('javascript-delay', 30000);
        $pdf->set_option('isHtml5ParserEnabled', true);
        $pdf->set_option('isRemoteEnabled', true);

        return $pdf->output();
    }


    public function guarateedPdf()
    {
        // ->setPaper('a4', 'landscape');
        $guaranteed = Guarantor::where("member_id", Auth::user()->member->id)
            ->latest()->get();

        $data = [
            "organization" => Auth::user()->organization,
            "title" => "Loans Guaranteed",
            "guaranteed" => $guaranteed,
            "items_name" => "Guaranteed",
            "items_count" => count($guaranteed),
        ];
        $pdf = Pdf::loadView('pdfs.guaranteed-statements', $data)
            ->setOptions(['defaultFont' => 'sans-serif']);

        $pdf->set_option('javascript-delay', 30000);
        $pdf->set_option('isHtml5ParserEnabled', true);
        $pdf->set_option('isRemoteEnabled', true);

        return $pdf->output();
    }
    public function guarantorsPdf()
    {
        // ->setPaper('a4', 'landscape');
        $loan = Loan::where("member_id", Auth::user()->member->id)
            ->latest()->first();

        $data = [
            "organization" => Auth::user()->organization,
            "title" => "Guarantors Reports",
            "loan" => $loan,
            "items_name" => "Loans",
            "items_count" => 1,
        ];
        $pdf = Pdf::loadView('pdfs.guarantors-statements', $data)
            ->setOptions(['defaultFont' => 'sans-serif']);

        $pdf->set_option('javascript-delay', 30000);
        $pdf->set_option('isHtml5ParserEnabled', true);
        $pdf->set_option('isRemoteEnabled', true);

        return $pdf->output();
    }
}
