<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Table</title>
<!-- Bootstrap CSS -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

    <!-- Header -->
     <header class=" navbar-expand-lg navbar-light text-black py-3 mb-5" style="background-color: #e3f2fd">
        <div class="container">
            <h1 class="display-4">MK Restaurant</h1>
            <nav class="navbar navbar-expand-lg navbar-light " style="background-color: #e3f2fd">
                <a class="navbar-brand" href="/home">Home</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
            </nav>
        </div>
    </header>

    <!-- Main Content -->
    <div class="container">
        <h2 class="my-4">Edit Table</h2>
        <form action="/tables/${table.getTableId()}/edit" method="post">
            <div class="form-group">
                <label for="nameGuest">Name Guest:</label>
                <input type="text" id="nameGuest" name="nameGuest" class="form-control" value="${table.getNameGuest()}" required>
            </div>
            <div class="form-group">
                <label for="numberOfGuests">Number Of Guests:</label>
                <input type="number" id="numberOfGuests" name="numberOfGuests" class="form-control" value="${table.getNumberOfGuests()}" required>
            </div>
            <div class="form-group">
                <label for="notes">Notes:</label>
                <textarea id="notes" name="notes" class="form-control" required>${table.getNotes()}</textarea>
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
    </div>

    <!-- Footer -->
    <footer class=" text-black py-5 mt-5" style="background-color: #e3f2fd">
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
