<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Loan Guarantee Request</title>
    <style>
        /* Add some basic email client styles */
        body,
        html {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
        }

        .container {
            background-color: #fff;
            max-width: 600px;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            font-size: 24px;
            color: #333;
        }

        p {
            font-size: 16px;
            color: #555;
        }

        .btn {
            display: inline-block;
            background-color: #305e30;
            color: #fff !important;
            padding: 10px 20px;
            text-decoration: none !important;
            font-weight: bold;
            border-radius: 3px;
            margin-top: 15px;
        }

        .footer {
            margin-top: 20px;
            font-size: 14px;
            color: #888;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        table,
        th,
        td {
            border: 1px solid #333;
        }

        th,
        td {
            padding: 10px;
            text-align: left;
        }
    </style>
</head>

<body>
    <div class="container">
        <h1>Loan Guarantee Request</h1>
        <p>You have been requested to guarantee a loan for a fellow member. Below are the loan details:</p>

        <!-- Loan Details Table -->
        <table>
            <tr>
                <th>Loan Type</th>
                <th>Loan Amount</th>
                <th>Guarantee Amount</th>
            </tr>
            <tr>
                <td>{{ $loan->loanType->name }}</td>
                <td>{{ $loan->amount }}</td>
                <td>{{ $guarantor->guarantee_amount }}</td>
            </tr>
        </table>

        <p>To confirm your guarantee, click the button below:</p>
        <a class="btn" href="{{ $url }}">Confirm Guarantee</a>

        <p>If you choose not to proceed with this guarantee request, you can ignore this email.</p>
        <div class="footer">
            <p>Contact us at <a href="#">sacco@fhts.co.ke</a></p>
        </div>
    </div>
</body>

</html>
