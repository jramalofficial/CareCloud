<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Patient</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"&gt;>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
        }
        .container {
            margin-top: 50px;
        }
        h2 {
            margin-bottom: 30px;
            text-align: center;
            color: #343a40;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Update Patient</h2>
    <form action="/hospital/updatePatient" method="post">
    <input type="hidden" name="id" value="${patient.id}">
    
    <div class="form-group">
        <label for="name">Name:</label>
        <input type="text" class="form-control" id="name" name="name" value="${patient.name}">
    </div>
    <div class="form-group">
        <label for="age">Age:</label>
        <input type="number" class="form-control" id="age" name="age" value="${patient.age}">
    </div>
    <div class="form-group">
        <label for="city">City:</label>
        <input type="text" class="form-control" id="city" name="city" value="${patient.city}">
    </div>
    <div class="form-group">
        <label for="phoneNumber">Phone:</label>
        <input type="text" class="form-control" id="phoneNumber" name="phoneNumber" value="${patient.phoneNumber}">
    </div>
    <div class="form-group">
        <label for="bloodGroup">Blood Group:</label>
        <input type="text" class="form-control" id="bloodGroup" name="bloodGroup" value="${patient.bloodGroup}">
    </div>
    
    <button type="submit" class="btn btn-primary">Update Patient</button>
</form>
<a href="/hospital/viewPatients" class="btn btn-secondary">Cancel</a>


<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script&gt;
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script&gt;
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script&gt;
</body>
</html>