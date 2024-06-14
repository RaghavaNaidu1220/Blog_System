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
            flex-direction: row; /* Make the container a row */
            justify-content: space-between; /* Space between elements */
            align-items: center;
            cursor: pointer;
            margin-bottom: 20px; /* Add margin to separate containers */
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            border-radius: 10px;
            padding: 20px;
            margin-top: 50px;
            margin-left: 50px;
            margin-right: 50px;
            height: 300px;
            width: 80%;
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
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
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
            color: black;
        }

        a:hover {
            transform: scale(1.05);
        }

        /* Move the delete link to the right */
        .delete-link {
            margin-left: auto; /* Auto margin to push it to the right */
        }

        /* Style for the select and delete button */
        .select-container {
            display: flex;
            align-items: center;
            justify-content: space-between;
            position: absolute;
            margin-top: 20px;
            right: 20px;
            z-index: 0;
            text-overflow:ellipsis;
        }
		.select-option{
			margin-left:300px
		}
        select {
            margin-right: 10px;
            padding: 8px; /* Adjust the padding for the select button */
            width: 100px; /* Set a fixed width for the select button */
        }

        .delete-all-button {
            padding: 8px; /* Adjust the padding for the delete button */
            background-color: #ff0000;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-left:10px;
            padding-left:20px;
            padding-right:20px;
        }
        
        .modal {
        display: none;
        position: fixed;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        background-color: #fff;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        padding: 20px;
        border-radius: 5px;
        z-index: 1000;
    }

    .overlay {
        display: none;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5);
        z-index: 999;
    }
    </style>
</head>
<body>
    <%@ include file="userlognav.jsp" %>
    <div class="select-container">
        <select id="blogSelect" onchange="filterBlogs()">
            <option value="">None</option> <!-- Add a default option -->
            <c:forEach items="${blogs}" var="blog">
                <option class="select-option" value="${blog.id}">${blog.title}</option>
            </c:forEach>
        </select>
        <button class="delete-all-button" onclick="deleteBlog('${uid}', document.getElementById('blogSelect').value)">Delete </button>
    </div>
    <br>
    <div>
        <c:choose>
            <c:when test="${not empty blogs}">
                <!-- Display blogs if available -->
                <c:forEach items="${blogs}" var="blog">
                    <a href='<c:url value="viewblogwithcommentbyuid?id=${blog.id}"></c:url>'>
                        <div class="container" data-blog-id="${blog.id}">
                            <div class="blog-image">
                                <img src="displayproimage?id=${blog.id}" alt="Blog Image">
                            </div>
                            <div class="blog-details">
                                <div class="blog-title">${blog.title}</div>
                                <div class="blog-author">${blog.author}</div>
                                <p>${blog.content}</p>
                                <!-- Add more details here -->
                            </div>
                        </div>
                    </a>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <!-- Display a message if no blogs are available -->
                <p style="text-align:center; ">No blogs found. Please write a blog.</p>
            </c:otherwise>
        </c:choose>
    </div>
    <div class="overlay" id="overlay"></div>
		
		<div class="modal" id="confirmationModal">
		    <p id="modalText"></p>
		    <button onclick="confirmDelete()">Yes</button>
		    <button onclick="closeModal()">No</button>
		</div>

    <script>
    function filterBlogs() {
        var selectedBlogId = document.getElementById('blogSelect').value;
        var blogContainers = document.getElementsByClassName('container');
        for (var i = 0; i < blogContainers.length; i++) {
            var blogContainer = blogContainers[i];
            var blogId = blogContainer.getAttribute('data-blog-id');
            if (selectedBlogId === '' || selectedBlogId === blogId) {
                blogContainer.style.display = 'flex';
            } else {
                blogContainer.style.display = 'none';
            }
        }
    }

    function deleteBlog(uid, blogId) {
        if (blogId === "") {
            alert("Please select a blog title to delete.");
            return;
        }
       // var confirmDelete = window.confirm("Are you sure you want to delete this blog post?");
        //if (confirmDelete) {
            window.location.href = '<c:url value="/deleteuserpost/"></c:url>' + blogId + '?uid=' + uid;
     //   }
    }

    function confirmDelete() {
        var url = '<c:url value="/deleteuserpost/"></c:url>' + window.selectedBlogId + '?uid=' + window.selectedUid;
        window.location.href = url;
        closeModal();
    }

    function closeModal() {
        document.getElementById('overlay').style.display = 'none';
        document.getElementById('confirmationModal').style.display = 'none';
    }
    </script>

</body>
</html>