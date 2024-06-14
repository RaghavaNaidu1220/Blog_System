<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Blog Display</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        .container {
            display: flex;
            align-items: center;
            cursor: pointer;
        }

        .blog-image {
            flex: 1;
        }

        .blog-image img {
            max-width: 100%;
            height: auto;
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

        /* Apply box shadow to the container and remove the underline from the link */
        a {
            text-decoration: none;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            border-radius: 10px;
            padding: 10px;
            display: block;
        }
    </style>
</head>
<body>
	<div>
	    <a href="another-page.html">
	        <div class="container">
	            <c:forEach items="${blog}" var="blog" varStatus="loop">
	                <div class="blog-image">
	                    <img src="displayproimage?id=${blog.id}" alt="Blog Image" style="max-width: 100%; height: auto;">
	                </div>
	                <div class="blog-details">
	                    <div class="blog-title">${blog.title}</div>
	                    <div class="blog-author">${blog.author}</div>
	                    <p>${blog.content}</p>
	                    <!-- Add more details here -->
	                </div>
	            </c:forEach>
	        </div>
	    </a>
	</div>
</body>
</html>
