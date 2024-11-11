<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Prescription</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h2>Add Prescription</h2>

    <!-- Form for adding a prescription -->
    <form action="/doctor/addPrescription" method="post">
        
        <!-- Dropdown for selecting a patient -->
        <div class="form-group">
            <label for="patient">Select Patient:</label>
            <select class="form-control" id="patient" name="patientId" required>
                <option value="" disabled selected>Select a patient</option>
                <c:forEach var="patient" items="${patients}">
                    <option value="${patient.id}">${patient.id} ${patient.name}</option>
                </c:forEach>
            </select>
        </div>

        <!-- Hidden input for doctor ID -->
        <input type="hidden" name="doctorId" value="${doctor.id}" />

        <!-- Input for symptoms -->
        <div class="form-group">
            <label for="symptoms">Symptoms:</label>
            <input type="text" class="form-control" id="symptoms" name="symptoms" required>
        </div>

        <!-- Input for diagnosis -->
        <div class="form-group">
            <label for="diagnosis">Diagnosis:</label>
            <input type="text" class="form-control" id="diagnosis" name="diagnosis" required>
        </div>

        <!-- Input for prescription details -->
        <div class="form-group">
            <label for="prescriptionDetails">Prescription Details:</label>
            <textarea class="form-control" id="prescriptionDetails" name="prescriptionDetails" rows="3" required></textarea>
        </div>

        <!-- Submit button -->
        <button type="submit" class="btn btn-primary">Add Prescription</button>
    </form>

    <!-- Back to dashboard link -->
    <a href="/hospital/dashboard" class="btn btn-secondary mt-3">Back to Dashboard</a>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
