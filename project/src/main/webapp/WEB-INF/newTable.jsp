<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Table</title>
<!-- Bootstrap CSS -->
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

    <!-- Header -->
    <header class=" text-black py-3 mb-4" style="background-color: #ECF9FF">
        <div class="container">
            <img class="image" src="${pageContext.request.contextPath}/pic.png" alt="MK Restaurant Logo">
            <nav class="navbar text-black navbar-expand-lg navbar-dark " style="background-color: #ECF9FF">
                <a class="navbar-brand" style="color: black" href="/home">Home</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
            </nav>
        </div>
    </header>

    <!-- Main Content -->
    <div class="container">
        <h2 class="my-4">Add New Table</h2>

        <form:form method="POST" action="/tables/new" modelAttribute="table" class="form-group">
            <div class="form-group">
                <form:label path="nameGuest" cssClass="form-label">Guest Name:</form:label>
                <form:input path="nameGuest" cssClass="form-control"/>
            </div>
            <div class="form-group">
                <form:label path="numberOfGuests" cssClass="form-label">Number of Guests:</form:label>
                <form:input path="numberOfGuests" type="number" cssClass="form-control"/>
            </div>
            <div class="form-group">
                <form:label path="notes" cssClass="form-label">Notes:</form:label>
                <form:errors path="notes" cssClass="text-danger"/>
                <form:textarea path="notes" cssClass="form-control"/>
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form:form>
    </div>

    <!-- Footer -->
    <footer class=" text-black py-3 mt-4" style="background-color: #ECF9FF">
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
