<%--
  Created by IntelliJ IDEA.
  User: ny
  Date: 15/05/2023
  Time: 10:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="/products">Back</a><br>
<table>
    <tr><td>Name: ${product.getName()}</td></tr>
    <tr><td>Price: ${product.getPrice()}</td></tr>
    <tr><td>Description: ${product.getDescription()}</td></tr>
    <tr><td>Image: <img src="${product.getImage()}"></td></tr>
</table>
</body>
</html>
