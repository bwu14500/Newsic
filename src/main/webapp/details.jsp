<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="Util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Details Page</title>
	<link rel="stylesheet" href="style.css">
	 <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
</head>
<body>
	<!-- NAV BAR -->
        <nav class="navbar">
        	<div class = "navbar_container">
        		<div class = "container">
        		<!-- <a href = "home.jsp" id = "navbar_logo"> 
        		<img class = "logoImg" id="logoImg" src="images/logo.png"> -->
        		<a href = "HomeServlet"> <img class = "logoImg" id="logoImg" src="images/logo.png">  </a>
      				
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
		      <input type="text" class="searchTerm" placeholder="Search..." name = "search">
		      <button type="submit" class="searchButton">
		        <i class="fa fa-search"></i>
		     </button>
		   </div>
		</div>
		</form>
		
		
		    <c:set var="name" value="${param.name}" scope ="session"/>
		   <c:set var="track" value="${param.track}" scope ="session"/>
		   <c:set var="collection" value="${param.collection}" scope ="session"/>
		   <c:set var="url" value="${param.url}" scope ="session"/>
		   <c:set var="artUrl" value="${param.artUrl}" scope ="session"/>
		   <c:set var="comment" value="${param.comment}" scope ="session"/>
	  

   
   <div>
   
<!--    	<script>
   	
   	document.querySelector("#play-form").onsubmit = function(event){	
   		alert("Adding Song to playlist");

   		
   		
   		let htmlString=`
   		<form id = "playlist" action="AddToPlaylistServlet">
   		<input type="hidden" name="name" id="nameid" required/>
		<input type="hidden" name="track" id="trackid" required />
         <input type="hidden" name="collection" id="collectionid" required/>
         <input type="hidden" name="url" id="urlid" required/>
         <input type="hidden" name="artUrl" id="artUrlid" required/>
         <input type="hidden" name="comment" id="commentid" required />
         </form>
         `;
   		document.querySelector("#hiddenForm").innerHTML += htmlString;
   		
   		var name = document.getElementById("nameid");
   		var track = document.getElementById("trackid");
   		var collection = document.getElementById("collectionid");
   		var url = document.getElementById("urlid");
   		var artUrl = document.getElementById("artUrlid");
   		var comment = document.getElementById("commentid");
   			
   		const queryString = window.location.search;
   		const urlParams = new URLSearchParams(queryString);
   		
   		name.value = urlParams.get('name');
  		track.value = urlParams.get('track');
   		collection.value = urlParams.get('collection');
   		url.value = urlParams.get('url');
   		artUrl.value = urlParams.get('artUrl');
   		
   		console.log(name.value);
   		console.log(track.value);
   		console.log(collection.value);
   		console.log(collection.value);
   		console.log(comment.value);
   		
   		}
   		
   	</script> -->

   		<div class = "FeedPostRow" >
   				
   				<div class = "rowFeed" style = "font-size: 30px; margin-top: 60px">
		   			<b><c:out value="${sessionScope.name}" /></b> <br>
		   		</div>
		   		<div class="rowFeed">
		   			<img height = "400" height = "400" src='<c:url value = "${sessionScope.artUrl}"/>'> <br>
		   		</div>
		   		<div class="rowFeed" style = "font-size: 25px">
   					<c:out value="${sessionScope.track}"/>
   				</div>
		   		<div class = "rowFeed" style = "font-size: 20px">
					<c:out value="${sessionScope.collection}"/> <br><br>
				</div>
				<div class = "rowFeed" style = "font-size: 20px">
					<em><c:out value="${sessionScope.comment}"/> <br><br></em>
				</div>
				<div class = "rowFeed" >
					<audio src="${sessionScope.url}" controls></audio> <br><br><br>
				</div>
				<br>
				<div class = "rowFeed">
					<form action="" id="play-form">
						<button type="submit" class = "playlistBtn">
						Add Song to Playlist
						</button>
					</form>
				</div>
				<br><br><br>
		
			 
				
				<div id="hiddenForm"></div>
	
   		</div>
 	
   	
   	</div>
		
		   <script src="playlist.js"></script>

       
      <!-- NEED TO ADD
      	plus button
      	image of albumn cover
      	song name
      	artist name
      	
      	need to get this info from spotify api (top songs) store this in sql ? -->
	
</body>
</html>