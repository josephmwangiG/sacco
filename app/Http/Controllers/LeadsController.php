<?php

namespace App\Http\Controllers;

use App\Models\Account;
use App\Models\AccountType;
use App\Models\Branch;
use App\Models\Lead;
use App\Models\Member;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LeadsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $leads = Lead::where('organization_id', Auth::user()->organization_id)
            ->when(Request()->input('search'), function ($query, $search) {
                $query->where('first_name', 'like', "%{$search}%")
                    ->orwhere('last_name', 'like', "%{$search}%");
            })
            ->latest()
            ->paginate(10)
            ->withQueryString()
            ->through(fn ($lead) => [
                'id' => $lead->id,
                'branch_id' => $lead->branch_id,
                'branch' => $lead->branch,
                'assigned_to' => $lead->assigned_to,
                'assignedTo' => $lead->assignedTo,
                'first_name' => $lead->first_name,
                'last_name' => $lead->last_name,
                'date_of_birth' => $lead->date_of_birth,
                'nationality' => $lead->nationality,
                'county' => $lead->county,
                'city' => $lead->city,
                'id_number' => $lead->id_number,
                'passport_number' => $lead->passport_number,
                'phone' => $lead->phone,
                'email' => $lead->email,
                'postal_address' => $lead->postal_address,
                'residential_address' => $lead->residential_address,
                'status_id' => $lead->status_id,
                'passport_photo' => $lead->passport_photo,
                'extra_images' => $lead->extra_images,
                'membership_form' => $lead->membership_form,
                'created_at' => $lead->created_at,
            ]);
        $filters = Request()->only('search');
        return inertia("Components/Leads/Leads", compact('leads', 'filters'));
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
        $data = request()->validate([
            'first_name' => ["required"],
            'last_name' => ["required"],
            'date_of_birth' => [""],
            'nationality' => [""],
            'county' => [""],
            'city' => [""],
            'id_number' => ["required", "unique:leads"],
            'passport_number' => [""],
            'phone' => ["required", "unique:leads"],
            'email' => ["required", "unique:leads"],
            'postal_address' => [""],
            'residential_address' => [""],
        ]);
        $user = Auth::user();

        $branch_id = $user->branch_id;

        $data["branch_id"] = $branch_id;
        $data["assigned_to"] = $user->id;
        $data["organization_id"] = $user->organization_id;


        $lead =  Lead::create($data);

        return back()->with("success", "Lead Added Successfully.");
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
        $data = request()->all();

        $lead = Lead::find($id);
        $lead->update($data);

        return back()->with("success", "Lead Updated Successfully.");
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $lead = Lead::find($id);
        $lead->delete();

        return back()->with("success", "Lead Deleted Successfully.");
    }

    public function changeToMember()
    {

        $data = request()->all();
        $user = auth('sanctum')->user();

        $accountType = AccountType::where("name", "MEMBER DEPOSIT")->firstOrFail();

        $data["date_became_member"] = date("Y-m-d");

        $member = Member::create($data);

        Account::create([
            'branch_id' => $data["branch_id"],
            'account_number' => "AC" . str_pad(rand(0, '9' . round(microtime(true))), 11, "0", STR_PAD_LEFT),
            'account_code' => $accountType->code,
            'account_name' => $member->id, // Will be member_id (For deposit accounts) // loan_id (For loan accounts)
            'account_type_id' => $accountType->id,
            'created_by' => $user->id
        ]);

        $lead = Lead::find($data['lead_id']);

        $lead->delete();

        $leads = Lead::with("assignedTo", "branch")->latest()->get();
        return $leads;
    }
}
