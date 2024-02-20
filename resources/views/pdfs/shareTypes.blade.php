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
            @foreach ($shareTypes as $item)
                <tr>
                    <td>{{ $item->category }}</td>
                    <td>{{ $item->has_recurrent_contribution}}</td>
                    <td>{{ $item->dividend_percentage }}</td>
                    <td>{{ $item->can_be_withdrawn }}</td>
                    <td>{{ $item->max_amount }}</td>
                    <td>{{ $item->min_amount }}</td>
                    <td>{{ $item->can_be_transferred }}</td>
                </tr>
            @endforeach
        </tbody>
    </table>
@endsection
