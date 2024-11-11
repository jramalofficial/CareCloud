<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Prescriptions</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
        }
        .container {
            margin-top: 50px;
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            margin-bottom: 30px;
            color: #343a40;
        }
        .table {
            margin-top: 20px;
        }
        thead {
            background-color: #343a40;
            color: white;
        }
        .btn-secondary {
            display: block;
            width: 150px;
            margin: 30px auto 0;
            background-color: #343a40;
            border: none;
        }
        .btn-secondary:hover {
            background-color: #495057;
        }
        p {
            text-align: center;
            margin-top: 30px;
            font-size: 1.2rem;
            color: #6c757d;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Prescriptions List</h1>

    <!-- Check if there are any prescriptions -->
    <table class="table table-bordered table-hover">
        <thead>
            <tr>
                <th>Prescription ID</th>
                <th>Patient ID</th>
                <th>Patient Name</th>
                <th>Symptoms</th>
                <th>Diagnosis</th>
                <th>Prescription Details</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="prescription" items="${prescriptions}">
                <tr>
                    <td>${prescription.id}</td>
                    <td>${prescription.patient.id}</td>
                    <td>${prescription.patient.name}</td>
                    <td>${prescription.symptoms}</td>
                    <td>${prescription.diagnosis}</td>
                    <td>${prescription.prescriptionDetails}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <!-- If no prescriptions are available -->
    <c:if test="${empty prescriptions}">
        <p>No prescriptions available at the moment.</p>
    </c:if>

    <!-- Back to dashboard link -->
    <a href="/pharmacy/dashboard" class="btn btn-secondary mt-3">Back to Dashboard</a>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
