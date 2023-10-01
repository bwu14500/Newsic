<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Page</title>
<link rel="stylesheet" href="style.css">

	<%
		String keyWord = (String)request.getParameter("search");
		if(keyWord == null){
			keyWord = "";
		}
	%>
</head>
<body>
	<!-- NAV BAR -->
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
		      <input type="text" class="searchTerm" placeholder="Search..." name = "search">
		      <button type="submit" class="searchButton">
		        <i class="fa fa-search"></i>
		     </button>
		   </div>
		</div>
		</form>
		
		<br><br>
		<h1 style = "margin-left: 100px; margin-top: 50px">Showing results for <%=keyWord%></h1>
		
		<c:set var = "data" value = "${requestScope.users}"/>
		
		<div style="margin-left: 100px">
		
		<c:forEach items= "${data}" var="users">
		<br><br><hr><br>
			<table>
				<tr style = "margin-left:10px">
					<!-- <td> <i class="login__icon fas fa-user">hello</i> </td> -->
					<td style = "width: 200px">
						<i class="fa fa-user-circle-o" aria-hidden="true" style="font-size:150px; mmargin-left: 30px"></i>
					</td>
					
					<td style = "width: 700px; margin-left: 10px">
		 		<div class = "rowFeed" style = "font-size: 25px; margin-bottom: 5px" >
						<c:out value="${users.getName()}"/><br>
					</div> 
					<div class = "rowFeed" style = "font-size: 20px; margin-bottom: 5px; margin-left: 7px">
						<c:out value="${users.getEmail()}"/> <br>
					</div>
					<div class = "rowFeed" style = "font-size: 20px; margin-bottom: 5px; margin-left: 7px">
						<c:out value=" favorite genre:  ${users.getGenre()}"/> <br>
					</div>
					<div class = "rowFeed" style = "font-size: 20px; margin-bottom: 5px; margin-left: 7px">
						<c:out value=" Listening time:  ${users.getTime()} hours"/> <br>
					</div>
					<div class = "rowFeed" style = "font-size: 20px; margin-bottom: 5px; margin-left: 7px">
						<c:out value="${users.getBio()}"/><br><br>
					</div>
					</td>
				</tr>
			</table>
		
		
		
		
		<c:forEach items= "${users.getUserPosts()}" var="posts">
		<br>
		
		<div>
		<c:url value="details.jsp" var="myURL">
		   <c:param name="name" value="${posts.getName()}" />
		   <c:param name="track" value="${posts.getTrack()}" />
		   <c:param name="collection" value="${posts.getCollection()}" />
		   <c:param name="url" value="${posts.getUrl()}" />
		   <c:param name="artUrl" value="${posts.getArtUrl()}" />
		   <c:param name="comment" value="${posts.getComment()}" />
	    </c:url>
		
		
		
	<%-- 	<div class = "rowFeed" style = "font-size: 30px; margin-top: 80px">
			<b><c:out value="${posts.getName()}"/></b><br>
		</div> --%>
		<div class = "rowFeed">
			<a href="${myURL}"> <img height = "200" height = "200" src="${posts.getArtUrl()}"></a><br>
		</div>
		<br>
		<div class = "rowFeed" style = "font-size: 25px">
			<c:out value="${posts.getTrack()}"/>
		</div>
		<br>
		<div class = "rowFeed" style = "font-size: 20px">
			<em><c:out value="${posts.getComment()}"/></em>
		</div>
		<br>
		<div class = "rowFeed" style = "font-size: 20px">
			<audio src="${posts.getUrl()}" controls></audio>
		</div>
		<br>
		</div>
		</c:forEach>
		


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