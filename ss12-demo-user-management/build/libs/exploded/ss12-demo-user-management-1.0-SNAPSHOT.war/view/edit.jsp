<%--
  Created by IntelliJ IDEA.
  User: ny
  Date: 20/05/2023
  Time: 09:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit User</title>
</head>
<body>
<form method="post" action="/users?action=edit">
    <input type="hidden" name="id" value="${user.getId()}">
    Name: <input type="text" name="name" value="${user.getName()}"><br>
    Email: <input type="email" name="email" value="${user.getEmail()}"><br>
    Country: <input type="text" name="country" value="${user.getCountry()}"><br>
    <input type="submit">
</form>
</body>
</html>
