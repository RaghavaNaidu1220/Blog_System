<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%> 
<%@ taglib uri="jakarta.tags.core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c1" %>

<html>
<head>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            border-radius: 5px;
            overflow: hidden; /* Ensure child elements won't overflow */
        }

        .container:hover .hover-effect {
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.4);
        }

        h1 {
            font-size: 24px;
            color: #333;
            margin-bottom: 10px;
        }

        p {
            font-size: 16px;
            color: #666;
            margin-bottom: 10px;
        }

        img {
            max-width: 100%;
            height: auto;
            margin-bottom: 20px;
        }

        button {
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
        }

        .comment-section {
            margin-top: 20px;
        }

        .comment-input {
            width: 70%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-right: 10px;
        }

        .submit-button {
            background-color: #4CAF50;
            color: white;
            padding: 8px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .comments {
            margin-top: 20px;
            border-top: 1px solid #ccc;
            padding-top: 10px;
        }

        .comment {
            margin-bottom: 10px;
        }

        .comment p {
            margin: 0;
            padding: 5px;
            background-color: #f2f2f2;
            border-radius: 5px;
            display: flex;
            justify-content: space-between;
        }

        .comment-delete {
            color: red;
            text-decoration: none;
            margin-left: 10px;
        }
	
    </style>
     <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>

<div class="container">
	    <form action="updateblog" method="post">
		    <h1>
		        <input type="text" name="title" id="title" value="${blog.title}" required>
		    </h1>
		    <p>Author: ${blog.author}</p>
		    <img src="displayproimage?id=${blog.id}" alt="Blog Image"> 
		    <textarea id="content" name="content" id="content" rows="6" required>${blog.content}</textarea>
		    <!-- Add hidden input for blog id -->
		    <input type="hidden" name="id" id="id" value="${blog.id}" />
		    <!-- Add hidden input for uid -->
		    <input type="hidden" name="userid" id="userid" value="${blog.uid}" />
		    <!-- Add hidden input for author -->
		    <input type="hidden" name="author" id="author" value="${blog.author}" />
		    <!-- Remove file input to update only text -->
		    <br/>
		    <button type="submit" >Update</button>
		</form>


    <hr>
    <!-- Comment section -->
    <div class="comment-section">
        <form method="post" action="addcomment">
            <input type="hidden" id="name" name="name" value="${eusername}" />
            <input type="hidden" id="uid" name="uid" value="${eid}">
            <input type="hidden" name="id" id="id" value="${blog.id}" />
            <input type="text" class="comment-input" placeholder="Add a comment" id="comment" name="comment">
            <button type="submit" class="submit-button">Submit</button>
        </form>
    </div>
    
    <!-- Comments -->
    <div class="comments">
        <div style="text-align:center;">Comments</div>
        <c:forEach items="${blog.comments}" var="comment">
            <div class="comment">
                <p>
                    <b style="color: grey;">${comment.name}:</b> ${comment.comment}
                    <a href='<c:url value="deletecommentbyauthor/${comment.id}?id=${blog.id}"></c:url>' style="color: red; text-decoration: none; margin-left: 10px;">Delete</a>
                </p>
            </div>
        </c:forEach>
    </div>

    <a href='<c:url value="viewallblogmyuid${eid}"></c:url>'>Back</a>

    
<script>
    // Variable to store the previous URL
    //	 var previousUrl = document.referrer || '/';

    // Function to go back
    /*function goBack() {
        // Use the stored previous URL to navigate back
        window.history.back();
    }*/
</script>
<script>
function updateBlog() {
    var formData = {
        id: $("#id").val(),
        title: $("#title").val(),
        author: $("#author").val(),
        content: $("#content").val(),
        userid: $("#userid").val()
    };

    $.ajax({
        type: "POST", // Change to POST
        url: "updateblog",
        data: JSON.stringify(formData),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        headers: {
            'X-HTTP-Method-Override': 'PUT'
        },
        success: function(response) {
            console.log("Blog updated successfully:", response);
            window.location.href = "/viewblogwithcommentbyuid?id=" + formData.id;
        },
        error: function(error) {
            console.error("Error updating blog:", error);
        }
    });
}


    </script>
</div>

</body>
</html>