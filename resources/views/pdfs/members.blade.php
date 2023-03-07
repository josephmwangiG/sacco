@extends('pdfs.header')
@section('content')
    <table class="table data">
        <thead class="thead">
            <tr>
                <td>Ac Number</td>
                <td>Member</td>
                <td>Branch</td>
                <td>Phone Number</td>
                <td>Address</td>
                <td>Date Joined</td>
            </tr>
        </thead>
        <tbody>
            @foreach ($members as $item)
                <tr>
                    <td>{{ $item->account->account_number }}</td>
                    <td>{{ $item->first_name }} {{ $item->last_name }}</td>
                    <td>{{ $item->branch->name }}</td>
                    <td>{{ $item->phone }}</td>
                    <td>{{ $item->residential_address }}</td>
                    <td>{{ $item->date_became_member }}</td>
                </tr>
            @endforeach
        </tbody>
    </table>
@endsection
