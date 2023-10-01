<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Search Page</title>
	<link rel="stylesheet" href="style.css">
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"> 
    <link rel="icon" href="/images/faviconCB.ico">
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Roboto+Mono:wght@200;400&display=swap" rel="stylesheet">
    
<!--     <style>
		.table th, .table td {
			text-align: center;
			vertical-align: middle;
		}
        .circle{
            background: rgb(176,201,213);
            background: radial-gradient(circle, rgb(181, 201, 154) 31%, rgb(207, 225, 185) 55%,  rgb(221, 231, 208) 65%, rgb(184, 206, 200) 100%);
            height: 1000px; 
            padding: 15px;
        }
        body{
            margin: 0px;
        }
        #navbar-logo {
            width: 100px;
            margin: 0px;
            padding: 0px;
        }
        .navbar {
          background: radial-gradient(circle, rgb(221, 231, 208) 45%, rgb(184, 206, 200) 100%);
        }
        .navbar-brand
        {
          background: gradient(circle, rgb(221, 231, 208) 5%, rgb(184, 206, 200) 100%);
        }
	</style> -->
	<%
		String keyWord = (String)request.getParameter("search"); 
    	if(keyWord == null){
			keyWord = "";
		} 
	%>
</head>
<body style="background: #C9DDE3;">



	<%-- <!-- NAV BAR -->
        <nav class="navbar">
        	<div class = "navbar_container">
        		<div class = "container">
        		<!-- <a href = "home.jsp" id = "navbar_logo"> 
        		<img class = "logoImg" id="logoImg" src="images/logo.png"> -->
        		<a href = "home.jsp"> <img class = "logoImg" id="logoImg" src="images/logo.png">  </a>
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
        					<a href = "createPostServlet" class = "navbar_link"> Create Post </a>
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
	
         --%>
        <div class = "postPageColor">
  <!--       <div class = "background"> -->
        <div class="container-fluid">

            <div class="row">
                <h1 class="col-12 mt-4" style = "margin-left: 60px">Choose a Song and Create a Post</h1>
            </div> <!-- .row -->
            <div class = "musicPageSize">
            
       		<form action="HomeServlet">
       		
       		<button onclick="submit()">
       		Go Back
       		</button>
       		
       		
       		</form>

            <div class="row">

                <form action="" method="" class="col-12" id="search-form">
                    <div class="form-row">

                        <div class="col-12 mt-4 col-sm-6 col-lg-4">
                            <label for="search-id" class="sr-only">Search:</label>
                            <input type="text" name="" class="form-control" id="search-id" placeholder="Search...">
                        </div>

                        <div class="col-12 mt-4 col-sm-4 col-md-3 col-lg-2">
                            <label for="limit-id" class="sr-only">Number of results:</label>
                          <select name="" class="form-control" id="limit-id">
                                <option value="10">10 results</option>
                            </select>
                        </div>

                        <div class="col-12 mt-4 col-sm-auto">
                            <button type="submit" class="btn btn-light btn-block">Search</button>
                        </div>

                    </div> <!-- .form-row -->
                </form>

            </div> <!-- .row -->

            <div class="row">

                <div class="col-12 mt-4">
                    Showing <span id="num-results" class="font-weight-bold">1</span> result(s).
                </div>

                <table class="table table-responsive table-striped col-12 mt-3">
                    <thead>
                        <tr>
                            <th>Cover</th>
                            <th>Artist</th>
                            <th>Track</th>
                            <th>Album</th>
                            <th>Preview</th>
                        </tr>
                    </thead>
                    <tbody style = "background: #C9DDE3">

                        <!-- <tr>
                            <td><img src="http://is2.mzstatic.com/image/thumb/Music/v4/40/d0/29/40d029b5-4c32-53d2-69d1-ea04a513c345/source/100x100bb.jpg"></td>
                            <td>The Beatles</td>
                            <td>Here Comes the Sun</td>
                            <td>Abbey Road</td>
                            <td><audio src="https://audio-ssl.itunes.apple.com/apple-assets-us-std-000001/AudioPreview71/v4/46/48/7d/46487d90-d40c-7c47-7285-5edbfd0fd2c0/mzaf_5516723347634890825.plus.aac.p.m4a" controls></audio></td>
                        </tr> -->

                    </tbody>
                </table>
            </div> <!-- .row -->
		</div>
        </div> <!-- .container-fluid -->
<!--     </div> -->
		</div>
	<!-- import main.js file  -->
	
    <script src="music.js"></script>
    
        
        
      
</body>
</html>