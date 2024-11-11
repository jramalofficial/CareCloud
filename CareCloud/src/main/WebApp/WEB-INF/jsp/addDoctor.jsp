<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Doctor</title>
    <style>
        /* Add some styling */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 50%;
            margin: auto;
            padding: 20px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
        }
        label {
            font-weight: bold;
            margin-top: 10px;
            display: block;
        }
        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        input[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 18px;
            cursor: pointer;
            margin-top: 20px;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        #passwordMessage {
            color: red;
            font-size: 0.9em;
        }
    </style>

    <script>
        function validatePassword() {
            const password = document.getElementById("password").value;
            const message = document.getElementById("passwordMessage");
            const strongPassword = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[\W_]).{8,}$/;

            if (strongPassword.test(password)) {
                message.style.color = 'green';
                message.textContent = "Password is strong";
                return true; // Allow form submission if password is strong
            } else {
                message.style.color = 'red';
                message.textContent = "Password should contain at least 8 characters, including uppercase, lowercase, number, and special character.";
                return false; // Prevent form submission if password is weak
            }
        }

        function validateForm() {
            return validatePassword(); // Validate the password before form submission
        }
    </script>
</head>
<body>

<div class="container">
    <h2>Add Doctor</h2>

    <form action="/hospital/addDoctor" method="post" onsubmit="return validateForm()">
        <label for="name">Doctor's Name:</label>
        <input type="text" id="name" name="name" placeholder="Enter Doctor's Name" required>

        <label for="specialization">Specialization:</label>
        <input type="text" id="specialization" name="specialization" placeholder="Enter Specialization" required>

        <label for="username">Username:</label>
        <input type="text" id="username" name="username" placeholder="Assign a Username" required>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" placeholder="Assign a Password" oninput="validatePassword()" required>
        <p id="passwordMessage"></p>

        <input type="submit" value="Add Doctor">
    </form>
</div>

</body>
</html>
