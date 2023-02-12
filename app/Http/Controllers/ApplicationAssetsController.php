<?php

namespace App\Http\Controllers;

use App\Models\AssetLoanApplication;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ApplicationAssetsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
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
            "asset" => "required",
            "member_id" => "required",
            "loan_application_id" => "required",
            "organization_id" => "required",
        ]);

        $data['asset_id'] = $data['asset'];

        AssetLoanApplication::create($data);

        return back()->with("success", "Asset saved successfully");
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
        $data = request()->validate([
            "asset" => "required",
        ]);

        $data['asset_id'] = $data['asset'];

        $asset = AssetLoanApplication::find($id);

        $asset->update($data);

        return back()->with("success", "Asset updated successfully");
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $asset = AssetLoanApplication::find($id);

        $asset->delete();

        return back()->with("success", "Asset deleted successfully");
    }
}
