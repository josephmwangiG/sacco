<?php

namespace App\Http\Controllers;

use App\Models\MemberShare;
use Illuminate\Http\Request;
use PDF;

class MembershareController extends Controller
{
    public function index()
    {
        $membershares = MemberShare::paginate(10);
        return inertia('Membershares/Index', ['membershares' => $membershares]);
    }

    public function show($id)
    {
        $membershare = MemberShare::findOrFail($id);
        return inertia('Membershares/Show', ['membershare' => $membershare]);
    }

    public function create()
    {
        return inertia('Membershares/Create');
    }

    public function store(Request $request)
    {
        // Validate request data
        $validatedData = $request->validate([
            // Define validation rules
        ]);

        // Create new member share record
        MemberShare::create($validatedData);

        // Redirect to index or show page
    }

    public function edit($id)
    {
        $membershare = MemberShare::findOrFail($id);
        return inertia('Membershares/Edit', ['membershare' => $membershare]);
    }

    public function update(Request $request, $id)
    {
        // Validate request data
        $validatedData = $request->validate([
            // Define validation rules
        ]);

        // Update existing member share record
        $membershare = MemberShare::findOrFail($id);
        $membershare->update($validatedData);

        // Redirect to index or show page
    }

    public function destroy($id)
    {
        // Find and delete member share record
        $membershare = MemberShare::findOrFail($id);
        $membershare->delete();

        // Redirect to index page or perform another action
    }

    public function generatePdf($id)
    {
        $membershare = MemberShare::findOrFail($id);
        $pdf = PDF::loadView('pdf.membershare', compact('membershare'));
        return $pdf->download('membershare_summary.pdf');
    }
}
