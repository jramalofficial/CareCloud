<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Patient</title>
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
    <h2>Delete Patient</h2>
    <form action="/hospital/deletePatient" method="post">
        <div class="form-group">
            <label for="patientId">Patient ID</label>
            <input type="text" class="form-control" id="patientId" name="patientId" required>
        </div>
        <button type="submit" class="btn btn-danger btn-block">Delete Patient</button>
    </form>
    <a href="/hospital/managePatients" class="btn btn-secondary mt-4">Back to Manage Patients</a>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script&gt;
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script&gt;
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script&gt;
</body>
</html>