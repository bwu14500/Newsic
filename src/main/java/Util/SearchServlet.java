package Util;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Util.*;


import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.Serial;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Scanner;


/**
 * Servlet implementation class SearchDispatcher
 */
@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * Default constructor.
     */
    public SearchServlet() {
    }
//
    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
//        ServletContext servletContext = getServletContext();
        // TODO get json file as stream, Initialize RestaurantDataParser by calling its initialize method

    	try {
        
        	//		RestaurantDataParser.Init("/Users/carolinesilva/Desktop/eclipse-testyspace/PA2/src/main/java/Util/restaurant_data.json");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }


    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    	 // TODO
		String keyWord = (String)request.getParameter("search");
    	
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
        	PreparedStatement p2;
        	p = conn.prepareStatement("SET SQL_SAFE_UPDATES = 0;"); //safe updates 
        	p.execute();

        	
        	String SQLSTR = "SELECT * \n";
        		SQLSTR += "FROM newsic_Users n \n";
        		SQLSTR+= "WHERE n.name LIKE '%" + keyWord + "%' \n";
        		
        		
        	p = conn.prepareStatement(SQLSTR);
        	ResultSet rset = p.executeQuery();
        	
        	
        	ArrayList<Users> users = new ArrayList<Users>();
        	while(rset.next()) {
        		
        		
        	String SQLSTR2 = "SELECT * \n";
        	SQLSTR2 += "FROM newsic_Posts n \n";
        	SQLSTR2+= "WHERE n.name LIKE '%" + rset.getString("name") + "%' \n";
        	p2 = conn.prepareStatement(SQLSTR2);
        	ResultSet rset2 = p2.executeQuery();
        	ArrayList<Post> posts = new ArrayList<Post>();
        	
        	while(rset2.next()) {
        		posts.add(new Post(rset2.getString("time"),rset2.getString("name"),rset2.getString("track"),rset2.getString("collection"), rset2.getString("url"), rset2.getString("artUrl"), rset2.getString("comment")));
        	}
        		
        		

        		users.add(new Users(rset.getString("name"), rset.getString("email"), rset.getString("password"), rset.getString("genre"), rset.getString("time"), rset.getString("bio"), posts));
        		
        		
        	}
        	
        	System.out.println("here are all the users");
        	for(Users us: users) {
        		System.out.println(us.getName()+ " "+ us.getEmail());
        		
        		System.out.println("here are all of " +us.getName() +"'s posts");
        		for(Post po: us.getUserPosts()) {
        			System.out.println(po.getTrack());
        		}
        		
        		
        	}
        	
        	
        	Collections.reverse(users);
        	
        	
        	
        	request.setAttribute("users", users);
        	getServletContext().getRequestDispatcher("/search.jsp").forward(request, response);
        	
    	}
        
    	catch(Exception e) {
    		e.printStackTrace();
    		response.sendRedirect("home.jsp");
    	}
    	
    	
    	
////    	request.getRequestDispatcher("search.jsp").forward(request, response);
////    	response.setContentType("text/html;charset=UTF-8");
////    	request.getRequestDispatcher("search.jsp").forward(request, response); //not going 
//    	
//    	String keyWord = (String)request.getParameter("search");
//    	String sort = (String)request.getParameter("btn");
//    	String searchType = (String)request.getParameter("categories");
//    	
//    	//ArrayList<Business> results = RestaurantDataParser.Init("/Users/carolinesilva/Desktop/eclipse-testyspace/PA2/src/main/webapp/restaurant_data.json", keyWord, sort, searchType);
//    	
//		ArrayList<Business> results = RestaurantDataParser.getBusinesses(keyWord, sort, searchType);
//		
//		
//		request.setAttribute("searchData", results);  
//		
//		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/search.jsp");
//		dispatcher.forward(request, response);
    	
    }
    

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }
}