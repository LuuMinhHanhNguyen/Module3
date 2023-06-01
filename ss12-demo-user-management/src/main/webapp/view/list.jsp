<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ny
  Date: 17/05/2023
  Time: 11:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
</head>
<style>
    *, *::before, *::after {
        box-sizing: border-box;
        margin-right: 0;
        padding: 0;
    }

    .delete--dialog {
        display: none;
        position: absolute;
        top: 40%;
        left: 35%;
        right: 35%;
        z-index: 999;
        background: darkseagreen;
        padding: 3rem;
        opacity: .90;
    }

    table, th, td {
        border-collapse: collapse;
        border: 1px deepskyblue solid;
    }

    td {
        width: 200px;
    }

    table {
        margin-top: 2rem;
    }

    .btn {
        margin-right: 3rem;
        display: inline-block;
        padding: .75em 2em;
        background: darkseagreen;
        border-radius: 100px;
        text-decoration: none;
        font-weight: bold;
        text-align: center;
    }

    .delete--btn {
        color: red;
        cursor: pointer;
    }

    /*search--bar*/
    .search-bar {
        border: orange 2px solid;
        border-radius: 100px;
        position: relative;
        background: white;
        padding: .5em;
        width: 100%;
    }

    .search-bar__input {
        font-size: 1.5rem;
        border: 0;
        margin: 0;
        background: transparent;
        overflow: hidden;
    }

    .search-bar__input:focus {
        outline: 0;
    }

    .search-bar__submit {
        font-size: 1.5rem;
        cursor: pointer;
        border: 0;
        width: 44px;
        height: 44px;
        background: lightpink;
        border-radius: 50%;
        position: absolute;
        right: 0;
        top: 0;
    }

    .outer {
        display: flex;
        justify-content: left;
        align-items: baseline;
    }
    .message{
        color: red;
        font-weight: bold;
    }
    .container{
        width: 90%;
        margin: auto;
    }


</style>
<body>
<div class="container">
<h2>DISPLAY ALL USERS</h2>
<div class="outer">
    <div>
        <a href="/users" class="btn">Show All Users</a>
        <a href="/users?action=create" class="btn">Create New User</a>
        <a href="/users?action=sortedByName" class="btn">Sorted By Name </a>
    </div>

    <div>
        <form method="get" action="/users" class="search-bar">
            <input type="hidden" name="action" value="searchByCountry">
            <input type="text" class="search-bar__input" placeholder="enter your search" name="searchInfo">
            <button type="submit" class=" search-bar__submit"><i class="fas fa-search"></i></button>
        </form>
    </div>
</div>
<c:if test="${message != null}">
    <p class="message">${message}</p>
</c:if>
<table>
    <tr>
        <th>Name</th>
        <th>Email</th>
        <th>Country</th>
    </tr>
    <c:forEach var="user" items="${users}">
        <tr>
            <td style="font-weight: bold">${user.getName()}</td>
            <td>${user.getEmail()}</td>
            <td>${user.getCountry()}</td>
            <td><a href="/users?action=edit&id=${user.getId()}">Edit</a></td>
            <td><a onclick='showDeleteDialog(${user.getId()})' class="delete--btn">Delete</a></td>
            <div class="delete--dialog" id="${user.getId()}">
                <h2>Are you sure to delete user ${user.getName()} </h2>
                <form method="post" action="/users">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="id" value="${user.getId()}">
                    <input type="submit" name="cf" value="yes">
                    <input type="submit" name="cf" value="no">
                </form>
            </div>
        </tr>
    </c:forEach>
</table>
</div>
<script>
    function showDeleteDialog(id) {
        let deleteDialog = document.getElementById(id);

        deleteDialog.style.display = "block";

    }
</script>
<script>
    setTimeout(function (){
        document.querySelector(".message").innerHTML = "";
    }, 3000);
</script>
</body>
</html>


