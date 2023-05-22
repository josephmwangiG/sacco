@extends('pdfs.header')
@section('content')
    <table class="table data">

        <tbody>
            <tr>
                <td>Loan Number</td>
                <td colspan="2">{{ $loan->loan_reference_number }}</td>
                <td>Loan Type</td>
                <td colspan="4">{{ $loan->loanType->name }}</td>
            </tr>
            <tr>
                <td>Approved Date</td>
                <td colspan="2">{{ $loan->loanApplication->approved_on }}</td>
                <td>Approved Amount</td>
                <td colspan="4">{{ $loan->amount_approved }}</td>
            </tr>
            <tr>
                <td>Guarantor No.</td>
                <td>Guarantor Name</td>
                <td>Amount Commited</td>
                <td>Replaced</td>
                <td>Outstanding
                    Balance</td>
                <td>Guarantee
                    Bal</td>
                <td>Guarantee Int </td>
                <td>Recovered</td>
            </tr>

            @foreach ($loan->loanApplication->guarantors as $item)
                <tr>
                    <td>{{ $item->member->id_number }}</td>
                    <td>{{ $item->member->user->first_name }} {{ $item->member->user->last_name }}</td>
                    <td>{{ $item->guarantee_amount }}</td>
                    <td>No</td>
                    <td>{{ $item->amount_approved - $loan->payments()->sum('amount') }}
                    </td>
                    <td>{{ $item->guarantee_amount - $loan->payments()->sum('amount') * (($item->guarantee_amount * 100) / $loan->amount_approved) }}
                    </td>
                    <td>12300 </td>
                    <td>No</td>
                </tr>
            @endforeach
        </tbody>
    </table>
@endsection
