<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@page import="java.util.ArrayList" %>
<%@page import="Util.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Register Page</title>
	<link rel="stylesheet" href="style.css">
	<script src="https://kit.fontawesome.com/52aad9866a.js" crossorigin = "anonymous"></script>
</head>
<body>
	<div class="circle">
	<div class='RegFlex'> 
	 
		<div class="container">
		<div class="Regscreen">
			<div class="screen__content">
				<!-- logo -->
		  		<a href = "home.jsp"> <img class = "logoImgReg" id="logoImg" src="images/logo.png">  </a>
			<form action = "RegisterServlet" method = "GET" class = "loginReg">
				<div class = "rowBig"> 
				
				<div class = "columnBig" >
					
						<div class="login__field">
							<i class="login__icon fas fa-user"></i>
							<input type="text" name = "name" class="login__input" placeholder="Name" required>
						</div>
						<div class="login__field">
							<i class="login__icon fas fa-user"></i>
							<input type="email" name = "email" class="login__input" placeholder="Email" required>
						</div>
						<div class="login__field">
							<i class="login__icon fas fa-lock"></i>
							<input type="password" name = "password" class="login__input" placeholder="Password" required>
						</div>
						<div class="login__field">
							<i class="login__icon fas fa-lock"></i>
							<input type="password" name = "Cpassword" class="login__input" placeholder="Confirm Password" required>
						</div>
						
				</div>
				
				
				<div class = "columnBig"> 
				<br><br>
					<h3>Tell NEWSIC more about you </h3><br>
				<p>What's your favorite genre:</p>
			<div class = "RegFlex">
			  <div class = "row"> 
			    <div class = "columnMini">
				<label>
				 	<input class = "option" type="radio" id="a1" name="genre" value="rock" checked> 
					Rock
				 </label>
				 <label>
				 	<input class = "option" type="radio" id="a2" name="genre" value="hiphop">
					 Hip Hop
				 </label>
				 <label>
				 	<input class = "option" type="radio" id="a3" name="genre" value="R&B">
				 	 R & B
				 </label>
				 </div>
				 <div class = "columnMini">
				 <label>
				 	<input class = "option" type="radio" id="a4" name="genre" value="Dance">
				  	Dance
				 </label>
				 <label>
				 	<input class = "option" type="radio" id="a5" name="genre" value="County">
				  	Country
				 </label>
				 <label>
				 	<input class = "option" type="radio" id="a6" name="genre" value="Pop">
				  	Pop
				 </label>
				 </div>
			
			 </div>
			</div>
		
			
				<p>How often do you listen to music per week:</p>
				<br>
			<div class = "RefFlex">
			 <div class = "row">
			   <div class = "columnMini">
				<label>
				 	<input class = "option" type="radio" id="b1" name="freq" value="0-5" checked> 
					0-5 hours 
				 </label>
				 <label>
				 	<input class = "option" type="radio" id="b2" name="freq" value="6-10">
					 6-10 hours
				 </label>
				 </div>
				 <div class = "columnMini">
				 <label>
				 	<input class = "option" type="radio" id="b3" name="freq" value="11-15">
				 	 11-15 hours
				 </label>
				 <label>
				 	<input class = "option" type="radio" id="b4" name="freq" value="16+">
				  	16+ hours
				 </label>
				 </div>
			 </div>	 
			</div>	 
			<br>
			 	 <p>Write a short bio about yourself:</p>
				 	<div class="login__field">
							<!-- <input type="text" name = "bio" class="login__input" placeholder="Bio" required> -->
							<textarea rows="5" cols="30" name = "bio" id = "bio" placeholder=" Bio..." style =  "border-radius: 5px; background: transparent; resize: none" required></textarea>
						</div>
				</div>
					
				</div>
				
						<button class="button reg__submit">
							<span class="button__text">Sign Up Now</span>
							<i class="button__icon fas fa-chevron-right"></i>
						</button>				
					</form>
				
				<br>
				<div>
					<ul><a href = "login.jsp" class = "navbar_link"> already a NEWSIC user, sign in here</a></ul>
				</div>
				<br>
				
				<!-- <div class="social-login">
					<h3>log in via</h3>
					 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
					<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
					<div class="social-icons">
						<a href="#" class="social-login__icon fab fa-instagram"></a>
						<a href="#" class="social-login__icon fab fa-facebook"></a>
						<a href="#" class="social-login__icon fab fa-twitter"></a>
					</div>
				</div> -->
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
		</div>

</body>
</html>