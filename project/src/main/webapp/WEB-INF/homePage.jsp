<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome Page</title>
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
                        <li class="nav-item"><a class="nav-link" href="/tables/new">New Table</a></li>
                        <li class="nav-item"><a class="nav-link" href="/tables">See Other Tables</a></li>
                        <li class="nav-item"><a class="nav-link" href="/logout">Logout</a></li>
                    </ul>
                </div>
            </nav>
        </div>
    </header>

    <!-- Main Content -->
    <div class="container mt-4">
        <!-- Welcome Section -->
        <div class="mb-4">
            <h1>Welcome, <c:out value="${loggedInUser.username}"/></h1>
            <!-- 
            <form id="logoutForm" method="POST" action="/logout" class="mt-3">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                <button type="submit" class="btn btn-danger">Logout</button>
            </form>
             -->
        </div>

        <!-- Tables Section -->
        <div class="mb-4">
            <h3>Your Tables</h3>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Guest Name</th>
                        <th>Number of Guests</th>
                        <th>Notes</th>
                        <th>Arrived At</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="table" items="${userTables}">
                        <tr>
                            <td><c:out value="${table.nameGuest}" /></td>
                            <td><c:out value="${table.numberOfGuests}" /></td>
                            <td><c:out value="${table.notes}" /></td>
                            <td><c:out value="${table.createdAt}" /></td>
                            <td>
                                <form action="/table/delete/${table.getTableId()}" method="post" class="d-inline">
                                    <button type="submit" class="btn btn-danger btn-sm">Finished</button>
                                </form>
                                <form action="/tables/${table.getTableId()}/edit" method="Get" class="d-inline">
                                    <button type="submit" class="btn btn-primary btn-sm">Edit</button>
                                </form>
                                <form action="/Give_Up_Table/${table.getTableId()}" method="post" class="d-inline">
                                    <button type="submit" class="btn btn-secondary btn-sm">Give Up Table</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <!-- New Table Form -->
        <div class="mb-4">
            <form method="Get" action="/tables/new">
                <button type="submit" class="btn btn-primary">+ New Table</button>
            </form>
        </div>

        <!-- See Other Tables Link -->
        <div>
            <a href="/tables" class="btn btn-link">See Other Tables</a>
        </div>
    </div>

    <!-- Footer -->
    <footer class=" text-black py-4 mt-5" style="background-color: #e3f2fd">
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
