<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="stylesheet" hrefhttps://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    <script type="text/javascript" src="js/login.js"></script>
</head>
<body>
    <h2>Welcome to The Blog Guru</h2>
    <% 
                    String errorMessage = (String) request.getAttribute("errorMessage");
                    if (errorMessage != null) {
                %>
                    <div class="error-message" style="color:red; margin-bottom:10px;">
                        <%= errorMessage %>
                    </div>
                <%
                    }
                %>
    <div class="container" id="container">
        <div class="form-container sign-in-container">
            <form action="login" method="post">
                <h1>Sign in</h1>
                
                <div class="social-container">
                    <a href="#" class="social"><i class="ti-facebook"></i></a>
                    <a href="#" class="social"><i class="fab fa-google-plus"></i></a>
                    <a href="#" class="social"><i class="fab fa-linkedin"></i></a>
                </div>
                <span>or use your account</span>
                <input type="email" name="email" placeholder="Email" id="email" required />
                <input type="password" name="pass" placeholder="Password" id="pass" required/>
                
                <a href="#">Forgot your password?</a>
                <button type="submit">Sign In</button>
            </form>
        </div>
        <div class="overlay-container">
            <div class="overlay">
                <div class="overlay-panel overlay-left">
                    <h1>Welcome Back!</h1>
                    <p>To keep connected with us please login with your personal info</p>
                    <button class="ghost" id="signIn">Sign In</button>
                </div>
                <div class="overlay-panel overlay-right">
                    <h1>Hello, Friend!</h1>
                    <p>Enter your personal details and start the journey with us</p>
                    <a href="register.jsp"><button>Sign Up</button></a>
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
