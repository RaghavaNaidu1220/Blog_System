<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
    table {
        width: 100%;
    }
    th, td {
        padding: 10px;
        border: 1px solid #000;
    }
    .bg-dark {
        background-color: #343a40;
    }
    /* Add more styles as needed */
</style>
</head>
<body>
<h3 class="text-center text-light pt-3">comments</h3>

<div class="container p-4 text-light">
    <div class="comment-list">
        <c:forEach items="${comment}" var="comment">
            <div class="comment" style="background-color: #f0f0f0; display:flex; ">
            <!--  	<p style="flex: 1;"><b style="color:green;">Blog Title</b>: ${comment.blog.title}</p>-->
                <p ><b style="color: green;">${comment.name}</b>: ${comment.comment}</p>
            </div>
        </c:forEach>
    </div>
</div>
</body>
</html>