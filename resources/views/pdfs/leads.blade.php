@extends('pdfs.header')
@section('content')
    <table class="table data">
        <thead class="thead">
            <tr>
                <td>Lead</td>
                <td>Branch</td>
                <td>Phone Number</td>
                <td>Address</td>
                <td>Date Created</td>
            </tr>
        </thead>
        <tbody>
            @foreach ($leads as $item)
                <tr>
                    <td>{{ $item->first_name }} {{ $item->last_name }}</td>
                    <td>{{ $item->branch->name }}</td>
                    <td>{{ $item->phone }}</td>
                    <td>{{ $item->residential_address }}</td>
                    <td>{{ date('d M Y', strtotime($item->created_at)) }}</td>
                </tr>
            @endforeach
        </tbody>
    </table>
@endsection
