<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Table</title>
</head>
<body>

	<div>
		<h1>New Table</h1>


		<form:form method="POST" action="/tables/new" modelAttribute="table">
			<p>
				<form:label path="nameGuest">Guest Name:</form:label>
				<form:input path="nameGuest" />
			</p>
			<p>
				<form:label path="numberOfGuests">Number of Guests:</form:label>
				<form:input path="numberOfGuests" type="number" />
			</p>
			<p>
				<form:label path="notes">notes</form:label>
				<form:errors path="notes" />
				<form:textarea path="notes" />
			</p>
            
			<input type="submit" value="Submit!" />
		</form:form>

	</div>
</body>
</html>