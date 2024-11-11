<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doctor Dashboard</title>
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
        .center-card {
            display: flex;
            justify-content: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="text-center mt-4">Welcome, ${doctor.name}!</h1>
        <div class="text-right">
            <a href="/doctor/logout" class="btn btn-danger">Logout</a>
        </div>
        
        <!-- Centering the Add Prescription Card -->
        <div class="row center-card">
            <div class="col-md-6">
                <div class="card text-white bg-primary">
                    <div class="card-body">
                        <h5 class="card-title">Add Prescription</h5>
                        <p class="card-text">Create new prescriptions for your patients.</p>
                        <a href="/doctor/addPrescription?doctorId=${doctor.id}" class="btn btn-light">Go</a>
                    </div>
                </div>
            </div>
        </div>
        
        <h2 class="text-center">Your Patients</h2>
        <!-- Placeholder for patient list or details -->
    </div>
    
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
