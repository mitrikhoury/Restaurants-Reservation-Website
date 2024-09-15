<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login Page</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<style>
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

<header class=" navbar-expand-lg navbar-light text-black py-3 mb-4"
		style="background-color: #ECF9FF"">
		<div class="container">
			<img class="image" src="${pageContext.request.contextPath}/pic.png"
				alt="MK Restaurant Logo">
				<nav class="navbar navbar-expand-lg navbar-light " style="background-color: #ECF9FF">
                <a class="navbar-brand"></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item"><a class="nav-link" href="/">Home</a></li>
                    </ul>
                </div>
            </nav>
		</div>
	</header>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <!-- Display Logout Message -->
            <c:if test="${logoutMessage != null}">
                <div class="alert alert-success" role="alert">
                    <c:out value="${logoutMessage}"></c:out>
                </div>
            </c:if>
            <!-- Display Error Message -->
            <c:if test="${errorMessage != null}">
                <div class="alert alert-danger" role="alert">
                    <c:out value="${errorMessage}"></c:out>
                </div>
            </c:if>
            <!-- Login Form -->
            <div class="card">
                <div class="card-header text-center">
                    <h3>Login</h3>
                </div>
                <div class="card-body">
                    <form method="POST" action="/loginn">
                        <div class="form-group">
                            <label for="email">Email:</label>
                            <input type="text" class="form-control" id="email" name="email" required />
                        </div>
                        <div class="form-group">
                            <label for="password">Password:</label>
                            <input type="password" class="form-control" id="password" name="password" required />
                        </div>
                        <!-- CSRF Token -->
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        <button type="submit" class="btn btn-primary btn-block">Login</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<footer class=" text-black py-4 mt-5" style="background-color: #ECF9FF"">
        <div class="container text-center">
            <p class="mb-0">© 2024 MK Restaurant. All rights reserved.</p>
            <p class="mb-0">123 Main Street, City, Country</p>
            <p class="mb-0">Email: contact@mkrestaurant.com | Phone: +123-456-7890</p>
        </div>
    </footer>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
