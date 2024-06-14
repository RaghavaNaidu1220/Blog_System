<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="admin.css">
    
  <style>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }
        .navbar {
            background-color: #333;
            color: #fff;
            text-align: center;
            padding: 20px 0;
        }
        .navbar h1 {
            font-size: 2em;
        }
        .nav-menu {
            list-style: none;
            padding: 0;
        }
        .nav-menu li {
            display: inline;
            margin-right: 20px;
        }
        .nav-menu a {
            text-decoration: none;
            color: #fff;
            font-weight: bold;
        }
        .nav-menu a:hover {
            color: #f2f2f2;
        }
        .content {
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>
    <div class="navbar">
        <h1>Admin Dashboard - Blogging System</h1>
        <ul class="nav-menu">
            <li><a href="admindash.jsp">Dashboard</a></li>
            <li><a href="viewallblogsadmin">Posts</a></li>
            <li><a class="nav-link active" href="viewalluser">Users</a></li>
            <li><a href="viewallcommentsbyidadmin">Comments</a></li>
			<li><a href="viewallmsg">Messages</a></li>
            <li><a href="#">Settings</a></li>
            <li><a href="index.jsp">Logout</a></li>
        </ul>
    </div>
    
</body>
</html>
