<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>User Profile</title>
    <style>
        .body {
		    font-family: Arial, sans-serif;
		    background-color: #f2f2f2;
		    margin: 0;
		    padding: 20px;
		}
		
		.profile-container {
		    display: flex;
		    flex-direction: column;
		}
		
		.user {
		    display: flex;
		    align-items: center;
		    background-color: #fff;
		    margin-left: 200px;
		    margin-right: 200px;
		    padding: 20px;
		    border-radius: 8px;
		    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
		}
		
		.user-avatar-container {
		    margin-left: 200px;
		    padding-right: 50px;
		}
		
		.user-avatar img {
		    width: 250px;
		    height: 250px;
		    border-radius: 50%;
		    object-fit: cover;
		}
		
		.user-details {
		    max-width: 400px;
		    align-items: center;
		    border-radius: 8px;
		    font-size: large;
		    margin-left: 150px;
		    padding-top: 50px;
		}
		
		.user-details p {
		    line-height: 36px;
		}
		
		.blogs {
		    margin-left: 200px;
		    margin-right: 200px;
		    margin-top: 20px;
		}
		
		.blogs-container {
		    display: flex;
		    gap: 20px; /* Adjust the gap between blogs */
		    flex-wrap: wrap;
		}
		
		.blog-card {
		    flex: 0 0 calc(33.333% - 20px); /* Adjust the width of each blog card */
		    border: 1px solid #ddd;
		    border-radius: 8px;
		    overflow: hidden;
		    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
		    transition: transform 0.3s ease-in-out;
		    margin-left:25px;
		    margin-right:15px;
		    margin-bottom:50px;
		}
		
		.blog-card:hover {
		    transform: translateY(-5px);
		}
		
		.blog-image img {
		    max-width: 100%;
		    max-height: 100%;
		    width: 500px;
		    height: 250px;
		}
		
		.blog-details {
		    padding: 10px;
		    box-sizing: border-box;
		}
		
		.blog-title {
		    font-size: 18px;
		    font-weight: bold;
		    color: #333;
		}
		
		.blog-author {
		    color: #666;
		}

    </style>
</head>
<body>
    <%@ include file="userlognav.jsp" %>

    <div class="profile-container">
        <div class="user">
            <div class="user-avatar-container">
                <div class="user-avatar">
                    <c:choose>
                        <c:when test="${not empty user.image}">
                            <img src="displayprofileimage?id=${user.id}">
                        </c:when>
                        <c:otherwise>
                            <img src="imgs/profile.png">
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
            <div class="user-details">
                <p>Name: ${user.name}</p>
                <p>Username: ${user.username}</p>
                <p>Email: ${user.email}</p>
            </div>
        </div>
        <div class="blogs">
            <div class="blogs-container">
                <c:forEach items="${blogs}" var="blog">
                    <a href='<c:url value="viewblogwithcommentinuser?id=${blog.id}"></c:url>'>
                        <div class="blog-card">
                            <div class="blog-image">
                                <img src="displayproimage?id=${blog.id}" alt="Blog Image">
                            </div>
                            <div class="blog-details">
                                <div class="blog-title">${blog.title}</div>
                                <!-- Add more details as needed -->
                            </div>
                        </div>
                    </a>
                </c:forEach>
            </div>
        </div>

    </div>
</body>
</html>
