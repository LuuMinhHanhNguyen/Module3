<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>

<form action="/discount" method="post">
    <input type="text" name="description" size="30" placeholder="Enter product's description"><br><br>
    <input type="number" name="price" placeholder="Enter product's price"><br><br>
    <input type="number" name="discount"   placeholder="Enter discount percent"><br><br>
    <input type="submit">
</form>

</body>
</html>