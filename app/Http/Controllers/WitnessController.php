<?php

namespace App\Http\Controllers;

use App\Models\BorrowerStatus;
use App\Models\WitnessType;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class WitnessController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $witnessTypes = WitnessType::where('organization_id', Auth::user()->organization_id)->paginate(10);
        $filters = Request()->only('search');
        return inertia("Components/WitnessType/WitnessTypes", compact('witnessTypes', 'filters'));
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
            "name" => "required",
            "description" => "required|max:50",
        ]);

        $data['organization_id'] = Auth::user()->organization_id;
        $data['display_name'] = $data['name'];

        WitnessType::create($data);
        return back()->with("success", "Witness type created successfully");
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
        $witness = WitnessType::find($id);
        $data = request()->validate([
            "name" => "required",
            "description" => "required|max:50",
        ]);

        $data['organization_id'] = Auth::user()->organization_id;
        $data['display_name'] = $data['name'];
        $witness->update($data);

        return back()->with("success", "Witness type updated successfully");
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {

        $witness = WitnessType::find($id);
        $witness->delete();
        return back()->with("success", "Witness type deleted successfully");
    }
}
