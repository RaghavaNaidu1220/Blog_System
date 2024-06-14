<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
	<link rel="stylesheet" type="text/css" href="css/register.css">
</head>

<body>
  <h2>Welcome to The Blog Guru</h2> 
  <% 
                    String errorMessage = (String) request.getAttribute("errorMessage");
                    if (errorMessage != null) {
                %>
                    <div class="error-mess	age" style="color:red; margin-bottom:10px;">
                        <%= errorMessage %>
                    </div>
                <%
                    }
                %>
  <div class="container" id="container">
    <div class="overlay-container">
      <div class="overlay">
        <div class="overlay-panel overlay-left">
          <h1>Welcome Back!</h1>
          <p>To keep connected with us, please log in with your personal info</p>
          <a href="login.jsp"><button >Sign In</button></a>
        </div>
        <div class="overlay-panel overlay-right">
          <form action="insert" method="post" >
            <h1>Create Account</h1>
            <div class="social-container">
                <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
                <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
                <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
            </div>
            <span>or use your email for registration</span>
            <input type="text" name="username" placeholder="Username" id="username" required />
            <input type="email" name="email" placeholder="Email" id="email" required />
            <input type="password" name="pass" placeholder="Password" id="pass" required />
            <button type="submit">Sign Up</button>
          </form>
        </div>
      </div>
    </div>
  </div>
  <footer>
    <p>
        Under Development
    </p>
</footer>
</body>
</html>
