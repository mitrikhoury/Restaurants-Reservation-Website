<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Welcome Page</title>
</head>
<body>
	<div>
		<h1>
			Welcome Page
			<c:out value="${loggedInUser.username}"></c:out>
		</h1>

		<form id="logoutForm" method="POST" action="/logout">
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" /> <input type="submit" value="Logout!" />
		</form>
	</div>

	<div>
		<h1>Your Tables</h1>
		<table border="1">
			<tr>
				<th>Guest Name</th>
				<th>Number of Guests</th>
				<th>Notes</th>
				<th>Arrived At</th>
				<th>Actions</th>
			</tr>
			<c:forEach var="table" items="${userTables}">
				<tr>
					<td><c:out value="${table.nameGuest}" /></td>
					<td><c:out value="${table.numberOfGuests}" /></td>
					<td><c:out value="${table.notes}" /></td>
					<td><c:out value="${table.createdAt}" /></td>
					<td>
						<form action="/table/delete/${table.getTableId()}" method="post">
							<input type="submit" value="Finished">
						</form>


						<form action="/tables/${table.getTableId()}/edit" method="Get">
							<input type="submit" value="Edit">
						</form>


					</td>
				</tr>
			</c:forEach>
		</table>
	</div>

	<div>
		<form method="Get" action="/tables/new">
			<input type="submit" value=" + New Table" />
		</form>
	</div>

	<div>
		<a href="/tables">See Other Tables .</a>
	</div>

</body>
</html>
