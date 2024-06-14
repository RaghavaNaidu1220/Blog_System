<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <!-- No external CSS file is used; inline styles are added below -->
</head>
<body>
<%@ include file="adminnav.jsp" %>
    <h1 style="color: blue; font-size: 24px; text-align: center;">All Comments</h1>
    <div class="comment-list">
        <c:forEach items="${comment}" var="comment">
            <div class="comment" style="background-color: #f0f0f0; display:flex; ">
            <p style="flex: 1;"><b style="color:green;">Blog Id</b>: ${comment.blog.id}</p>
            	<p style="flex: 1;"><b style="color:green;">Blog Title</b>: ${comment.blog.title}</p>
                <p style="flex: 1;"><b style="color: green;">${comment.name}</b>: ${comment.comment}</p>
                <a href='<c:url value="deletecommentadmin/${comment.id}"></c:url>' style="margin-right:150px;justify-content:flex-end">Delete</a>
            </div>
        </c:forEach>
    </div>
    <a href="viewAllblog" style="display: block; text-align: center;">Back to Blog Details</a>
</body>
</html>
