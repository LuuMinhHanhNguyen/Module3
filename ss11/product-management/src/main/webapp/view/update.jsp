<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ny
  Date: 14/05/2023
  Time: 18:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<style>
    fieldset{
        width: 50%;
    }
    input{
        margin-bottom: 1rem;
    }
    .message{
        color: lightseagreen;
    }
</style>
<body>
<c:if test="${message != null}">
    <span class="message">${message}</span>
</c:if>

<form method="post">
    <fieldset>
        <legend>Update Product</legend>
        <label for="name">Name:</label>
        <input type="text" id="name" value="${product.getName()}" name="newName">
        <br>
        <label for="price">Price:</label>
        <input type="number" id="price" value="${product.getPrice()}" name="newPrice">
        <br>
        <label for="des">Description:</label>
        <input type="text" id="des" value="${product.getDescription()}" name="newDescription">
        <br>
        <input type="submit">
    </fieldset>
</form>
<a href="/products">Back</a>
<script>
    let message = document.querySelector(".message");
    setTimeout(function (){
        message.innerHTML = "";
    }, 3000);
</script>
</body>
</html>
