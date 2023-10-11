<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Password Reset Email</title>
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
    </style>
</head>

<body>
    <div class="container">
        <h1>Password Reset</h1>
        <p>You have requested to reset your password. To reset your password, click the button below:</p>
        <a class="btn" href="{{ $url }}">Reset Password</a>
        <p>If you did not request a password reset, you can ignore this email.</p>
        <div class="footer">
            <p>Contact us at <a href="mailto:info@example.com">sacco@fhts.co.ke</a></p>
        </div>
    </div>

</body>

</html>