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
                    <td>{{ $item->user->first_name }} {{ $item->user->last_name }}</td>
                    <td>{{ $item->branch ? $item->branch->name : "" }}</td>
                    <td>{{ $item->user->phone }}</td>
                    <td>{{ $item->user->residential_address }}</td>
                    <td>{{ $item->date_became_member }}</td>
                </tr>
            @endforeach
        </tbody>
    </table>
@endsection
