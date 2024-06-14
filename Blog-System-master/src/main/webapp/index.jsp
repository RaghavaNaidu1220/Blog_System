<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    
    <title>Blog Display</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }

        .container {
            display: flex;
            align-items: center;
            cursor: pointer;
            margin-bottom: 20px; /* Add margin to separate containers */
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            border-radius: 10px;
            padding: 20px;
            margin-top:50px;
            margin-left:50px;
            margin-right:50px;
            height:300px;
        }

        .blog-image {
            flex: 1;
        }

        .blog-image img {
            max-width: 100%;
            height: 90%;
        }

        .blog-details {
            flex: 2;
            padding: 20px;
        }

        .blog-title {
            font-size: 24px;
            font-weight: bold;
            color: #333;
        }

        .blog-author {
            color: #666;
            margin: 10px 0;
        }
        
        .back-button {
            margin-top: 20px;
            display: block;
            text-decoration: none;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            border-radius: 10px;
            padding: 10px;
            background-color: #4CAF50;
            color: #fff;
        }
        
        .back-button:hover {
            background-color: #45a049;
        }

        /* Apply box shadow to the container and remove the underline from the link */
        a {
            text-decoration: none;
            color:black;
        }
        
        a:hover {
            transform: scale(1.05);
        }
    </style>
    
    <!--  <c:if test="${not empty refreshScript}">
        ${refreshScript}
    </c:if>--> 
</head>
<body >
 
<%@ include file="usernav.jsp" %>
    <div>
    
        <c:forEach items="${blogs}" var="blog">
            <a href='<c:url value="/viewblog?id=${blog.id}"></c:url>'>
                <div class="container">
                    <div class="blog-image">
                        <img src="displayproimage?id=${blog.id}" alt="Blog Image" style="max-width: 100%; height: auto;">
                    </div>
                    <div class="blog-details">
                        <div class="blog-title">${blog.title}</div>
                        <div class="blog-author">${blog.author}</div>
                        <p style>${blog.content}</p>
                        <!-- Add more details here -->
                    </div>
                </div>
            </a>
        </c:forEach>
    </div>
</body>
</html>
