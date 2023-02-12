<?php

namespace App\Http\Controllers;

use App\Models\Branch;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class BranchController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $branches = Branch::where("organization_id", Auth::user()->organization_id)
            ->when(Request()->input('search'), function ($query, $search) {
                $query->where('name', 'like', "%{$search}%");
            })
            ->latest()
            ->paginate(10)
            ->withQueryString()
            ->through(fn ($branch) => [
                'id' => $branch->id,
                'name' => $branch->name,
                'organization_id' => $branch->organization_id,
                'description' => $branch->description,
                'location' => $branch->location,
                'country' => $branch->country,
                'county' => $branch->county,
                'town' => $branch->town,
                'address' => $branch->address,
                'branch_code' => $branch->branch_code,
                'created_at' => $branch->created_at,
                'members' => $branch->members
            ]);

        $filters = Request()->only('search');

        return inertia("Components/Branches/Branches", compact('branches', 'filters'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
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
            "name" => ["required"],
            "description" => ["required"],
            "country" => ["required"],
            "town" => ["required"],
            "address" => ["required"],
            "branch_code" => "",
        ]);


        $data['organization_id'] = Auth::user()->organization_id;
        Branch::create($data);
        return redirect()->route('branches.index')->with('success', "Item Added Successfully");
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
        $branch = Branch::find($id);

        $data = request()->validate([
            "name" => ["required"],
            "description" => ["required"],
            "country" => ["required"],
            "town" => ["required"],
            "address" => ["required"],
            "branch_code" => ["required"],
        ]);

        $branch->update($data);
        return back()->with('success', "Branch Updated Successfully");
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $branch = Branch::find($id);
        $branch->delete();
        return redirect()->route('branches.index')->with('success', "Item Deleted Successfully");
    }
}
