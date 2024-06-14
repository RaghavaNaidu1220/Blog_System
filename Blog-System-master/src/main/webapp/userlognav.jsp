<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	
    <base href="${pageContext.request.contextPath}/">
    <!-- Other head elements -->

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <!-- Include Font Awesome CSS for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        /* Reset default margin and padding */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* Body styles */
        .bodynav {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
        }

        /* Navbar styles */
        .navbar {
            background-color: rgba(246, 240, 240, 0.7); /* Transparent black background */
            color: #fff;
            padding: 10px 0;
        }

        /* containernav styles */
        .containernav {
            display: flex;
            justify-content: space-between;
            align-items: center;
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
            height: 100px;
        }

        /* Logo styles */
        .logo {
            text-decoration: none;
            font-size: 24px;
            font-weight: bold;
            color: #000000;
            margin-right: 300px;
            order: 1; /* Moves the logo to the leftmost position */
        }

        /* Menu styles */
        .menu {
            list-style: none;
            padding: 0;
            margin: 0;
            display: flex;
            justify-content: space-around; /* Add this line to space menu elements evenly */
            align-items: center;
            order: 2; /* Moves the menu to the right */
        }

        .menu li {
            margin-right: 70px;
        }

        .menu li:last-child {
            margin-right: 0;
        }

        .menu a {
            text-decoration: none;
            color: black; /* Change menu link color to black */
            font-weight: bold;
            transition: color 0.3s;
        }

        .menu a:hover {
            color: rgb(46, 213, 0); /* Vibrant green color */
        }

        /* Avatar icon styles */
        /* Add this CSS for image styling within the avatar */
        #avatar img {
            width: 100%; /* Make sure the image takes up the entire space */
            height: 100%;
            border-radius: 50%;
        }

        /* Style the avatar container */
        #avatar {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 50px; /* Width and height can be adjusted */
            height: 50px;
            border-radius: 50%;
            background-color: #c9c0c0; /* Add a background color for the circular border */
            overflow: hidden; /* Hide overflow to ensure a perfect circle */
            position: relative;
        }

        /* Style the default avatar icon if no image is available */
        #avatar .fa-user {
            font-size: 23px;
            color: #fff; /* Color of the default avatar icon */
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }

        /* Dropdown menu styles */
        .dropdown {
            position: relative;
            display: inline-block;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #fff;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
            z-index: 1;
            border-radius: 5px;
        }

        .dropdown-content a {
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
            transition: background-color 0.3s;
        }

        .dropdown-content a:hover {
            background-color: #f4f4f4;
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }

        /* Adjust the styles for the profile link */
        .dropdown-content #usernameLink {
            display: block;
            padding: 12px 16px;
            text-decoration: none;
            color: black;
            transition: background-color 0.3s;
        }

        /* Add hover effect for the profile link */
        .dropdown-content #usernameLink:hover {
            background-color: #f4f4f4;
        }

        /* Hide the default avatar icon when an image is present */
        #avatar .fa-user {
            display: none;
        }

        /* Display dropdown when hovering over the parent */
        .dropdown:hover .dropdown-content {
            display: block;
        }
    </style>
</head>
<body class="bodynav">
    <nav class="navbar">
        <div class="containernav">
            <a href="viewAllblog" class="logo">Blog Guru</a>
            <ul class="menu">
                <li><a href="viewAllblog">Home</a></li>
                <!-- Dropdown menu for Blog -->
                <li class="dropdown"> 
                     <a href="javascript:void(0)">Blog</a>
                     <div class="dropdown-content">
                        <a href="CreatePost.jsp">Create a Post</a>
                        <a href="viewAllblog">All Blogs</a>
                    </div>
                </li>
                <li><a href="contact.jsp">Contact</a></li>
                <li><a href="about.jsp">About</a></li>
                 <li class="dropdown">
                    <div id="avatar">
					    <c:choose>
					        <c:when test="${not empty image}">
					            <img src="displayprofileimage?id=${eid}" alt="profile image">
					        </c:when>
					        <c:otherwise>
					            <img src="imgs/profile.png" alt="default profile image">
					        </c:otherwise>
					    </c:choose>
					</div>
					<div class="dropdown-content">
					    <a href="${pageContext.request.contextPath}/profile/${eusername}" id="usernameLink">Hi, <span>${eusername}</span></a>
					    <a href="javascript:void(0)" onclick="viewMyBlogs(${eid})">My Blogs</a>
					    <a href="home">Logout</a>
					</div>
                </li>
            </ul>
        </div>
        <script>
            var usernameLink = document.getElementById("usernameLink");

            // If the username link does not exist, show a pop-up message
            if (!usernameLink) {
                alert("Username not found. Please try to relogin.");
            }

            function viewMyBlogs(uid) {
                // Redirect to the controller with the uid parameter
                window.location.href = "viewallblogmyuid" + uid;
            }
        </script>
            </nav>
            
        </body>
        </html>
