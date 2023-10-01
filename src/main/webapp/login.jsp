<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Login Page</title>
		<link rel="stylesheet" href="style.css">
		<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">  -->
	<!-- <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css"> -->
	<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css"> -->
			 <!-- what line to i use to connect the JS fiel to this JSP ??? -->
			<script src="https://kit.fontawesome.com/52aad9866a.js" crossorigin="anonymous"></script>
</head>
<body>
	 <div class="circle">
	 
	<div class="container" >
	<div class="screen">
		<div class="screen__content">
			<!-- logo -->
	  		<a href = "home.jsp"> <img class = "logoImgLog" id="logoImg" src="images/logo.png">  </a>
			<form action="LoginServlet" class="login">
				<div class="login__field">
					<i class="login__icon fas fa-user"></i>
				<!-- 	<i class="fa-solid fa-user"> -->
					<input type="text" name = "email" class="login__input" placeholder="User name / Email" required>
		
				</div>
				<div class="login__field">
					<i class="login__icon fas fa-lock"></i>
					<input type="password" name = "password" class="login__input" placeholder="Password" required>
				</div>
				<button class="button login__submit">
					<span class="button__text">Log In Now</span>
					<i class="button__icon fas fa-chevron-right"></i>
				</button>				
			</form>
			<div>
				<ul><a href = "register.jsp" class = "navbar_link">new to NEWSIC, Sign up here </a></ul>
			</div>
			<br>
			
		</div>
		<div class="screen__background">
			<span class="screen__background__shape screen__background__shape4"></span>
			<span class="screen__background__shape screen__background__shape3"></span>		
			<span class="screen__background__shape screen__background__shape2"></span>
			<span class="screen__background__shape screen__background__shape1"></span>
		</div>		
	</div>
</div>
	 
	 </div>
	

</body>
</html>