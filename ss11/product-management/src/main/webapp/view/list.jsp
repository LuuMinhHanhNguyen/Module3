<%--
  Created by IntelliJ IDEA.
  User: ny
  Date: 14/05/2023
  Time: 15:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/search-bar.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://kit.fontawesome.com/4bf93b0ca4.js" crossorigin="anonymous"></script>
</head>
<style class="my-style">
    <%@include file="/WEB-INF/search-bar.css"%>

    img {
        width: 50px;
        height: 50px;
    }

    table, th, td {
        border: 1px lightseagreen solid;
        border-collapse: collapse;
    }

    td {
        font-weight: bold;
        width: 150px;
    }

    .btn {
        text-decoration: none;
        padding: 1em 2em;
        border: 0;
        background: lightseagreen;
        border-radius: 100px;
        margin-bottom: 1rem;
        margin-right: 3rem;
        display: inline-block;
    }

    h4 {
        color: red;
        margin-bottom: .5rem;
    }


    .inner-form {
        display: flex;
        justify-content: space-evenly;
    }

    .delete--btn:hover {
        cursor: pointer;
    }
    .delete--dialog{
        display: none;
        position: absolute;
        top:40%;
        left: 35%;
        right: 35%;
        z-index: 999;
        background: darkseagreen;
        padding: 3rem;
        opacity: .90;
    }

</style>
<body>
<div class="container">
    <h2>Product Management</h2><br>
    <div class="btn-and-search-bar">
        <div>
            <a href="/products?action=create" class="btn">Add New Product</a>
            <a href="/products" class="btn">Show All Product</a>
        </div>

        <div>
            <form method="get" action="/products" class="search-bar">
                <input type="hidden" name="action" value="search">
                <input type="text" class="search-bar__input" placeholder="enter your search" name="searchInfo">
                <button type="submit" class=" search-bar__submit"><i class="fas fa-search"></i></button>
            </form>
        </div>
    </div>
    <br>

    <c:if test="${message != null}">
        <h4 class="message">${message}</h4>
    </c:if>

    <table>
        <tr>
            <td>Product Name</td>
            <td>Product Price</td>
            <td>Product Description</td>
            <td>Product Image</td>
        </tr>
        <c:forEach var="product" items="${foundProducts.size() > 0 ? foundProducts :products}">
            <tr>
                <td><a href="/products?action=view&id=${product.getId()}">${product.getName()}</a></td>
                <td>${product.getPrice()}</td>
                <td>${product.getDescription()}</td>
                <td><img src="${product.getImage()}"></td>
                <td><a href="/products?action=update&id=${product.getId()}">Edit</a></td>
                <td onclick="showCfDialog(${product.getId()})" class="delete--btn">Delete</td>
                <div class="delete--dialog" id="${product.getId()}">
                    <h2>Are you sure to delete this product ${product.getName()}?</h2><br>
                    <form class="inner-form" method="post" action="/products?action=delete">
                        <input type="hidden" name="id" value="${product.getId()}">
                        <input type="submit" class="btn" name="cf" value="Yes">
                        <input type="submit" class="btn" name="cf" value="No">
                    </form>
                </div>
            </tr>


        </c:forEach>
    </table>

</div>


<script>


    function showCfDialog(id) {
        let deleteDialog = document.getElementById(id);
        deleteDialog.style.display = "block"
    }

</script>
<script>
    setTimeout(function () {
        document.querySelector(".message").innerHTML = "";
    }, 2000)
</script>
</body>
</html>
