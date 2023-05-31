<%--
  Created by IntelliJ IDEA.
  User: ny
  Date: 14/05/2023
  Time: 16:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<style>
    fieldset{
        width: 70%;
    }
    input{
        margin-bottom: 1rem;
    }
    .message{
        color: lightseagreen;
    }

</style>
<body>
<div class="container">
<c:if test="${message != null}">
    <span class="message" id="message">${message}</span><br>
</c:if>
<h2> Create New Product</h2>
<form method="post" action="/products?action=create">
    <fieldset>
        <legend>New Product:</legend>
        <label for="name">Name</label>
        <input type="text" id="name" name="name">
        <br>
        <label for="price">Price</label>
        <input type="number" id="price" name="price">
        <br>
        <label for="des">Description</label>
        <input type="text" id="des" name="description">
        <br>
        <label for="image">Image URL</label>
        <input type="text" id="image" name="image">
        <br>
        <input type="submit">
    </fieldset>
</form>
<a href="/products">Back</a>
</div>
<script>
    setTimeout(function() {
        document.getElementById("message").innerHTML = ""
    }, 2000);
</script>
</body>
</html>
