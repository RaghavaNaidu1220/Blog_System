<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create a Blog Post</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
            margin: 0;
            padding: 0;
        }

        .createpost-container {
            display: flex;
            flex-direction: column;
           /* align-items: center;
            justify-content: center;*/
            min-height: 100vh;
            background-color: #f7f7f7;
        }

        header {
            background-color: #ff483f;
            color: #fff;
            padding: 0px;
            text-align: center;
            margin-bottom: 20px;
            width: auto;
            box-sizing: border-box;
        }

        header:hover {
            background-color: #ff6f61;
        }

        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
            /*text-align: center;*/
            max-width: 450px;
            width: 100%;
            margin: 0 auto;
            transition: transform 0.3s ease-in-out;
        }

        form:hover {
            transform: scale(1.05);
        }

        label, input, textarea {
            display: block;
            margin-bottom: 15px;
            
        }
        
        label{
        	padding:15px;	
        }

        input[type="text"],
        input[type="file"],
        textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            transition: border-color 0.3s ease-in-out;
        }

        input[type="text"]:focus,
        input[type="file"]:focus,
        textarea:focus {
            border-color: #ff6f61;
        }

        input[type="file"] {
            padding: 5px;
            padding-bottom: 10px;
        }

        button {
            font-family: inherit;
            font-size: 20px;
            background: royalblue;
            color: white;
            padding: 12px 25px;
            display: flex;
            align-items: center;
            justify-content: center;
            border: none;
            border-radius: 16px;
            overflow: hidden;
            transition: all 0.2s;
            cursor: pointer;
        }

        button:hover {
            background-color: #ff483f;
        }

        button span {
            margin-left: 0.3em;
            transition: all 0.3s ease-in-out;
        }

        button svg {
            display: block;
            transform-origin: center center;
            transition: transform 0.3s ease-in-out;
        }

        button:hover .svg-wrapper {
            animation: fly-1 0.6s ease-in-out infinite alternate;
        }

        button:hover svg {
            transform: translateX(1.2em) rotate(45deg) scale(1.1);
        }

        button:hover span {
            transform: translateX(5em);
        }

        button:active {
            transform: scale(0.95);
        }

        @keyframes fly-1 {
            from {
                transform: translateY(0.1em);
            }

            to {
                transform: translateY(-0.1em);
            }
        }
    </style>
</head>
<body>
<%@ include file="userlognav.jsp" %>

<div class="createpost-container">

    <header>
        <h1>Create a Blog Post</h1>
    </header>

    <form method="post" action="insert-blog-post" enctype="multipart/form-data" onsubmit="return validateForm();">
        <label for="title">Title:</label>
        <input type="text" id="title" name="title" required>

        <!--  <label for="author">Author:</label>-->
        <input type="hidden" id="author" name="author" value="${eusername}">
		<input type="hidden" id="uid" name="uid" value="${eid}">
        <label for="content">Content:</label>
        <textarea id="content" name="content" rows="6" required></textarea>

        <label for="image">Upload an Image:</label>
        <input type="file" id="image" name="image" accept="image/*">

        <button type="submit">
            <div class="svg-wrapper-1">
                <div class="svg-wrapper">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24">
                        <path fill="none" d="M0 0h24v24H0z"></path>
                        <path fill="currentColor"
                              d="M1.946 9.315c-.522-.174-.527-.455.01-.634l19.087-6.362c.529-.176.832.12.684.638l-5.454 19.086c-.15.529-.455.547-.679.045L12 14l6-8-8 6-8.054-2.685z"></path>
                    </svg>
                </div>
            </div>
            <span>Post</span>
        </button>
    </form>
    <script>
function validateForm() {
    var uid = document.getElementById("uid").value;
    console.log("uid:", uid); // Add this line for debugging
    if (!uid || uid.trim() === '') {
        alert('Please login again. Something went wrong.');
        return false; // Prevent form submission
    }
    return true; // Allow form submission
}
</script>



</div>

</body>
</html>