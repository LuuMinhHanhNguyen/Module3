<%@ page import="com.example.productmanagement.model.Product" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ny
  Date: 14/05/2023
  Time: 18:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<style>
    input, a{
        text-decoration: none;
        padding: .5em 1em;
        background: deepskyblue;
        color: white;
        border: none;
        border-radius: 100px;
        font-size: 16px;
        font-family: Charter, serif;

    }
</style>

<body>

<form method="post">
    <h2>Are you sure to delete this product?</h2>
    <input type="submit" value="Yes">
    <a href="/products">No</a>
</form>

</body>

</html>
