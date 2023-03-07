@extends('pdfs.header')
@section('content')
    <table class="table data">
        <thead class="thead">
            <tr>
                <td>Receipt No.</td>
                <td>Member</td>
                <td>Ac Number</td>
                <td>Branch</td>
                <td>Date Deposited</td>
                <td>Method</td>
                <td>Amount</td>
            </tr>
        </thead>
        <tbody>
            @foreach ($withdrawals as $item)
                <tr>
                    <td>{{ $item->withdrawal_number }}</td>
                    <td>{{ $item->member->first_name }} {{ $item->member->last_name }}</td>
                    <td>{{ $item->member->account->account_number }}</td>
                    <td>{{ $item->branch->name }}</td>
                    <td>{{ $item->withdrawal_date }}</td>
                    <td>{{ $item->method_id }}</td>
                    <td>{{ $item->amount }}</td>
                </tr>
            @endforeach
        </tbody>
    </table>
@endsection
