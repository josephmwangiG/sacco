@extends('pdfs.header')
@section('content')
    <table class="table data">
        <thead class="thead">
            <tr>
                <td>Category</td>
                <td>Has_recurrent_contribution</td>
                <td>Contribution_period</td>
                <td>Dividend_percentage</td>
                <td>Can_be_withdrawn</td>
                <td>Max_amount</td>
                <td>Min_amount</td>
                <td>Can_be_transferred</td>
            </tr>
        </thead>
        <tbody>
            @foreach ($shares as $item)
                <tr>
                    <td>{{ $item->share->category }}</td>
                    <td>{{ $item->member->user ? $item->member->user->first_name: "" }} {{ $item->member->user ? $item->member->user->last_name : ""}}</td>
                    <td>{{ $item->member->account->account_number }}</td>
                    <td>{{ $item->branch->name }}</td>
                    <td>{{ $item->payment_date }}</td>
                    <td>{{ $item->method_id }}</td>
                    <td>{{ $item->amount }}</td>
                </tr>
            @endforeach
        </tbody>
    </table>
@endsection
