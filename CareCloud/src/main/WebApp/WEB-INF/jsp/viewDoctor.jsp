<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Doctors</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"&gt;>
    <style>
        table {
            margin-top: 20px;
        }
        h2 {
            margin-top: 20px;
        }
        .btn-action {
            margin: 0 5px;
        }
    </style>
</head>
<body>
<div class="container">
    <h2 class="text-center">Doctors Records</h2>
    <table class="table table-bordered table-hover">
        <thead class="thead-dark">
            <tr>
                <th>Doctor ID</th>
                <th>Name</th>
                <th>Specialization</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <!-- Loop through the list of patients -->
            <c:forEach var="doctor" items="${doctors}">
                <tr>
                    <td>${doctor.id}</td>
                    <td>${doctor.name}</td>
                    <td>${doctor.specialization}</td>
                    <td>
                        <!-- Action buttons for update and delete -->
                        <a href="/hospital/updateDoctor/${doctor.id}" class="btn btn-primary btn-action">Update</a>
                        <a href="/hospital/deleteDoctor/${doctor.id}" class="btn btn-danger btn-action">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <a href="/hospital/dashboard" class="btn btn-secondary">Back to Dashboard</a>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script&gt;
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script&gt;
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script&gt;
</body>
</html>