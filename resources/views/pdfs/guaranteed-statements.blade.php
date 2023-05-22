@extends('pdfs.header')
@section('content')
    <table class="table data">

        <tbody>

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

            @foreach ($guaranteed as $item)
                <tr>
                    <td>{{ $item->member->id_number }}</td>
                    <td>{{ $item->member->user->first_name }} {{ $item->member->user->last_name }}</td>
                    <td>{{ $item->guarantee_amount }}</td>
                    <td>No</td>
                    <td>{{ $item->loanApplication->loan->amount_approved - $item->loanApplication->loan->payments()->sum('amount') }}
                    </td>
                    <td>{{ $item->guarantee_amount - $item->loanApplication->loan->payments()->sum('amount') * (($item->guarantee_amount * 100) / $item->loanApplication->loan->amount_approved) }}
                    </td>
                    <td>12300 </td>
                    <td>No</td>
                </tr>
            @endforeach
        </tbody>
    </table>
@endsection
