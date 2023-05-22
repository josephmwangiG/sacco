<?php

namespace App\Http\Controllers;

use App\Models\Account;
use App\Models\AccountType;
use App\Models\Branch;
use App\Models\Loan;
use App\Models\LoanApplication;
use App\Models\Member;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class MemberController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $members = Member::where("organization_id", Auth::user()->organization_id)
            ->when(Request()->input('search'), function ($query, $search) {
                $query->where('first_name', "like", "%{$search}%")
                    ->orwhere('last_name', "like", "%{$search}%");
            })
            ->latest()
            ->paginate(10)->through(fn ($item) => [
                'id' => $item->id,
                'branch_id' => $item->user->branch_id,
                'account' => $item->account,
                'user' => $item->user,
                'branch' => $item->user->branch,
                'first_name' => $item->user->first_name,
                'last_name' => $item->user->last_name,
                'date_of_birth' => $item->date_of_birth,
                'nationality' => $item->nationality,
                'county' => $item->user->county,
                'city' => $item->user->city,
                'id_number' => $item->id_number,
                'passport_number' => $item->passport_number,
                'phone' => $item->user->phone,
                'email' => $item->user->email,
                'postal_address' => $item->user->postal_address,
                'residential_address' => $item->user->residential_address,
                'status_id' => $item->status_id,
                'passport_photo' => $item->passport_photo,
                'extra_images' => $item->extra_images,
                'membership_form' => $item->membership_form,
                'created_at' => $item->created_at,
                'date_became_member' => $item->date_became_member,
            ]);
        $filters = Request()->only('search');
        return inertia("Components/Members/Members", compact('members', "filters"));
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
            'date_became_member' => [""],
            'nationality' => [""],
            'county' => [""],
            'city' => [""],
            'id_number' => ["required", "unique:members"],
            'passport_number' => [""],
            'phone' => ["required", "unique:users"],
            'email' => ["required", "unique:users"],
            'postal_address' => ["required"],
            'residential_address' => ["required"],
        ]);

        $user = Auth::user();
        $branch_id = $user->branch_id;

        $accountType = AccountType::where("name", "MEMBER DEPOSIT")->firstOrFail();

        $data["branch_id"] = $branch_id;
        $data["organization_id"] = $user->organization_id;
        $data["password"] = Hash::make("password");

        $new_user = User::create($data);
        $data["user_id"] = $new_user->id;

        $member = Member::create($data);

        Account::create([
            'branch_id' => $branch_id,
            'organization_id' => $user->organization_id,
            'account_number' => "AC" . str_pad(rand(0, '9' . round(microtime(true))), 11, "0", STR_PAD_LEFT),
            'account_code' => $accountType->code,
            'account_name' => $member->id, // Will be member_id (For deposit accounts) // loan_id (For loan accounts)
            'account_type_id' => $accountType->id,
            'created_by' => $user->id
        ]);


        return back()->with('success', "Member Added Successfully");
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $member = Member::where("id", $id)->with("user")->first();
        return inertia("Components/Members/Details", compact('member'));
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
        $data = request()->validate([
            'first_name' => ["required"],
            'last_name' => ["required"],
            'date_of_birth' => [""],
            'date_became_member' => [""],
            'nationality' => [""],
            'county' => [""],
            'city' => [""],
            'id_number' => ["required", ""],
            'passport_number' => [""],
            'phone' => ["required", ""],
            'email' => ["required", ""],
            'postal_address' => [""],
            'residential_address' => [""],
        ]);
        $member = Member::where("id", $id)->with("user")->first();
        $member->update($data);

        return  back()->with('success', "Member Details eleted Successfully");
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     * 
     */


    public function loans($id)
    {
        $member = Member::where("id", $id)->with("user")->first();
        $loans = Loan::where("member_id", $member->id)
            ->with("loanType")
            ->get();
        return inertia("Components/Members/Loans", compact('member', "loans"));
    }


    public function applications($id)
    {
        $member = Member::where("id", $id)->with("user")->first();
        $applications = LoanApplication::where("member_id", $member->id)
            ->with("LoanType")
            ->get();
        return inertia("Components/Members/Applications", compact('member', "applications"));
    }



    public function assets($id)
    {
        $member = Member::where("id", $id)->with("user")->first();
        $assets = $member->assets;
        return inertia("Components/Members/Assets", compact('member', "assets"));
    }


    public function deposits($id)
    {
        $member = Member::where('id', $id)->with('account', 'payments', "user")->first();
        $deposits = $member->payments;
        return inertia("Components/Members/Deposits", compact('member', "deposits"));
    }



    public function withdrawals($id)
    {
        $member = Member::where('id', $id)->with('account', 'withdrawals', "user")->first();
        $withdrawals = $member->withdrawals;
        return inertia("Components/Members/Withdrawals", compact('member', "withdrawals"));
    }


    public function destroy($id)
    {
        $member = Member::where("id", $id)->with("user")->first();
        $accounts = Account::where("account_name", $member->id)->first();
        $accounts->delete();
        $member->delete();

        return back()->with('success', "Member Details eleted Successfully");
    }

    // User

    public function uDetails()
    {
        $member = Member::where("id", Auth::user()->member->id)
            ->with("user")
            ->first();
        return inertia("User/Details", compact('member'));
    }
}
