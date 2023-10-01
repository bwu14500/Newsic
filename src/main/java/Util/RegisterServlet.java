package Util;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.file.Matcher;

import Util.RegisterServlet.EmailException;
import Util.RegisterServlet.NameException;
import Util.RegisterServlet.PasswordException;

import java.io.IOException;
import java.io.Serial;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.regex.Pattern;

/**
 * Servlet implementation class RegisterDispatcher
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    @Serial
    private static final long serialVersionUID = 1L;
    private static final String url = "jdbc:mysql://localhost:3306/PA2Users";

    /**
     * Default constructor.
     */
    public RegisterServlet() {
    }
    public class PasswordException extends Exception{
		private static final long serialVersionUID = 1L;

		public PasswordException(String name) {
    		super(name);
    	}
    }
    public class EmailException extends Exception{
		private static final long serialVersionUID = 1L;

		public EmailException(String email) {
    		super(email);
    	}
    }
    public class NameException extends Exception{
		private static final long serialVersionUID = 1L;

		public NameException(String name) {
    		super(name);
    	}
    }


    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	System.out.println("congrats you entered the servlet");
    	
    	String name = request.getParameter("name");
    	String email = request.getParameter("email");
    	String password = request.getParameter("password");
    	String confirmP = request.getParameter("Cpassword");
    	String genre = request.getParameter("genre");
    	String time = request.getParameter("freq");
    	String bio = request.getParameter("bio");
    	
    	//ALL CHECKS AND IF ALL DONT HIT THEN ENTER INTO TABLE 
		String emailPattern = "^[a-zA-Z0-9_+&*-]+(?:\\."
	            + "[a-zA-Z0-9_+&*-]+)*@"
	            + "(?:[a-zA-Z0-9-]+\\.)+[a-z"
	            + "A-Z]{2,7}$";
		String namePattern = "^[ A-Za-z]+$";

    
        	try {
        		//connect to SQL
    			Class.forName("com.mysql.cj.jdbc.Driver");
    			String db = "jdbc:mysql://localhost:3306/Newsic?serverTimezone=UTC";
            	String user = "root";
            	String pw = "root";
            	Connection conn = DriverManager.getConnection(db, user, pw); 
            	
            	PreparedStatement p;
            	

            	//passwords do not match
            	if(!password.equals(confirmP)) { //NOT PRINTING 
            		throw new PasswordException(password);
            	}
            	//not a valid email case
            	else if(!email.matches(emailPattern)) {
            		throw new EmailException(email);
            	}
            	else if(!name.matches(namePattern)) {
            		throw new NameException(email);
            	}
            	else {
        
            	p = conn.prepareStatement("SET SQL_SAFE_UPDATES = 0;"); //safe updates 
            	p.execute();
            	
//            	int i = 0;
//            	int count = 0;
//            	while(email.charAt(i)!='@') {
//            		i++;
//            		count++;
//            	}
//            	String username = email.substring(0, count);
//            	System.out.println(username);
            	
            	//insert user data to table
            	p = conn.prepareStatement("INSERT INTO newsic_Users(email, name, password, genre, time, bio) VALUES (?, ?, ?, ?, ?, ?)");
            	p.setString(1, email);
            	p.setString(2, name);
            	p.setString(3, password);
            	p.setString(4, genre);
            	p.setString(5, time);
            	p.setString(6, bio);
            	int row = p.executeUpdate();
            	 
            	
            	
            	//cookie
        		name = name.replace(" ", "=");
        		Cookie chocoChip = new Cookie("username", name);
        		response.addCookie(chocoChip);
        		
    	    	chocoChip.setMaxAge(60*60);
            	
            	response.sendRedirect("HomeServlet");
            	
            	}
            	
    		} 
//        	catch (ClassNotFoundException e) {
//    			// TODO Auto-generated catch block
//    			e.printStackTrace();
//    		} catch (SQLException e) {
//    			// TODO Auto-generated catch block
//    			request.setAttribute("error", "Account with this email already exists");
//    			System.out.println("Account with this email already exists");
//    			getServletContext().getRequestDispatcher("/register.jsp").forward(request,  response);
//    		} catch(PasswordException e) {
//    			request.setAttribute("error", "Passwords don't match");
//    			System.out.println("Passwords don't match");
//    			getServletContext().getRequestDispatcher("/register.jsp").forward(request,  response);
//    		} catch(EmailException e) {
//    			request.setAttribute("error", "Email format is not valid");
//    			System.out.println("Email format is not valid");
//    			getServletContext().getRequestDispatcher("/register.jsp").forward(request,  response);
//    		} catch(NameException e) {
//        		request.setAttribute("error", "Name format is not valid");
//        		System.out.println("Name format is not valid");
//        		getServletContext().getRequestDispatcher("/register.jsp").forward(request,  response);
//    		} 
        	catch(Exception e) {
        		e.printStackTrace();
    			response.sendRedirect("register.jsp");
    		}
        	
    	
    	
    	/*
    	String name = request.getParameter("name");
    	String email = request.getParameter("email");
    	String password = request.getParameter("password");
    	String confirmP = request.getParameter("Cpassword");
    	String genre = request.getParameter("genre");
    	String freq = request.getParameter("freq");
    	
    	//ALL CHECKS AND IF ALL DONT HIT THEN ENTER INTO TABLE 
		String emailPattern = "^[a-zA-Z0-9_+&*-]+(?:\\."
	            + "[a-zA-Z0-9_+&*-]+)*@"
	            + "(?:[a-zA-Z0-9-]+\\.)+[a-z"
	            + "A-Z]{2,7}$";
		String namePattern = "^[ A-Za-z]+$";

    
        	try {
        		//connect to SQL
    			Class.forName("com.mysql.cj.jdbc.Driver");
    			String db = "jdbc:mysql://localhost:3306/userInfo?serverTimezone=UTC";
            	String user = "root";
            	String pw = "root";
            	Connection conn = DriverManager.getConnection(db, user, pw); 
            	
            	PreparedStatement p;
            	

            	//passwords do not match
            	if(!password.equals(confirmP)) { //NOT PRINTING 
            		throw new PasswordException(password);
            	}
            	//not a valid email case
            	else if(!email.matches(emailPattern)) {
            		throw new EmailException(email);
            	}
            	else if(!name.matches(namePattern)) {
            		throw new NameException(email);
            	}
            	else {
        
            	p = conn.prepareStatement("SET SQL_SAFE_UPDATES = 0;"); //safe updates 
            	p.execute();
            	
            	//insert user data to table
            	p = conn.prepareStatement("INSERT INTO user_details(email, name, password) VALUES (?, ?, ?)");
            	p.setString(1, email);
            	p.setString(2, name);
            	p.setString(3, password);
            	p.setString(4,  genre);
            	p.setString(5, freq);
            	int row = p.executeUpdate();
            	
            	
            	//cookie
        		name = name.replace(" ", "=");
        		Cookie chocoChip = new Cookie("username", name);
        		response.addCookie(chocoChip);
        		
    	    	chocoChip.setMaxAge(60*60);
            	
            	response.sendRedirect("index.jsp");
            	
            	}
            	
    		} catch (ClassNotFoundException e) {
    			// TODO Auto-generated catch block
    			e.printStackTrace();
    		} catch (SQLException e) {
    			// TODO Auto-generated catch block
    			request.setAttribute("error", "Account with this email already exists");
    			getServletContext().getRequestDispatcher("/register.jsp").forward(request,  response);
    		} catch(PasswordException e) {
    			request.setAttribute("error", "Passwords don't match");
    			getServletContext().getRequestDispatcher("/register.jsp").forward(request,  response);
    		} catch(EmailException e) {
    			request.setAttribute("error", "Email format is not valid");
    			getServletContext().getRequestDispatcher("/register.jsp").forward(request,  response);
    		} catch(NameException e) {
        		request.setAttribute("error", "Name format is not valid");
        		getServletContext().getRequestDispatcher("/register.jsp").forward(request,  response);
    		} catch(Exception e) {
    			response.sendRedirect("auth.jsp");
    		}
    		*/
        	
    	}
    	

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

}
