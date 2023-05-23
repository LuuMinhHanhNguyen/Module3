<%--
  Created by IntelliJ IDEA.
  User: ny
  Date: 22/05/2023
  Time: 20:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
            crossorigin="anonymous"
    />
    <script
            defer
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js"
            integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ"
            crossorigin="anonymous"
    ></script>
    <script
            src="https://kit.fontawesome.com/4bf93b0ca4.js"
            crossorigin="anonymous"
    ></script>
    <title>Home</title>
</head>
<style>
    *,
    *::before,
    *::after {
        box-sizing: border-box;
    }

    * {
        padding: 0;
        margin: 0;
    }

    .header {
        background: black;
        text-align: center;
        color: white;
        padding: 0.5em 0;
        font-size: 14px;
    }

    p {
        margin: 0;
    }

    .logo {
        width: 150px;
    }

    .bag-icon {
        display: inline;
        margin-left: 1rem;
    }

    i {
        font-size: 1.5rem;
    }


    footer a {
        text-decoration: none;
        text-transform: uppercase;
        cursor: pointer;
        display: inline-block;
        color: black;
    }

    footer a:hover {
        color: palevioletred;
        text-decoration: underline;
    }


    .links {
        font-size: 1.5rem;
        text-decoration: none;
        margin-left: 1.5rem;
        padding: 0;
        color: gray;
        font-weight: lighter;
    }

    .links:hover {
        color: palevioletred;
        text-decoration: underline;
    }
</style>

<body>
<div class="header">
    <p class="">NO ADDITIONAL CUSTOM FEES OR TAXES FOR OUR ASIA CUSTOMERS</p>
</div>
<div class="container-fluid p-md-5">
    <div
            class="row row-cols-3 justify-content-between align-items-center pt-2"
    >
        <div class="col col-auto d-block d-md-none">
            <i class="fa fa-bars" onc></i>
        </div>

        <div class="row col col-md-auto align-items-center">
            <div class="col col-auto">
                <img
                        class="logo"
                        src="https://cdn.shopify.com/s/files/1/0554/1291/6301/files/JOJI_LOGO.png?v=1661459445&width=400"
                />
            </div>
            <div class="col d-md-block d-none">
                <a class="links" href="">SMITHEREENS</a>
                <a class="links" href="">MERCH</a>
                <a class="links" href="">MUSIC</a>
            </div>
        </div>

        <div class="col col-auto">
            <i class="far fa-user"></i>
            <i class="fa fa-shopping-bag bag-icon"></i>
        </div>
    </div>
</div>

<script>

</script>
</body>
</html>
