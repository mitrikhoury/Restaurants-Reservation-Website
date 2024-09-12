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
</head>
<body>
	<!-- Header -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<p class="navbar-brand">MK Restaurant</p>
	</nav>

	<!-- Main Content -->
	<div class="container mt-5">
		<div class="row justify-content-center">
			<div class="col-md-6">
				<h1 class="text-center mb-4">Register!</h1>

				<!-- Registration Form -->
				<div class="card">
					<div class="card-body">
						<!-- Display Form Errors -->
						<c:if
							test="${not empty org.springframework.validation.BindingResult.user}">
							<div class="alert alert-danger">
								<c:forEach
									items="${org.springframework.validation.BindingResult.user.allErrors}"
									var="error">
									<p>${error.defaultMessage}</p>
								</c:forEach>
							</div>
						</c:if>
						<c:if test="${errorRegistration != null}">
							<div class="alert alert-danger" role="alert">
								<c:out value="${errorRegistration}"></c:out>
							</div>
						</c:if>
						<!-- Form -->
						<form:form method="POST" action="/registration"
							modelAttribute="user">
							<div class="form-group">
								<form:label path="username" cssClass="form-label">Username:</form:label>
								<form:input path="username" cssClass="form-control" />
							</div>
							<div class="form-group">
								<form:label path="email" cssClass="form-label">Email:</form:label>
								<form:input path="email" cssClass="form-control" />
							</div>
							<div class="form-group">
								<form:label path="password" cssClass="form-label">Password:</form:label>
								<form:password path="password" cssClass="form-control" />
							</div>
							<div class="form-group">
								<form:label path="passwordConfirmation" cssClass="form-label">Password Confirmation:</form:label>
								<form:password path="passwordConfirmation"
									cssClass="form-control" />
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
	<footer class="bg-light py-3 mt-5">
		<div class="container text-center">
			<p class="mb-0">© 2024 MyApp. All rights reserved.</p>
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
