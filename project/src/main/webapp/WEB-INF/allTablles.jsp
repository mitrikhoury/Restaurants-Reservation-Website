<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Tables</title>
<!-- Bootstrap CSS -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

    <!-- Header -->
    <header class=" navbar-expand-lg navbar-light text-black py-3 mb-4" style="background-color: #e3f2fd">
        <div class="container">
            <h1 class="display-4">MK Restaurant</h1>
            <nav class="navbar navbar-expand-lg navbar-light " style="background-color: #e3f2fd">
                <a class="navbar-brand" href="/home">Home</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item"><a class="nav-link" href="#tables">Tables</a></li>
                        <li class="nav-item"><a class="nav-link" href="#open_tables">Open Tables</a></li>
                    </ul>
                </div>
            </nav>
        </div>
    </header>

    <!-- Main Content -->
    <div class="container">
        <h1 class="my-4">
           All Tables
        </h1>

        <!-- All Tables Section -->
        <section id="tables" class="mb-5">   
            <h2>Tables</h2>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Guest Name</th>
                        <th>Number of Guests</th>
                        <th>Arrived At</th>
                        <th>Server</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="table" items="${Tables}">
                        <tr>
                            <td><c:out value="${table.nameGuest}"/></td>
                            <td><c:out value="${table.numberOfGuests}"/></td>
                            <td><c:out value="${table.createdAt}"/></td>
                            <td><c:out value="${table.user.username}"/></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </section>

        <!-- Open Tables Section -->
        <section id="open_tables">
            <h1 class="mb-4">Open Tables</h1>
            <h2>Tables</h2>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Guest Name</th>
                        <th>Number of Guests</th>
                        <th>Arrived At</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="tables" items="${Open_table}">
                        <tr>
                            <td><c:out value="${tables.nameGuest}"/></td>
                            <td><c:out value="${tables.numberOfGuests}"/></td>
                            <td><c:out value="${tables.createdAt}"/></td>
                            <td>
                                <form action="/Pick_Up_Table/${tables.getTableId()}" method="post">
                                    <button type="submit" class="btn btn-primary">Pick Up Table</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </section>
    </div>

    <!-- Footer -->
    <footer class="text-black py-3 mt-4" style="background-color: #e3f2fd">
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
