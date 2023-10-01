<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Newsic Landing/Home Page</title>
	<link rel="stylesheet" href="style.css">
  	<script src="music.js"></script>
</head>

<body>
	<!-- NAV BAR -->
	<!-- git comment  -->
        <nav class="navbar">
        	<div class = "navbar_container">
        		<div class = "container">
        		<!-- <a href = "home.jsp" id = "navbar_logo"> 
        		<img class = "logoImg" id="logoImg" src="images/logo.png"> -->
        		<a href = "HomeServlet"> <img class = "logoImg" id="logoImg" src="images/logo.png">  </a>
      				</a>
      				<a>
      				
      				<% Cookie chocoChip [] = request.getCookies(); 
      					boolean loggedIn = false;
      					if(chocoChip != null){
      						for(Cookie c: chocoChip){
      							if(c.getName().contentEquals("username")){
      								String name = c.getValue();
      								name = name.replace("=", " ");
      								loggedIn = true;
      								%> <div class = "greeting" style = "color: black; font-family: Veranda; font-size: 18px; margin-left: 15px;"  > Hi <%= name %>!</div> <%
      							}
      						}
      					}
      					%> 
      				
        	</a>
        	</div>
        		<ul class = "navbar_menu">
        			<li class = "navbar_item">
        			 <%if(!loggedIn){ %>
        				 <li class = "navbar_item">
        					<a href = "login.jsp" class = "navbar_link"> Login </a>
        				</li>
        				<li class = "navbar_item">
        					<a href = "register.jsp" class = "navbar_link"> SignUp </a>
        				</li>
        			<%} else { %>
        				<li class = "navbar_item">
        				<a href = "PlaylistServlet" class = "navbar_link"> Playlist </a>
        				</li>
        			 	<li class = "navbar_item">
        					<a href = "createPost.jsp" class = "navbar_link"> Create Post </a>
        				</li>
        				<li class = "navbar_item">
        					<a href = "LogoutServlet" class = "navbar_link"> Logout </a>
        				</li>
        				<%} %> 
        			</li>
        		</ul>
        	</div>
        </nav>
        <br><br>
	
	   <!-- SEARCH BAR -->
        
       <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
       
       <form class="search" action="SearchServlet" method="GET">
       <div class="wrap">
		   <div class="search">
		      <input type="text" class="searchTerm" placeholder=" Search..." name = "search">
		      <button type="submit" class="searchButton">
		        <i class="fa fa-search"></i>
		     </button>
		   </div>
		</div>
		</form>
		
		
		
		<br><br><br><br>
		<h1 style = "margin-left: 42%">PLAYLIST</h1>
		
		
		<c:set var = "data" value = "${requestScope.playlist}"/>
		
		<div style="margin-top: 100px; margin-left: 150px">
		
		<c:forEach items= "${data}" var="playlist">
		
		
		
		<c:url value="details.jsp" var="myURL">
		   <c:param name="name" value="${playlist.getName()}" />
		   <c:param name="track" value="${playlist.getTrack()}" />
		   <c:param name="collection" value="${playlist.getCollection()}" />
		   <c:param name="url" value="${playlist.getUrl()}" />
		   <c:param name="artUrl" value="${playlist.getArtUrl()}" />
		   <c:param name="comment" value="${playlist.getComment()}" />
	   </c:url>
	   
	   
	   <div>
	   
	   <div class = "FeedPostRow">
	   <div class = "rowFeed">
		   <a href = "${myURL}">
				<img src="${playlist.getArtUrl()}" height = "400" height = "400">
			</a>
		</div>
	   	
		<div class = "rowFeed" style = "font-size: 25px">
			<c:out value="${playlist.getTrack()}"/>
		</div>
		<div class = "rowFeed" style = "font-size: 20px">
			<em><c:out value="${playlist.getComment()}"/></em>
		</div>
		<div class = "rowFeed">
			<audio src="${playlist.getUrl()}" controls></audio>
		</div>
		<br><br><br>
		</div>
		</div>
		</c:forEach>
		</div>

      <!-- NEED TO ADD
      	plus button
      	image of albumn cover
      	song name
      	artist name
      	
      	need to get this info from spotify api (top songs) store this in sql ? -->

</body>
</html>