<%--
  Created by IntelliJ IDEA.
  User: ny
  Date: 17/05/2023
  Time: 21:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>new user</title>
</head>
<body>
<a href="/users">Back</a>
<form method="post" action="/users">
<fieldset>
    <input type="hidden" name="action" value="create">
    <legend>Create New User</legend>
    <label for="name">Name:</label>
    <input type="text" id="name" name="name"><br><br>
    <label for="email">Email:</label>
    <input type="email" id="email" name="email"><br><br>
    <label for="country">Country:</label>
    <input type="text" id="country" name="country"><br><br>

    <input type="submit">
</fieldset>
</form>
</body>
</html>
