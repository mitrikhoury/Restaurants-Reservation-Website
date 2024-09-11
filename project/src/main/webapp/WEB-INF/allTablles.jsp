<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Tables</title>
</head>
<body>
<h1>Welcome <c:out value="${loggedInUser.username}"></c:out></h1>
<h1>All Tables </h1>

<p>tables</p>
<table border="1">
    <tr>
        <th>Guest Name</th>
        <th>Number of Guests</th>   
        <th>Arrived At</th>
        <th>Server</th>
    </tr>
    <c:forEach var="table" items="${Tables}">
        <tr>
            <td><c:out value="${table.nameGuest}"/></td>
            <td><c:out value="${table.numberOfGuests}"/></td>
            <td><c:out value="${table.createdAt}"/></td>
            <td><c:out value="${table.user.username}"/></td>
        </tr>
    </c:forEach>
</table>
<a ></a>
</body>
</html>