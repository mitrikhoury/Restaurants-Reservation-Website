<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Registration Page</title>
<!-- Bootstrap CSS -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
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
	<!-- Header -->
	<header class=" navbar-expand-lg navbar-light text-black py-3 mb-4"
		style="background-color: #ECF9FF">
		<div class="container">
			<img class="image" src="${pageContext.request.contextPath}/pic.png"
				alt="MK Restaurant Logo">
			<nav class="navbar navbar-expand-lg navbar-light "
				style="background-color: #ECF9FF">
				<a class="navbar-brand"></a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarNav" aria-controls="navbarNav"
					aria-expanded="false" aria-label="Toggle navigation">
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

	<!-- Main Content -->
	<div class="container mt-5">
		<div class="row justify-content-center">
			<div class="col-md-6">



				<!-- Registration Form -->
				<div class="card">
					<div class="card-header text-center">
						<h3>Register!</h3>
					</div>
					<div class="card-body">
						<!-- Display Form Errors -->
						<!-- Form -->
						<form:form method="POST" action="/registration"
							modelAttribute="user">

							<div class="form-group">
								<form:label path="username" cssClass="form-label">Username:</form:label>
								<form:input path="username" cssClass="form-control" />
								<!-- Display the error message for the username field -->
								<form:errors path="username" cssClass="text-danger" />
							</div>

							<div class="form-group">
								<form:label path="email" cssClass="form-label">Email:</form:label>
								<form:input path="email" cssClass="form-control" />
								<!-- Display the error message for the email field -->
								<form:errors path="email" cssClass="text-danger" />
							</div>

							<div class="form-group">
								<form:label path="password" cssClass="form-label">Password:</form:label>
								<form:password path="password" cssClass="form-control" />
								<!-- Display the error message for the password field -->
								<form:errors path="password" cssClass="text-danger" />
							</div>

							<div class="form-group">
								<form:label path="passwordConfirmation" cssClass="form-label">Password Confirmation:</form:label>
								<form:password path="passwordConfirmation"
									cssClass="form-control" />
								<!-- Display the error message for the password confirmation field -->
								<form:errors path="passwordConfirmation" cssClass="text-danger" />
							</div>

							<button type="submit" class="btn btn-primary btn-block">Register!</button>
							<p class="text-center mt-3">
								Already have an account? <a href="/login"> Log in</a>
							</p>
						</form:form>
					</div>
				</div>
			</div>
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
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
