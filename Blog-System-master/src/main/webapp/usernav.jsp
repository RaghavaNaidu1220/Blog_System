
<!DOCTYPE html>
<html>
<head>
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

        /* containernavv styles */
        .containernavv {
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
            order: 1; /* Moves the logo to the leftmost position */
        }

        /* menunavv styles */
        .menunavv {
            list-style: none;
            padding: 0;
            margin: 0;
            display: flex;
            order: 2; /* Moves the menunavv to the right */
        }

        .menunavv li {
            margin-right: 70px;
        }

        .menunavv li:last-child {
            margin-right: 0;
        }

        .menunavv a {
            text-decoration: none;
            color: black; /* Change menunavv link color to black */
            font-weight: bold;
            transition: color 0.3s;
        }

       .menunavv a:hover {
    color: rgb(46, 213, 0); /* Vibrant green color */
}


        /* Login button styles */
        .login-button {
            background-color: #090a0a; /* Button background color */
            color: #fff; /* Text color */
            border: none;
            padding: 10px 20px; /* Adjust the padding as needed */
            border-radius: 5px; /* Rounded corners */
            font-weight: bold;
            text-transform: uppercase; /* Convert text to uppercase */
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .login-button:hover {
            background-color: #626a73; /* Change background color on hover */
            color: white;
        }

        .login-button a {
            text-decoration: none;
            color: #e3f6df; /* Text color for the link */
        }

        /* dropdownnavv menunavv styles */
        .dropdownnavv {
            position: relative;
            display: inline-block;
        }

        .dropdownnavv-content {
            display: none;
            position: absolute;
            background-color: #fff;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
            z-index: 1;
            border-radius: 5px;
        }

        .dropdownnavv-content a {
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
            transition: background-color 0.3s;
        }

        .dropdownnavv-content a:hover {
            background-color: #f4f4f4;
        }

        .dropdownnavv:hover .dropdownnavv-content {
            display: block;
        }
    </style>
</head>
<body class="bodynav">
    <nav class="navbar">
        <div class="containernavv">
            <a href="home" class="logo">Blog Guru</a>
            <ul class="menunavv">
                <li><a href="home">Home</a></li>
                <!-- dropdownnavv menunavv for Blog -->
                <li class="dropdownnavv">
                    <a href="javascript:void(0)">Blog</a>
                    <div class="dropdownnavv-content">
                        <a href="login.jsp">Create a Post</a>
                        <a href="login.jsp">See All Blogs</a>
                    </div>
                </li>
                <li><a href="contactuser.jsp">Contact</a></li>
                <li><a href="about.jsp">About</a></li>
               	<div class="animate___animated
               				animate_bounce
               				animate_infinite">
                <li><button class="login-button"><a href="login.jsp">Login</a></button></li></div>
            </ul>
        </div>
    </nav>
</body>
</html>
