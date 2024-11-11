<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>CARE CLOUD - Welcome</title>
    <link rel="stylesheet" href="<c:url value='/css/styles.css' />">
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Arial', sans-serif;
            background-image: url('https://www.apollohospitals.com/wp-content/themes/apollohospitals/assets-v3/images/speciality_ah_m.webp');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .overlay {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: rgba(0, 0, 0, 0.6);
            z-index: 1;
        }

        .container {
            position: relative;
            z-index: 2;
            text-align: center;
            color: white;
        }

        h1 {
            font-size: 60px;
            font-weight: bold;
            margin-bottom: 30px;
            letter-spacing: 2px;
        }

        .login-btn {
            display: inline-block;
            width: 200px;
            padding: 15px;
            margin: 10px;
            font-size: 18px;
            font-weight: bold;
            color: white;
            background-color: #4CAF50;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .login-btn:hover {
            background-color: #45a049;
        }

        .login-btn.hospital { background-color: #1e90ff; }
        .login-btn.doctor { background-color: #ff6347; }
        .login-btn.pharmacy { background-color: #32cd32; }

        .login-btn.hospital:hover { background-color: #4682b4; }
        .login-btn.doctor:hover { background-color: #ff4500; }
        .login-btn.pharmacy:hover { background-color: #2e8b57; }
    </style>
</head>
<body>

    <div class="overlay"></div>  <!-- Semi-transparent overlay for the background image -->

    <div class="container">
        <h1>CARE CLOUD</h1>
        <!-- Hospital Login Button -->
        <a href="/hospital/login" class="login-btn hospital">Hospital Login</a>

        <!-- Doctor Login Button -->
        <a href="/doctor/login" class="login-btn doctor">Doctor Login</a>

        <!-- Pharmacy Login Button -->
        <a href="/pharmacy/login" class="login-btn pharmacy">Pharmacy Login</a>
    </div>

</body>
</html>