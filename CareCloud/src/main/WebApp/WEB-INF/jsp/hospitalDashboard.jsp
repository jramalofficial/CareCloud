<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BTECH HOSPITAL Dashboard</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"&gt;>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #e9ecef;
        }
        .container {
            margin-top: 20px;
        }
        .card {
            margin: 20px 0;
            transition: transform 0.2s;
        }
        .card:hover {
            transform: scale(1.05);
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="text-center">Welcome to BTECH HOSPITAL Dashboard</h1>
        <div class="text-right">
            <a href="/hospital/logout" class="btn btn-danger">Logout</a>
        </div>

        <div class="row">
            <!-- Patient Section -->
            <div class="col-md-4">
                <div class="card text-white bg-success">
                    <div class="card-body">
                        <h5 class="card-title">Patient</h5>
                        <p class="card-text">Manage patient records: Add, Update, Delete, or View.</p>
                        <a href="/hospital/managePatient" class="btn btn-light">Go</a>
                    </div>
                </div>
            </div>

            <!-- Doctor Section -->
            <div class="col-md-4">
                <div class="card text-white bg-primary">
                    <div class="card-body">
                        <h5 class="card-title">Doctor</h5>
                        <p class="card-text">Manage doctor records: Add, Update, Delete, or View.</p>
                        <a href="/hospital/manageDoctor" class="btn btn-light">Go</a>
                    </div>
                </div>
            </div>

            <!-- Pharmacy Section -->
            <div class="col-md-4">
                <div class="card text-white bg-info">
                    <div class="card-body">
                        <h5 class="card-title">Pharmacy</h5>
                        <p class="card-text">Manage pharmacy records: USERNAME PASSWORD</p>
                        <a href="/hospital/managePharmacy" class="btn btn-light">Go</a>
                    </div>
                </div>
            </div>
        </div>

        <h2>Recent Activities</h2>
        <!-- Placeholder for recent activities or statistics -->
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script&gt;
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script&gt;
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script&gt;
</body>
</html>