<?php

namespace App\Http\Controllers;

use App\Models\Sharetype;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use Inertia\Inertia;

class SharetypeController extends Controller
{
    /**
     * Display a listing of the share types.
     *
     * @return \Inertia\Response
     */
    public function index()
    {
        // Fetch all share types from the database
        $sharetypes = Sharetype::paginate();

        // Render Inertia view with share types data
        return Inertia::render('Components/shares/share', [
            'sharetypes' => $sharetypes,
            'filters' => ['search'=>""],
        ]);
    }

    /**
     * Show the form for creating a new share type.
     *
     * @return \Inertia\Response
     */
    public function create()
    {
        // Render Inertia view for creating a new share type
        return Inertia::render('Components/shareform/Create');
    }

    /**
     * Store a newly created share type in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function store(Request $request)
    {
        // Validate the request data
        $validatedData = $request->validate([
            // Define validation rules for share type fields
            'category' => 'required|in:capital,normal',
            'has_recurrent_contribution' => 'required|boolean',
            'contribution_period' => 'required|in:weekly,monthly,yearly',
            'dividend_percentage' => 'required|numeric',
            'can_be_withdrawn' => 'required|in:yes,no',
            'min_amount' => 'required|numeric',
            'max_amount' => 'required|numeric',
            'can_be_transferred' => 'required|in:yes,no',
        ]);

        // Create a new share type record
        Sharetype::create($validatedData);

        // Redirect to the index page with success message
        return back()->with('success', 'Share type created successfully!');
    }

    /**
     * Show the form for editing the specified share type.
     *
     * @param  int  $id
     * @return \Inertia\Response
     */
    public function edit($id)
    {
        // Find the share type by ID
        $sharetype = Sharetype::findOrFail($id);

        // Render Inertia view for editing the share type
        return Inertia::render('Sharetypes/Edit', [
            'sharetype' => $sharetype,
        ]);
    }

    /**
     * Update the specified share type in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\RedirectResponse
     */
    public function update(Request $request, $id)
    {
        // Validate the request data
        $validatedData = $request->validate([
            // Define validation rules for share type fields
            'category' => 'required|in:capital,normal',
            'has_recurrent_contribution' => 'required|boolean',
            'contribution_period' => 'required|in:weekly,monthly,yearly',
            'dividend_percentage' => 'required|numeric',
            'can_be_withdrawn' => 'required|in:yes,no',
            'min_amount' => 'required|numeric',
            'max_amount' => 'required|numeric',
            'can_be_transferred' => 'required|in:yes,no',
        ]);

        // Find the share type by ID and update its attributes
        $sharetype = Sharetype::findOrFail($id);
        $sharetype->update($validatedData);

        // Redirect to the index page with success message
        return back()->with('success', 'Share type updated successfully!');
    }

    /**
     * Remove the specified share type from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\RedirectResponse
     */
    public function destroy($id)
    {
        // Find the share type by ID and delete it
        $sharetype = Sharetype::findOrFail($id);
        $sharetype->delete();

        // Redirect to the index page with success message
        return back()->with("success", "Deposit delete successfully");
    }
}
