@extends('pdfs.header')
@section('content')
    @foreach ($loans as $item)
        <table class="table data">

            <tbody>
                <thead class="thead">
                    <tr>
                        <td>Loan Number</td>
                        <td>Requested Amount</td>
                        <td>Start Date</td>
                        <td>Loan Period</td>
                        <td>End date</td>
                    </tr>
                </thead>
                <tr>
                    <td>{{ $item->loan_reference_number }}</td>
                    <td>{{ $item->amount_approved }}</td>
                    <td>{{ $item->start_date }}</td>
                    <td>{{ $item->repayment_period }}</td>
                    <td>{{ $item->start_date }}</td>
                </tr>
            </tbody>
        </table>
        <table class="table">
            <tbody>
                <tr>
                    <td>Loan Type</td>
                    <td colspan="5">{{ $item->loanType->name }}</td>
                </tr>
                <tr>
                    <th>Posting date</th>
                    <th>Document No</th>
                    <th>Description</th>
                    <th>Debit Amount</th>
                    <th>Credit Amount</th>
                    <th>Balance</th>
                </tr>

                {{-- Loan Statements --}}

                @foreach ($item->statements as $statement)
                    <tr>
                        <td>{{ $statement->posting_date }}</td>
                        <th>{{ $statement->document_number }}</th>
                        <th>{{ $statement->description }}</th>
                        <th>{{ $statement->credit_amount }}</th>
                        <th>{{ $statement->credit_amount }}</th>
                        <th>{{ $statement->loan_balance }}</th>
                    </tr>
                @endforeach

            </tbody>
        </table>
    @endforeach
@endsection
