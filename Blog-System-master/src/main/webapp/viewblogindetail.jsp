<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%> 
<%@ taglib uri="jakarta.tags.core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c1" %>
 
<html>
<head>
<base href="${pageContext.request.contextPath}/">
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
        }
		
		a{
			text-decoration:none;
			color:white;
		}
		/* Add this style in your existing style section */
		#usernameLink:hover {
		    color: blue; /* Change color on hover */
		    text-decoration: underline; /* Underline on hover */
		    cursor: pointer;
		}
		
		#usernameLink::after {
		    content: " (Click here to see the author's profile)"; /* Message after the author's name */
		    font-size: 14px;
		    color: #888;
		}
		
		#usernameLink:hover::after {
		    color: blue; /* Change color on hover */
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
        }
    </style>
</head>
<body>



<div class="container">
    <h1>${blog.title}</h1>
    <p>Author: <a href="${pageContext.request.contextPath}/author/${blog.author}" style="color:black" id="usernameLink">${blog.author}</a></p>
    <img src="displayproimage?id=${blog.id}" alt="Blog Image"> 
    <p>${blog.content}</p><br>
    
     <button>
	    <a  href='<c:url value="viewAllblog"></c:url>'>Back</a>
	</button>

        <!--<button onclick="goBack()">Back</button>
        <hr>
         Comment section -->
        <div class="comment-section">
        <form method="post" action="addcomment">
		    <input type="hidden" id="name" name="name"  value="${eusername}"  />
		    <input type="hidden" id="uid" name="uid" value="${eid}">
		    <input type="hidden" name="id" id="id" value="${blog.id}" />
            <input type="text" class="comment-input" placeholder="Add a comment" id="comment" name="comment">
            <button type="submit" class="submit-button">Submit</button>
        </form>
             
        </div>
        <!--   <a href="viewallcomments?id=${comment.id}" class="view-comments-button">View All Comments</a>-->
        
       <div class="comments">
    <div style="text-align:center;">Comments</div>
    <c:forEach items="${blog.comments}" var="comment">
    <div class="comment">
    <p><b style="color: green;">${comment.name}</b>: ${comment.comment}</p>
	</div>


    </c:forEach>
</div>
  
</div>
    <script>
    var usernameLink = document.getElementById("usernameLink");

    // If the username link does not exist, show a pop-up message
    if (!usernameLink) {
        alert("Username not found. Please try to relogin.");
    }

    
    // Function to go back
    function goBack() {
        // Use the stored previous URL to navigate back
        window.history.back();
    }
</script>


    
</body>
</html>
