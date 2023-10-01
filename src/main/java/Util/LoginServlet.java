package Util;

import javax.servlet.ServletException;

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
import java.sql.SQLException;

/**
 * Servlet implementation class LoginDispatcher
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Serial
    private static final long serialVersionUID = 1L;

   
    public class EmailException extends Exception{
		private static final long serialVersionUID = 1L;

		public EmailException(String email) {
    		super(email);
    	}
    }
    public class PasswordException extends Exception{
		private static final long serialVersionUID = 1L;

		public PasswordException(String name) {
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
        //TODO
    	
    	System.out.println("Attempting to Login");
    	response.setContentType("text/html");
		

		String naL = request.getParameter("name");
    	String emL = request.getParameter("email");
    	String pwL = request.getParameter("password");
    	String sqlP;
    	String sqlE;
    
    	
    	String emailPattern = "^[a-zA-Z0-9_+&*-]+(?:\\."
	            + "[a-zA-Z0-9_+&*-]+)*@"
	            + "(?:[a-zA-Z0-9-]+\\.)+[a-z"
	            + "A-Z]{2,7}$";
    	
    	//go to table and get name associated with the email
    	//make that name into a cookie 
    	//connect to SQL
    	try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String db = "jdbc:mysql://localhost:3306/Newsic?serverTimezone=UTC";
	    	String user = "root";
	    	String pw = "root";
	    	Connection conn = DriverManager.getConnection(db, user, pw); 
	    	PreparedStatement p;
	    	PreparedStatement gp;
	    	
	    	String sqlStr = "SELECT * FROM newsic_Users WHERE email=?";
	    	p = conn.prepareStatement(sqlStr);
	    	p.setString(1, emL);
	    	ResultSet r = p.executeQuery();
	    	
	    	
	    	//CHECK EMAIL IS VALID
//    		//not a valid email case
        	if(!emL.matches(emailPattern)) {
        		throw new EmailException(emL);
        	}
        
        	
        	if(r.next() ) {
        		naL = r.getString("name");
        		sqlP = r.getString("password");
        		sqlE = r.getString("email");
        		if(!pwL.equals(sqlP)) {
        			throw new PasswordException(pwL);
        		}
        		
        		//cookie
        		naL = naL.replace(" ", "=");
        		Cookie chocoChip = new Cookie("username", naL);
        		response.addCookie(chocoChip);
        		
    	    	chocoChip.setMaxAge(60*60);
        		response.sendRedirect("HomeServlet");
        	}
        	
	    	else { //email matches and email exists in table 
	    		throw new SQLException();
	    	}
//	    
        
    	}
    	catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
//			e.printStackTrace();
			request.setAttribute("error", "Account with this email does not exists, Please Register");
			getServletContext().getRequestDispatcher("/register.jsp").forward(request, response);
		} catch(EmailException e) {
			request.setAttribute("error", "Email format is not valid");
			getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
		} 
    	catch(PasswordException e) {
			request.setAttribute("error", "Incorrect Password");
			getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
		}
    	
 	
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}