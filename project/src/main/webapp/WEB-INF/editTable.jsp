<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Table</title>
</head>
<body>

	<h2>Edit Table</h2>
	<form action="/tables/${table.getTableId()}/edit" method="post" >
		<label for="nameGuest">Name Guest:</label> 
		<input type="text" id="nameGuest"name="nameGuest" value="${table.getNameGuest()}" required><br>
		 <label for="numberOfGuests">Number Of Guest:</label> 
		 <input type="number" id="numberOfGuests" name="numberOfGuests" value="${table.getNumberOfGuests()}" required><br>
		<label for="notes">Notes:</label>
		<textarea id="notes" name="notes" required>${table.getNotes()}</textarea>
		<br> <input type="submit" value="Submit" >
	</form>
	<a href="/home">back to Home Page</a>
</body>
</html>