
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
import java.util.Collections;
import java.util.Date;
import java.util.concurrent.TimeUnit;
/**
 * 
 * Servlet implementation class LogoutDispatcher
 */
@WebServlet("/PlaylistServlet")
public class PlaylistServlet extends HttpServlet {
    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
      
    	System.out.println("Going to Playlist page");
    	
    	
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
    	
    	try {
    		Class.forName("com.mysql.cj.jdbc.Driver");
			String db = "jdbc:mysql://localhost:3306/Newsic?serverTimezone=UTC";
        	String user = "root";
        	String pw = "root";
        	Connection conn = DriverManager.getConnection(db, user, pw); 
        	
        	PreparedStatement p;
        	p = conn.prepareStatement("SET SQL_SAFE_UPDATES = 0;"); //safe updates 
        	p.execute();
        	String SQLSTR = "SELECT * \n";
        		SQLSTR += "FROM newsic_Playlists n \n";
        		SQLSTR+= "WHERE n.name LIKE '%" + name + "%' \n";
        	p = conn.prepareStatement(SQLSTR);
        	ResultSet rset = p.executeQuery();
        	
        	ArrayList<Post> playlist = new ArrayList<Post>();
        	while(rset.next()) {
        		
        		boolean exists = false;
        		for(Post pt: playlist) {
        			if(pt.getTrack().equals(rset.getString("track"))) {
        				
        				System.out.println(pt.getTrack() + " = "+rset.getString("track"));
        				exists = true;
        			}
        		}
        		
        		if(!exists) {
        		
        		playlist.add(new Post(rset.getString("time"),rset.getString("name"),rset.getString("track"),rset.getString("collection"), rset.getString("url"), rset.getString("artUrl"), rset.getString("comment")));
        		}
        		
        	}
        	
        	System.out.println("here is "+ name+"'s playlist");
        	for(Post po: playlist) {
        		System.out.println(po.getTrack());
        	}
       
        	Collections.reverse(playlist);
        	request.setAttribute("playlist", playlist);
        	getServletContext().getRequestDispatcher("/playlist.jsp").forward(request, response);
        	
    	}
        
    	catch(Exception e) {
    		e.printStackTrace();
    		response.sendRedirect("HomeServlet");
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