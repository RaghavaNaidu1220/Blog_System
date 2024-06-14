<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
 
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500&display=swap" rel="stylesheet">

  
</head>
<body>
<div class="container">
    <h3 class="message">${message}</h3>
    <div class="user-greeting">Hi,<span>${ename}</span></div>
    <%@ include file="dashboard.jsp" %>
  </div>
  
  
</body>
</html>