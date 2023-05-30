<%@ page import="com.example.ss10displaycustomers.Customer" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Arrays" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<style>
    .image{
        width: 70px;
        height: 70px;
    }
    td{
        width: 100px;
    }
    th{
        text-align: left;
    }
</style>
<body>
<%
    List<Customer> customers = new ArrayList<>(
            Arrays.asList(
                    new Customer(1, "Josh Fudge", "1999-02-20", "USA", "https://i.scdn.co/image/ab6761610000e5eb2fc88630bc23a19e8aa14f9a"),
                    new Customer(2, "Hojean", "2000-07-17","Korea", "https://images.squarespace-cdn.com/content/v1/628067be849f8a12d54d8359/a02aa455-bc62-4dac-8ffa-6e09d44bfc6c/SWINGCOVERART.jpg"),
                    new Customer(3, "Joji", "1992-04-25","Japan", "https://bizweb.dktcdn.net/100/411/628/products/joji-1f33b0bf-4267-478f-baae-dac4c86ffe9f.jpg?v=1635314919843"),
                    new Customer(4, "DPR LIVE", "1999-02-20","Korea", "https://i.scdn.co/image/ab6761610000e5ebacb49442ef7030a98e45f905"),
                    new Customer(5, "eaJ", "1992-09-15","USA", "https://i1.sndcdn.com/avatars-nsAvLi0klJkUz4Ub-oUQktg-t500x500.jpg")
            ));
%>
<h2>List Of Customers</h2>
<table>
    <tr>
        <th>Name</th>
        <th>DOB</th>
        <th>Address</th>
        <th>Image</th>
    </tr>
    <c:forEach var="customer" items="<%=customers%>">
        <tr>
            <td>${customer.getName()}</td>
            <td>${customer.getDob()}</td>
            <td>${customer.getAddress()}</td>
            <td ><img class="image" src="${customer.getImage()}"></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>