<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us</title>
    <style>
        form {
            width: 400px;
            padding: 20px; 
            padding-top:30px;
            font-family: Arial, sans-serif;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            background-color: #fff;
            align-items: center;
            color: #000;
            margin: 0 auto; /* Center the form horizontally */
            text-align: left; /* Align the text to the left */
            min-height: 50vh;
        }

        h1 {
            color: #333;
            margin-bottom: 20px; /* Add some spacing below the heading */
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #333;
            padding:5px;
        }

        input,
        textarea {
        padding-top:5px;
            width: 100%;
            padding: 10px;
            margin-bottom: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        button {
            /*background-color: #000;*/
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            font-size: 16px; /* Adjust font size */
        }

        button:hover {
        color:white;
            background-color: #333;
        }
    </style>
</head>
<body>
<%@ include file="userlognav.jsp"%>
    <form action="AddContact" method="post">
        <h1>Contact Us</h1>
        <label for="name">Your Name:</label>
        <input type="text" id="name" name="name" required>

        <label for="email">Your Email:</label>
        <input type="email" id="email" name="email" required>

        <label for="message">Your Message:</label>
        <textarea id="message" name="message" rows="4" required></textarea>

        <button type="submit">Submit</button>
    </form>
</body>
</html>
