<?php

namespace App\Http\Controllers\SuperAdmin;

use App\Http\Controllers\Controller;
use App\Models\Branch;
use App\Models\Organization;
use App\Models\Role;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class OrganizationsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return inertia("Apps/SuperAdmin/Organizations");
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $data = request()->all();
        if ($data['action'] == 'create') {
            $organization = null;
        } else {
            $organization = Organization::find($data['id']);
        }

        return inertia("Apps/SuperAdmin/CreateOrganization", compact('organization'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $data = $request->all();

        DB::transaction(function () use ($data) {
            $organization = Organization::create([
                'business_name' => $data['business_name'],
                'business_type' => $data['business_type'],
                'email' => $data['email'],
                'phone' => $data['phone'],
                'alternate_phone' => $data['alternate_phone'],
                'country' => $data['country'],
                'county' => $data['county'],
                'about' => $data['about'],
                'physical_address' => $data['physical_address'],
                'postal_address' => $data['postal_address'],
                'postal_code' => $data['postal_code'],
            ]);


            $role = Role::create([
                'name' => 'Admin',
                'organization_id' => $organization->id,
                'display_name' => 'Admin',
                'description' => 'Admin'
            ]);

            $barnch = Branch::create([
                'name' => "Main Branch",
                'organization_id' => $organization->id,
                'description' => "Main Branch",
                'location' => $data['physical_address'],
                'country' => $data['country'],
                'county' => $data['county'],
                'town' => $data['town'],
                'address' => $data['physical_address'],
                'branch_code' => 0001
            ]);

            User::create([
                'branch_id' => $barnch->id,
                'organization_id' => $organization->id,
                'first_name' => "Admin",
                'middle_name' => "Admin",
                'last_name' => "Admin",
                'employee_id' => 0001,
                'phone' => $data['phone'],
                'role_id' => $role->id,
                'email' => $data['email'],
                'password' => Hash::make($data['password']),
                'country' => $data['country'],
                'county' => $data['county'],
                'about' => $data['about'],
                'physical_address' => $data['physical_address'],
                'postal_address' => $data['postal_address'],
                'postal_code' => $data['postal_code'],
            ]);
        });

        return redirect()->route('organizations.index')->with("Organization Created");
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $organization = Organization::find($id);
        return inertia("Apps/SuperAdmin/ViewOrganization", compact('organization'));
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
        $organization = Organization::find($id);
        $organization->update([
            'business_name' => $data['business_name'],
            'business_type' => $data['business_type'],
            'email' => $data['email'],
            'phone' => $data['phone'],
            'alternate_phone' => $data['alternate_phone'],
            'country' => $data['country'],
            'county' => $data['county'],
            'about' => $data['about'],
            'physical_address' => $data['physical_address'],
            'postal_address' => $data['postal_address'],
            'postal_code' => $data['postal_code'],
        ]);

        return redirect()->route('organizations.show', $organization->id);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
