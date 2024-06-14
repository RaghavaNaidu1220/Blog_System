<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ page import="com.blog.entity.User" %>
<%@ page import="java.sql.Blob" %>
<%@ page import="java.util.Base64" %>
<%@ page import="java.nio.charset.StandardCharsets" %>


<!DOCTYPE html>
<html>
<head>
<base href="${pageContext.request.contextPath}/">
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
        /* Add this style in your existing style section */
		.modal {
		    display: none;
		    position: fixed;
		    z-index: 1;
		    left: 0;
		    top: 0;
		    width: 100%;
		    height: 100%;
		    overflow: auto;
		    background-color: rgba(0, 0, 0, 0.4);
		}
		
		.modal-content {
		    background-color: #fefefe;
		    margin: 15% auto;
		    padding: 20px;
		    border: 1px solid #888;
		    width: 80%;
		}
		
		.close {
		    color: #aaa;
		    float: right;
		    font-size: 28px;
		    font-weight: bold;
		}
		
		.close:hover,
		.close:focus {
		    color: black;
		    text-decoration: none;
		    cursor: pointer;
		}
        
         .edit-button {
        background-color: #007BFF;
        color: #fff;
        padding: 8px 16px;
        border: none;
        border-radius: 3px;
        cursor: pointer;
        margin-top: 10px;
        transition: background-color 0.3s ease-in-out;
    }

    .edit-button:hover {
        background-color: #0056b3;
    }
    .image-container {
	    position: relative;
	    display: inline-block;
	}
	
	.edit-button {
	    display: none;
	    position: absolute;
	  /*   top: 5px;
	    right: 5px;
	   z-index: 2;*/
	    background-color: #FF4B2B;
	    color: #fff;
	    padding: 8px 16px;
	    border: none;
	    border-radius: 3px;
	    cursor: pointer;
	    transition: background-color 0.3s ease-in-out;
	}
	
	.user-avatar-container:hover .edit-button {
	    display: block;
	}
	
	.edit-button:hover {
	    background-color: #0056b3;
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
                        <div class="image-container">
                            <img src="displayprofileimage?id=${eid}" alt="profile image">
                        </div>
                        <!-- Inside your JSP -->
							<button class="edit-button" onclick="deleteProfileImage('${eid}','${eusername}')">Delete</button>

                    </c:when>
                    <c:otherwise>
                        <img src="imgs/profile.png" alt="Default Profile Image">
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
        
        <div class="user-details">
            <h1>My Profile</h1>
            <form class="profile-form" method="post" action="${pageContext.request.contextPath}/update" enctype="multipart/form-data">

                <div class="form-group">
                    <label for="name">Name:</label>
                    <div class="input-userprofile-container">
                        <i class="input-icon fas fa-user"></i>
                        <input type="text" id="name" name="name" placeholder="Your Name" required value="${ename}">
                    </div>
                </div>
                <div class="form-group">
                    <label for="username">Username:</label>
                    <div class="input-userprofile-container">
                        <i class="input-icon fas fa-user"></i>
                        <input type="text" id="username" name="username" placeholder="Your Username" required value="${eusername}">
                    </div>
                </div>
                <div class="form-group">
                    <label for="email">Email:</label>
                    <div class="input-userprofile-container">
                        <i class="input-icon fas fa-envelope"></i>
                        <input type="email" id="email" name="email" placeholder="Your Email" required value="${eemail}">
                    </div>
                </div>
                <div class="form-group">
                    <label for="contactno">Contact Number:</label>
                    <div class="input-userprofile-container">
                        <i class="input-icon fas fa-phone"></i>
						<input type="text" id="contact" name="contact" placeholder="Your Contact Number" required value="${econtact}">
                    </div>
                </div>	
                <div class="form-group">
                    <label for="password">Password:</label>
                    <div class="input-userprofile-container">
                        <i class="input-icon fas fa-lock"></i>
                          <input type="password" id="pass" name="pass" placeholder="Your Password" required value="${epass}">
                        <i class="password-toggle-icon fas fa-eye" onclick="togglePasswordVisibility('pass')"></i>
                    </div>
                </div>
                <div class="form-group">
		        <label for="image">Upload an Image:</label>
		        <div class="input-userprofile-container">
		            <i class="input-icon fas fa-image"></i>
		            <input type="file" id="image" name="image" accept="image/*">
		        </div>
		    </div>
		    <div id="deleteModal" class="modal">
			    <div class="modal-content">
			        <span class="close" onclick="closeDeleteModal()">&times;</span>
			        <p>Are you sure you want to delete your profile image?</p>
			        <button class="edit-button" id="deleteButton">Delete</button>
			    </div>
			</div>

                <button type="submit">Save Profile</button>
            </form>
        </div>
        <!-- Add this modal at the end of your body section -->

    </div>
</div>
<script>
    function togglePasswordVisibility(passwordFieldId) {
        var passwordField = document.getElementById(passwordFieldId);
        if (passwordField.type === "password") {
            passwordField.type = "text";
        } else {
            passwordField.type = "password";
        }
    }

    function deleteProfileImage(userId, username) {
        // Send an AJAX request or redirect to the deleteuserimage/{id} endpoint
        var url = '${pageContext.request.contextPath}/deleteuserimage/' + userId + '?username=' + encodeURIComponent(username);
        window.location.href = url;
    }

</script>

</body>
</html>