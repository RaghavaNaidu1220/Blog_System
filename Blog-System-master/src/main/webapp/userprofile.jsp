<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ page import="com.blog.entity.User" %>
<%@ page import="java.sql.Blob" %>
<%@ page import="java.util.Base64" %>
<%@ page import="java.nio.charset.StandardCharsets" %>


<!DOCTYPE html>
<html>
<head>
    <title>My Profile</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"> <!-- Include Font Awesome for icons -->
    <style>
        .body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 50px;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            min-height: 100vh;
        }
        .userprofile-container {
            display: flex;
            width: 700px; /* Adjust the width as needed */
            background-color: #ffffff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        }
        .user-avatar-container {
            padding: 20px;
            text-align: center;
        }
        .user-avatar {
            width: 200px; /* Adjust the size of the profile picture */
            height: 200px;
            border-radius: 50%;
            background-color: #ccc; /* Default avatar background color */
            overflow: hidden;
        }
        .user-avatar img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        .user-avatar-default {
            /* Add styles for the default profile image */
        }
        .user-details {
            padding: 20px;
            width: 100%;
        }
        h1 {
            color: #007BFF;
        }
        .profile-form {
            margin-top: 10px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        label {
            display: block;
            font-weight: bold;
            color: #555;
        }
        .input-userprofile-container {
            position: relative;
        }
        .input-icon {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            left: 10px;
            color: #007BFF;
        }
       .form-group i{
        	color:#FF4B2B;
        }
        input {
            width: 88%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            padding-left: 40px;
        }
        button {
            background-color: #FF4B2B;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            display: block;
            margin: 0 auto;
        }
        button:hover {
            background-color: #E63F20;
        }
    </style>
</head>
<body>
<%@ include file="userlognav.jsp"%>
<div class="body">
    <div class="userprofile-container">
        <div class="user-avatar-container">
             <div class="user-avatar">
			<c:choose>
        <c:when test="${not empty user.image}">
            <img src="displayprofileimage?id=${eid}">
        </c:when>
        <c:otherwise>
            <img src="imgs/profile.png" >
        </c:otherwise>
    </c:choose>
      		</div>
        </div>
        
        <div class="user-details">
            <h1>My Profile</h1>
            <form id="profileForm" class="profile-form" method="post" ><!-- action="userprofileedit.jsp"-->
                <div class="form-group">
                    <label for="name">Name:</label>
                    <div class="input-userprofile-container">
                        <i class="input-icon fas fa-user"></i>
                        <input type="text" id="name" name="name" placeholder="Your Name"  value="${user.name}" readonly="readonly">
                    </div>
                </div>
                <div class="form-group">
                    <label for="username">Username:</label>
                    <div class="input-userprofile-container">
                        <i class="input-icon fas fa-user"></i>
                        <input type="text" id="username" name="username" placeholder="Your Username"  value="${user.username}" readonly="readonly">
                    </div>
                </div>
                <div class="form-group">
                    <label for="email">Email:</label>
                    <div class="input-userprofile-container">
                        <i class="input-icon fas fa-envelope"></i>
                        <input type="email" id="email" name="email" placeholder="Your Email"  value="${user.email}" readonly="readonly">
                    </div>
                </div>
                <div class="form-group">
                    <label for="contactno">Contact Number:</label>
                    <div class="input-userprofile-container">
                        <i class="input-icon fas fa-phone"></i>
						<input  type="text" id="contact" name="contact" placeholder="Your Contact Number"  value="${user.contactno}" readonly="readonly">
                    </div>
                </div>
                <div class="form-group">
                    <label for="password">Password:</label>
                    <div class="input-userprofile-container">
                        <i class="input-icon fas fa-lock"></i>
                        <input type="password" id="pass" name="pass" placeholder="Your Password"  value="${user.pass}" readonly="readonly">
                    </div>
                </div>
                <!-- <div class="form-group">
		        <label for="image">Upload an Image:</label>
		        <div class="input-userprofile-container">
		            <i class="input-icon fas fa-image"></i>
		            <input type="file" id="image" name="image" accept="image/*">
		        </div>
		    </div>-->
				<button type="button" onclick="redirectToEditProfile('${pageContext.request.contextPath}/profile/${user.username}/update')">Edit Profile</button>
            </form>
        </div>
    </div>
</div>
 <script>
                   
    // Disable all input fields on page load
    document.addEventListener("DOMContentLoaded", function() {
        var inputFields = document.querySelectorAll('input[readonly]');
        inputFields.forEach(function(field) {
            field.disabled = true;
        });
    });

    // Enable input fields when the form is submitted
    function enableFields() {
        var inputFields = document.querySelectorAll('input[readonly]');
        inputFields.forEach(function(field) {
            field.disabled = false;
        });
    }
    function redirectToEditProfile(editProfileUrl) {
        window.location.href = editProfileUrl;
    }
</script>
        
</body>
</html>