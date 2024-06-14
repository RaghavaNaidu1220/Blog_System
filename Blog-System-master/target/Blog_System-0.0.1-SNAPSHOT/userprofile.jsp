<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>My Profile</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"> <!-- Include Font Awesome for icons -->
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
        }
        .container {
            max-width: 430px;
            margin: 20px auto; /* Increase margin all around the container */
            padding: 20px;
            background-color: #ffffff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        }
        h1 {
            text-align: center;
        }
        .profile-form {
            margin-top: 20px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            font-weight: bold;
        }
        .input-container {
            position: relative;
        }
        .input-icon {
            position: absolute;
            top: 12px;
            left: 10px;
            color: #555;
        }
        input {
            width: 90%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            margin: 0px 0; /* Add margin above and below the input fields */
            padding-left: 35px; /* Leave space for the icon */
        }
        button {
            background-color: #007BFF;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            margin-top: 10px; /* Add margin above the button */
            margin-left:35% ;
        }
        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>My Profile</h1>
        <form class="profile-form" method="post"  action="update">
            <div class="form-group">
                <label for="photo">Profile Photo:</label>
                <div class="input-container">
                    <i class="input-icon fas fa-camera"></i> <!-- Add camera icon to the left -->
                    <input type="file" id="photo" name="photo">
                </div>
            </div>
            <div class="form-group">
                <label for="name">Name:</label>
                <div class="input-container">
                    <i class="input-icon fas fa-user"></i> <!-- Add user icon to the left -->
                    <input type="text" id="name" name="name" placeholder="Your Name" required value="${ename}">
                </div>
            </div>
            <div class="form-group">
                <label for="username">Username:</label>
                <div class="input-container">
                    <i class="input-icon fas fa-user"></i> <!-- Add user icon to the left -->
                    <input type="text" id="username" name="username" placeholder="Your Username" required value="${eusername}">
                </div>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <div class="input-container">
                    <i class="input-icon fas fa-envelope"></i> <!-- Add envelope icon to the left -->
                    <input type="email" id="email" name="email" placeholder="Your Email" required value="${eemail}">
                </div>
            </div>
            <div class="form-group">
                <label for="contactno">Contact Number:</label>
                <div class="input-container">
                    <i class="input-icon fas fa-phone"></i> <!-- Add phone icon to the left -->
                    <input type="text" id="contactno" name="contactno" placeholder="Your Contact Number" required value="${econtact}">
                </div>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <div class="input-container">
                    <i class="input-icon fas fa-lock"></i> <!-- Add lock icon to the left -->
                    <input type="password" id="pass" name="pass" placeholder="Your Password" required value="${epass}">
                </div>
            </div>
            <button type="submit">Save Profile</button>
        </form>
    </div>
</body>
</html>
