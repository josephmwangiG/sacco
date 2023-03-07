<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>{{ $title }}</title>

    <style>
        * {}

        .table {
            width: 100%;
            border-collapse: collapse;
            border: 1px solid #ccc;
            font-size: 13px;
            font-family: sans-serif, Courier, monospace;
        }

        .table th,
        .table td {
            width: 100%;
            background: none;
            border: 1px solid #ccc;
            padding: 3px;
            width: 0%;
            min-width: fit-content;
        }

        .data th,
        .data td {
            padding: 7px 5px;
        }

        .table.client,
        .table.data {
            margin-top: 15px;
        }

        .table.text-center {
            text-align: center;
        }

        .table.borderless {
            border: none !important;
        }

        .table.borderless td,
        .table.borderless th {
            border: none;
        }

        .icon img {
            width: 100%;
            width: 130px;
            object-fit: cover;
        }

        table.h4 {
            padding: 0;
            margin: 0;
        }

        tr.header {
            font-weight: 900;
            color: #ffffff;
            background: #ea6153;
        }

        tr.green {
            background: #27ae60;
        }

        tr.blue {
            background: #2980b9;
        }

        table tr {
            display: table-row;
            background: #c7a2a2;
        }

        tr {
            background-color: #a09d9d !important;
        }

        .thead td,
        .thead th {
            background-color: rgb(88, 88, 88);
            color: white;
            border: rgb(88, 88, 88);
        }

        .data>tbody tr:nth-child(even) td {
            background-color: rgb(240, 240, 240);
        }
    </style>
</head>

<body>
    <table class="table borderless">
        <tr>
            <td class="icon" style="width: 10%">
                <img src="data:image/png;base64,{{ base64_encode(file_get_contents(public_path('images/logo-2.png'))) }}"
                    alt="">
            </td>
            <td style="width: 35%">
                <table class="table borderless">
                    <tr>
                        <td colspan="2">
                            <b>{{ $organization->business_name }}</b>
                        </td>
                    </tr>
                    <tr>
                        <td>facebook: {{ $organization->business_name }}</td>
                    </tr>
                    <tr>
                        <td>IG: {{ $organization->business_name }}</td>
                    </tr>
                    <tr>
                        <td>twitter: {{ $organization->business_name }}</td>
                    </tr>
                </table>
            </td>
            <td style="width: 55%">
                <table class="table borderless">
                    <tr>
                        <td colspan="2" style="">
                            <b>{{ $title }}</b>
                        </td>
                    </tr>
                    <tr>
                        <td>Date</td>
                        <td>{{ date('d M Y') }}</td>
                    </tr>
                    <tr>
                        <td>{{ $items_name }}</td>
                        <td>{{ $items_count }}</td>
                    </tr>
                    <tr>
                        <td>Loan Details</td>
                        <td>Loan Details</td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    @if (isset($client))
        <table class="table client">
            <thead class="thead">
                <tr>
                    <td>Company Info</td>
                    <td>Customer Info</td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>
                        <table class="table borderless">
                            <tr>
                                <td>Sacco</td>
                            </tr>
                            <tr>
                                <td>Sacco</td>
                            </tr>
                            <tr>
                                <td>Sacco</td>
                            </tr>
                            <tr>
                                <td>Sacco</td>
                            </tr>
                            <tr>
                                <td>Sacco</td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <table class="table borderless">
                            <tr>
                                <td>Sacco</td>
                            </tr>
                            <tr>
                                <td>Sacco</td>
                            </tr>
                            <tr>
                                <td>Sacco</td>
                            </tr>
                            <tr>
                                <td>Sacco</td>
                            </tr>
                            <tr>
                                <td>Sacco</td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </tbody>
        </table>
    @endif
    @yield('content')

</body>

</html>
