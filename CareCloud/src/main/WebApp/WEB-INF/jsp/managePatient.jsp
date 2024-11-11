<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Manage Patients</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"&gt;>
<style>
body {
font-family: Arial, sans-serif;
background-color: #f8f9fa;
}
.container {
margin-top: 100px;
text-align: center; /* Center-align the content */
}
h2 {
margin-bottom: 30px;
color: #343a40;
}
.btn {
font-size: 18px;
padding: 15px 30px; /* Increased padding for larger buttons */
margin: 15px;
border-radius: 10px;
transition: transform 0.2s, box-shadow 0.2s;
width: 200px; /* Fixed width for buttons */
}
.btn:hover {
transform: scale(1.05);
box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
}
.back-button {
font-size: 20px;
padding: 10px 20px;
display: inline-block;
margin-top: 30px;
}
</style>
</head>
<body>
<div class="container">
<h2>Manage Patients</h2>
<div class="d-flex justify-content-center">
<!-- Add Patient -->
<a href="/hospital/addPatient" class="btn btn-success">Add Patient</a>
<!-- View Patients -->
<a href="/hospital/viewPatients" class="btn btn-warning">View Patients</a>
</div>
<a href="/hospital/dashboard" class="btn btn-secondary back-button">Back to Dashboard</a>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script&gt;
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script&gt;
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script&gt;
</body>
</html>