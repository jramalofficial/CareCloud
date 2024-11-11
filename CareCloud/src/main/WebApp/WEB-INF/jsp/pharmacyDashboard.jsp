<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pharmacy Dashboard</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #e9ecef;
        }
        .container {
            margin-top: 20px;
        }
        .nav-link {
            font-size: 1.2rem;
        }
        h1 {
            margin-bottom: 20px;
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
        <h1 class="text-center">Welcome to the Pharmacy Dashboard</h1>
        <div class="text-right">
            <a href="/pharmacy/logout" class="btn btn-danger">Logout</a>
        </div>
        
        <div class="row">
            <div class="col-md-12">
                <div class="card text-white bg-success">
                    <div class="card-body">
                        <h5 class="card-title">View Prescriptions</h5>
                        <p class="card-text">Access all prescriptions from doctors.</p>
                        <a href="/pharmacy/viewPrescriptions" class="btn btn-light">Go</a>
                    </div>
                </div>
            </div>
        </div>
        
        <h2>Recent Activities</h2>
        <!-- Placeholder for recent activities or statistics -->
    </div>
    
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
