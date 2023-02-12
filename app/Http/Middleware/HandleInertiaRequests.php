<?php

namespace App\Http\Middleware;

use App\Models\Branch;
use App\Models\InterestType;
use App\Models\LoanType;
use App\Models\Member;
use App\Models\Organization;
use App\Models\PaymentFrequency;
use App\Models\PaymentMethod;
use App\Models\PenaltyFrequency;
use App\Models\PenaltyType;
use App\Models\User;
use App\Models\WitnessType;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Inertia\Middleware;

class HandleInertiaRequests extends Middleware
{


    /**
     * The root template that's loaded on the first page visit.
     *
     * @see https://inertiajs.com/server-side-setup#root-template
     * @var string
     */
    protected $rootView = 'app';

    /**
     * Determines the current asset version.
     *
     * @see https://inertiajs.com/asset-versioning
     * @param  \Illuminate\Http\Request  $request
     * @return string|null
     */
    public function version(Request $request): ?string
    {
        return parent::version($request);
    }

    /**
     * Defines the props that are shared by default.
     *
     * @see https://inertiajs.com/shared-data
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function share(Request $request): array
    {
        if (Auth::check()) {
            $user = Auth::user();
            $payment_methods = PaymentMethod::all();

            $paymentFrequencies = PaymentFrequency::latest()->get();
            $interestTypes = InterestType::latest()->get();
            $penaltyTypes = PenaltyType::latest()->get();
            $penaltyFrequencies = PenaltyFrequency::latest()->get();


            if ($user->role_id == 1) {
                return array_merge(parent::share($request), [
                    "organizations" => Organization::latest()->get(),
                    "user" => $user,
                    'flash' => function () use ($request) {
                        return [
                            'success' => $request->session()->get('success'),
                            'danger' => $request->session()->get('danger'),
                        ];
                    },
                ]);
            } else {
                $members = Member::where('organization_id', $user->organization_id)->get()->map(fn ($item) => [
                    'id' => $item->id,
                    'account' => $item->account,
                    'first_name' => $item->first_name,
                    'last_name' => $item->last_name,
                    'id_number' => $item->id_number,
                    'residential_address' => $item->residential_address,
                    'email' => $item->email,
                    'phone' => $item->phone,
                    'date_became_member' => $item->date_became_member

                ]);
                $loanTypes = LoanType::where('organization_id', $user->organization_id)->get()->map(fn ($item) => [
                    'id' => $item->id,
                    'name' => $item->name,
                    'service_fee' => $item->service_fee,
                    'penalty_type_id' => $item->penalty_type_id,
                    'penalty_frequency_id' => $item->penalty_frequency_id,
                    'payment_frequency_id' => $item->payment_frequency_id,
                    'penalty_value' => $item->penalty_value,
                    'penaltyType' => $item->penaltyType,
                    'penaltyFrequency' => $item->penaltyFrequency,
                    'paymentFrequency' => $item->paymentFrequency,
                    'repayment_period' => $item->repayment_period,
                    'ineterst_type_id' => $item->ineterst_type_id,
                    'interestType' => $item->interestType,
                    'interest_rate' => $item->interest_rate,
                ]);
                $witnessTypes = WitnessType::where('organization_id', Auth::user()->organization_id)->get();
                $users = User::where("user_type", "admin")
                    ->where("organization_id", Auth::user()->organization_id)
                    ->where("branch_id", Auth::user()->branch_id)
                    ->get();


                return array_merge(parent::share($request), [
                    "allBranches" => Branch::where("organization_id", $user->organization_id)->latest()->with("members")->get(),
                    "user" => $user,
                    "paymentMethods" => $payment_methods,
                    "penaltyTypes" => $penaltyTypes,
                    "witnessTypes" => $witnessTypes,
                    "interestTypes" => $interestTypes,
                    "paymentFrequencies" => $paymentFrequencies,
                    "penaltyFrequencies" => $penaltyFrequencies,
                    "members" => $members,
                    "loanTypes" => $loanTypes,
                    "users" => $users,
                    'flash' => function () use ($request) {
                        return [
                            'success' => $request->session()->get('success'),
                            'danger' => $request->session()->get('danger'),
                        ];
                    },
                ]);
            }
        } else {
            return array_merge(parent::share($request), [
                'flash' => function () use ($request) {
                    return [
                        'success' => $request->session()->get('success'),
                        'danger' => $request->session()->get('danger'),
                    ];
                },
            ]);
        }
    }
}
