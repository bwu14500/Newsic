
package Util;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.Serial;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.time.Duration;
import java.time.Instant;
import java.util.ArrayList;
import java.util.Date;
import java.util.concurrent.TimeUnit;
/**
 * 
 * Servlet implementation class LogoutDispatcher
 */
@WebServlet("/CreatePostServlet")
public class CreatePostServlet extends HttpServlet {
    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        // TODO Remove userID cookie
    	System.out.println("Attempting to Create A Post");
    	String clicked = request.getParameter("clicked");
    	String track = request.getParameter("track"+clicked);
    	//String artist = request.getParameter("artist"+clicked);
    	String collection = request.getParameter("collection"+clicked);
    	String url = request.getParameter("url"+clicked);
    	String artUrl = request.getParameter("artUrl"+clicked);
    	String comment = request.getParameter("comment");
    	SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss.SS");
    	
    	System.out.println("Track name: "+track+" caption:  "+ comment);
    	
    
    	
    	String name = "unknown";
    	Cookie chocoChip [] = request.getCookies(); 
			if(chocoChip != null){
				for(Cookie c: chocoChip){
					if(c.getName().contentEquals("username")){
						name = c.getValue();
						name = name.replace("=", " ");
					}
				}
			}
			
		
			System.out.println("NEW POST !!!!!!");
			System.out.println(name);
			System.out.println(track);
	    	System.out.println(collection);
	    	System.out.println(url);
	    	System.out.println(artUrl);
	    	System.out.println(comment);
	    	System.out.println("!!!!!!");
    	
    	try {
    		Class.forName("com.mysql.cj.jdbc.Driver");
			String db = "jdbc:mysql://localhost:3306/Newsic?serverTimezone=UTC";
        	String user = "root";
        	String pw = "root";
        	Connection conn = DriverManager.getConnection(db, user, pw); 
        	
        	PreparedStatement p;
        	p = conn.prepareStatement("SET SQL_SAFE_UPDATES = 0;"); //safe updates 
        	p.execute();
        	p = conn.prepareStatement("INSERT INTO newsic_Posts(time, name, track, collection, url, artUrl, comment) VALUES (?, ?, ?, ?, ?, ?, ?)");
        	p.setString(1, dateFormat.format(new Date()).substring(0, 11));
        	p.setString(2,  name);
        	p.setString(3, track);
        	p.setString(4, collection);
        	p.setString(5, url);
        	p.setString(6, artUrl);
        	p.setString(7, comment);
        	int row = p.executeUpdate();
        	
        	
        	//cookie
    		
    		Cookie oat = new Cookie("create", "post");
    		response.addCookie(oat);
	    	oat.setMaxAge(60*60);
        	
        	
        	response.sendRedirect("HomeServlet");
    	}
    	catch(Exception e) {
    		e.printStackTrace();
    		response.sendRedirect("createPost.jsp");
    	}

    	//cookies.setMaxAge(0);
		
    	
//    	
//    	chocoChip.setMaxAge(0);
//    	response.addCookie(chocoChip);
//    	response.sendRedirect("index.jsp");
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        doGet(request, response);
    }

}
