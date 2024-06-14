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

        a {
            text-decoration: none;
            color: white;
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

        /* Centered message */
        .centered-message {
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: #000;
            color: #fff;
            padding: 20px;
            border-radius: 5px;
            display: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>${blog.title}</h1>
        <p>Author: <a onClick="handleAuthorLinkClick('${blog.author}', '${eid}')" style="color:black" id="usernameLink">${blog.author}</a></p>
        <img src="displayproimage?id=${blog.id}" alt="Blog Image"> 
        <p>${blog.content}</p><br>
    
        <button onClick="goback()">Back</button>

        <div class="comment-section">
            <form method="post" action="addcomment" onsubmit="return handleCommentSubmission()">
                <input type="hidden" id="name" name="name"  value="${eusername}"  />
                <input type="hidden" id="uid" name="uid" value="${eid}">
                <input type="hidden" name="id" id="id" value="${blog.id}" />
                <input type="text" class="comment-input" placeholder="Add a comment" id="comment" name="comment">
                <button type="submit" class="submit-button">Submit</button>
            </form>
        </div>
        
        <div class="comments">
            <div style="text-align:center;">Comments</div>
            <c:forEach items="${blog.comments}" var="comment">
                <div class="comment">
                    <p><b style="color: green;">${comment.name}</b>: ${comment.comment}</p>
                </div>
            </c:forEach>
        </div>
    </div>

    <!-- Centered message for login -->
    <div id="loginMessage" class="centered-message">
        Please login to see the author details.
    </div>
     <div id="loginMessages" class="centered-message">
        Please login to comment .
    </div>

    <script>
        var usernameLink = document.getElementById("usernameLink");
        var loginMessage = document.getElementById("loginMessage");
        var loginMessages = document.getElementById("loginMessages");

        function handleAuthorLinkClick(author, eid) {
            // Check if 'eid' attribute is present and is a non-empty numeric string
            if (eid && eid.match(/^\d+$/)) {
                // If 'eid' exists, redirect to the desired link (e.g., author profile)
                window.location.href = '${pageContext.request.contextPath}/profile/blogauthor?author=' + author + '&eid=' + eid;
            } else {
                // If 'eid' doesn't exist, show the login message
                showLoginMessage();
            }
        }

        function showLoginMessage() {
            loginMessage.style.display = "block";
            setTimeout(function () {
                loginMessage.style.display = "none";
                // Redirect to login.jsp after 3 seconds
                window.location.href = '<c:url value="/login.jsp" />';
            }, 3000);
        }
        function showLoginMessages() {
            loginMessages.style.display = "block";
            setTimeout(function () {
                loginMessages.style.display = "none";
                // Redirect to login.jsp after 3 seconds
                window.location.href = '<c:url value="/login.jsp" />';
            }, 3000);
        }

        function goback() {
            window.history.back();
        }

        function handleCommentSubmission() {
            // Check if both 'uid' and 'eid' attributes are present and are non-empty numeric strings
            var uid = "${uid}";
            var eid = "${eid}";

            if (uid && eid && uid.match(/^\d+$/) && eid.match(/^\d+$/)) {
                // If both 'uid' and 'eid' exist, submit the comment
                return true;
            } else {
                // If either 'uid' or 'eid' doesn't exist, show the login message
                showLoginMessages();
                return false; // Prevent the default form submission
            }
        }
    </script>
</body>
</html>
	