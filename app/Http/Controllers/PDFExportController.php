<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use PDF;

class PDFExportController extends Controller
{
    public function createPDF()
    {
        $pdf = PDF::loadView('pdf_view');
        return $pdf->stream('pdf_file.pdf');
    }
}