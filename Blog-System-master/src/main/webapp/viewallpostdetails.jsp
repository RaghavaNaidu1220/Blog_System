<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%> 
<%@ taglib uri="jakarta.tags.core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c1" %>
 
<html> 
<head>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
        margin: 0;
        padding: 0;
    }

    .container {
        max-width: 800px;
        margin: 0 auto;
        padding: 20px;
        background-color: #fff;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        border-radius: 5px;
    }

    h1 {
        font-size: 24px;
        color: #333;
        margin-bottom: 10px;
    }

    p {
        font-size: 16px;
        color: #666;
        margin-bottom: 10px;
    }

    img {
        max-width: 100%;
        height: auto;
    }
</style>
</head>
<body>

<%@ include file="adminnav.jsp" %>

<div class="container">
    <h1>${blog.title}</h1>
    <p>Author: ${blog.author}</p>
    <img src="displayproimage?id=${blog.id}" alt="Blog Image"> 
    <p>${blog.content}</p><br>
    
    <div class="comments">
    <div style="text-align:center;">Comments</div>
    <c:forEach items="${blog.comments}" var="comment">
    <div class="comment">
    <p><b style="color: green;">${comment.name}</b>: ${comment.comment}</p>
    <a href='<c:url value="deletecomment/${comment.id}"></c:url>' style="color: red; text-decoration: none; margin-left: 10px;">Delete</a>
	</div>


    </c:forEach>
</div>
    <a href="viewallblogsadmin">Back</a>
    
</div>
<script>
    // Variable to store the previous URL
   //	 var previousUrl = document.referrer || '/';

    // Function to go back
    function goBack() {
        // Use the stored previous URL to navigate back
        window.history.back();
    }
</script>


</body>
</html>
