@extends('pdfs.header')
@section('content')
    <table class="table data">
        <thead class="thead">
            <tr>
                <th>Loan</th>
                <th>Member</th>
                <th>Account</th>
                <th>Interest</th>
                <th>Amount</th>
                <th>Service Fee</th>
                <th>Status</th>
                <th>Date Applied</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($loan_applications as $item)
                <tr>
                    <td>{{ $item->loanType->name }}</td>
                    <td>{{ $item->member->first_name }} {{ $item->member->last_name }}</td>
                    <td>{{ $item->member->account->account_number }}</td>
                    <td>{{ $item->interest_rate }}</td>
                    <td>{{ $item->amount_applied }}</td>
                    <td>{{ $item->service_fee }}</td>
                    <td>{{ $item->status }}</td>
                    <td>{{ $item->application_date }}</td>
                </tr>
            @endforeach
        </tbody>
    </table>
@endsection
