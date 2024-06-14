<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%> 

<html>
<head>
    <style>
        body {
            background-color: #f0f0f0;
            font-family: Arial, sans-serif;
        }

        h3 {
            text-align: center;
            background-color: #333;
            color: #fff;
            padding: 10px;
        }

        .container {
            margin: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            border-radius: 5px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #fff;
        }

        th, td {
            padding: 10px;
            border: 1px solid #ccc;
            text-align: center;
        }

        thead {
            background-color: #333;
            color: #fff;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        
        a{
        color:black;
        text-decoration: none;
        margin-bottom:10px;
        }
        
        
    </style>
</head>
<body>
<%@ include file="adminnav.jsp" %>
<h3 class="text-center text-light pt-3">View All Blogs</h3>

<div class="container p-4 text-light">
    <table class="table table-bordered table-striped table-hover table-responsive text-center">
        <thead class="bg-dark text-white">
        <tr>
            <th>ID</th>
            <th>Image</th>
            <th>Title</th>
            <th>Author</th>
            <th>Content </th>
            <th>Actions</th>
            
        </tr>
        </thead>
        <tbody class="text-light">
        <c:forEach items="${blogadmin}" var="admin">
            <tr class="text-light">
                <td><c:out value="${admin.id}" /></td>
                <td><img src='displayproimage?id=${admin.id}' width="10%" height="10%"> </td>
                <td><c:out value="${admin.title}" /></td>
                <td><c:out value="${admin.author}" /></td>
                <td><c:out value="${admin.content}" /></td>
                <td><a href='<c:url value="viewpostindetail?id=${admin.id}"></c:url>'>View</a>
                	<!-- <a href='<c:url value="viewallcommentsbyid?id=${admin.id}"></c:url>'>comment</a>-->

<br>
                	<a href='<c:url value="deletepost/${admin.id}"></c:url>'>Delete</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
