<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Patient</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <h2>Add New Patient</h2>
    <form action="/hospital/addPatient" method="post" onsubmit="return validateForm()">
        <div class="form-group">
            <label for="name">Patient Name:</label>
            <input type="text" class="form-control" id="name" name="name" placeholder="Enter patient name" required>
        </div>
        <div class="form-group">
            <label for="age">Patient Age:</label>
            <input type="number" class="form-control" id="age" name="age" placeholder="Enter patient age" required>
            <small id="ageError" class="text-danger"></small> <!-- Display error message here -->
        </div>
        <div class="form-group">
            <label for="bloodGroup">Blood Group:</label>
            <select class="form-control" id="bloodGroup" name="bloodGroup" required>
                <option value="" disabled selected>Select blood group</option>
                <option value="A+">A+</option>
                <option value="A-">A-</option>
                <option value="B+">B+</option>
                <option value="B-">B-</option>
                <option value="O+">O+</option>
                <option value="O-">O-</option>
                <option value="AB+">AB+</option>
                <option value="AB-">AB-</option>
            </select>
        </div>
        <div class="form-group">
            <label for="city">City:</label>
            <select class="form-control" id="city" name="city" required>
                <option value="" disabled selected>Select city</option>
                <option value="kollam">kollam</option>
                <option value="trivandrum">trivandrum</option>
                <option value="pathanamthitta">pathanamthitta</option>
                <option value="alapuzha">alapuzha</option>
                <option value="kottayam">kottayam</option>
                <option value="idukki">idukki</option>
                <option value="ernakulam">ernakulam</option>
                <option value="palakad">palakad</option>
            </select>
        </div>
        <div class="form-group">
            <label for="phone">Phone Number:</label>
            <input type="text" class="form-control" id="phoneNumber" name="phoneNumber" placeholder="Enter phone number" required>
            <small id="phoneError" class="text-danger"></small> <!-- Display error message here -->
        </div>
        <button type="submit" class="btn btn-primary">Add Patient</button>
        <a href="/hospital/managePatient" class="btn btn-secondary">Cancel</a>
    </form>
</div>

<script>
    function validateForm() {
        const phoneInput = document.getElementById("phoneNumber").value;
        const phoneError = document.getElementById("phoneError");
        const ageInput = document.getElementById("age").value;
        const ageError = document.getElementById("ageError");

        // Check if phone number contains exactly 10 digits
        if (!/^\d{10}$/.test(phoneInput)) {
            phoneError.textContent = "Phone number must be exactly 10 digits.";
            return false; // Prevent form submission
        } else {
            phoneError.textContent = ""; // Clear any previous error messages
        }

        // Validate age
        if (ageInput < 0 || ageInput > 120) {
            ageError.textContent = "Age must be between 0 and 120.";
            return false; // Prevent form submission
        } else {
            ageError.textContent = ""; // Clear any previous error messages
        }

        // If all validations pass, allow form submission
        return true; 
    }
</script>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
