<?php

namespace App\Http\Controllers;
use App\Models\Member;
use App\Models\MemberShareContribution;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use Inertia\Inertia;
use App\Models\ShareType;

class MemberShareContributionController extends Controller
{
    /**
     * Display a listing of the member share contributions.
     *
     * @return \Inertia\Response
     */
    public function index()
    {
        // Fetch all member share contributions from the database
        // $contributions = MemberShareContribution::paginate();
        $contributions = MemberShareContribution::with('member')->paginate();
        $members = Member::with("user",'account')->get();
        $sharetypes = ShareType::all();

        // Render Inertia view with member share contributions data
        return Inertia::render('Components/MemberShareContribution/MemberShareContribution', [
            'contributions' => $contributions,
            'members' => $members,
            'filters' => ['search' => ''],
            'sharetypes'=>$sharetypes,
        ]);
    }

    /**
     * Show the form for creating a new member share contribution.
     *
     * @return \Inertia\Response
     */
    public function create()
    {
        // Render Inertia view for creating a new member share contribution
        return Inertia::render('Components/MemberShareContribution/MemberShareContributionForm');
    }

    /**
     * Store a newly created member share contribution in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function store(Request $request)

    {

        // Validate the request data

        $validatedData = $request->validate([
            // Define validation rules for member share contribution fields
            'member_id' => 'required',
            'paymentmethod_id' => 'required',
            'amount' => 'required|numeric',
            'date_of_payment' => 'required|date',
            'description' => 'nullable|string',
            'sharetype_id' => 'required',
        ]);


        // Create a new member share contribution record
        MemberShareContribution::create($validatedData);

        // Redirect to the index page with success message
        return back()->with('success', 'Share type created successfully!');
    }

    /**
     * Show the form for editing the specified member share contribution.
     *
     * @param  int  $id
     * @return \Inertia\Response
     */
    public function edit($id)
    {
        // Find the member share contribution by ID
        $contribution = MemberShareContribution::findOrFail($id);

        // Render Inertia view for editing the member share contribution
        return Inertia::render('Components/member-share-contributions/edit', [
            'contribution' => $contribution,
        ]);
    }

    /**
     * Update the specified member share contribution in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\RedirectResponse
     */
    public function update(Request $request, $id)
    {
        // Validate the request data
        $validatedData = $request->validate([
            // Define validation rules for member share contribution fields
            'member_id' => 'required|exists:members,id',
            'paymentmethod_id' => 'required|exists:payment_methods,id',
            'amount' => 'required|numeric',
            'date_of_payment' => 'required|date',
            'description' => 'nullable|string',
            'sharetype_id' => 'required|exists:share_types,id',
        ]);

        // Find the member share contribution by ID and update its attributes
        $contribution = MemberShareContribution::findOrFail($id);
        $contribution->update($validatedData);

        // Redirect to the index page with success message
        return redirect()->route('contributions.index')->with('success', 'Member share contribution updated successfully!');
    }

    /**
     * Remove the specified member share contribution from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\RedirectResponse
     */
    public function destroy($id)
    {
        // Find the member share contribution by ID and delete it
        $contribution = MemberShareContribution::findOrFail($id);
        $contribution->delete();

        // Redirect to the index page with success message
        return redirect()->route('contributions.index')->with('success', 'Member share contribution deleted successfully!');
    }
}
