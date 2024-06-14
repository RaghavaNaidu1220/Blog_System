<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%> 
<%@ taglib uri="jakarta.tags.core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c1" %>
 
<html> 
<head>
<style>
    /* Define your CSS styles here */
    body {
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
        margin: 0;
        padding: 0;
    }

    .container {
        max-width: 600px;
        margin: 0 auto;
        padding: 20px;
        background-color: #fff;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        border-radius: 5px;
    }

    h1 {
        font-size: 24px;
        color: #333;
    }

    /* Add more styles as needed */
</style>
</head>
<body>

<%@ include file="adminnav.jsp" %>

<div class="container">
    <h1>User Profile</h1>
    <p>ID: ${user.id}</p>
    <p>Name: ${user.name}</p>
    <p>UserName: ${user.username}</p>
    <p>Email: ${user.email}</p>
    <p>Contact No: ${user.contactno}</p>

    <!-- Back button to redirect to viewalluser.jsp -->
    <a href="viewalluser">Back</a>
</div>

</body>
</html>
