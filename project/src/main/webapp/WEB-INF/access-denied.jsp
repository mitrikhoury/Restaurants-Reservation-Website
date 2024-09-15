<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Access Denied</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .access-denied-container {
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: #f8d7da;
        }
        .access-denied-content {
            text-align: center;
            background-color: #ffffff;
            border: 1px solid #f5c6cb;
            border-radius: 5px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        .access-denied-content h1 {
            color: #721c24;
        }
        .access-denied-content p {
            color: #721c24;
        }
        .btn-home {
            margin-top: 15px;
        }
        
         .image {
			height: 100px;
			margin-right: 20px;
			margin-top: 10px;
			position: relative;
			right: 100px;
        }

    </style>
</head>
<body>

<!-- Header -->
	<header class=" navbar-expand-lg navbar-light text-black py-3 mb-4"
		style="background-color: #ECF9FF">
		<div class="container">
			<img class="image" src="${pageContext.request.contextPath}/pic.png"
				alt="MK Restaurant Logo">
		</div>
	</header>

    <div class="access-denied-container">
        <div class="access-denied-content">
            <h1>Access Denied</h1>
            <p>You do not have permission to view this page.</p>
            <a href="/home" class="btn btn-primary btn-home">Go to Home</a>
        </div>
    </div>
    
    <!-- Footer -->
	<footer class=" text-black py-4 mt-5" style="background-color: #ECF9FF">
		<div class="container text-center">
			<p class="mb-0">© 2024 MK Restaurant. All rights reserved.</p>
			<p class="mb-0">123 Main Street, City, Country</p>
			<p class="mb-0">Email: contact@mkrestaurant.com | Phone:
				+123-456-7890</p>
		</div>
	</footer>
    
    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
