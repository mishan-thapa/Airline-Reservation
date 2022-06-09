package user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import flight.ConnectionProvider;

public class login extends HttpServlet {
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		String loginidString =request.getParameter("loginid");
		String loginpassString = request.getParameter("loginpass");
		
		try {
			userdao dao = new userdao(ConnectionProvider.getconnection());
			user u= dao.getUserEmailAndPassword(loginidString, loginpassString);
			
			if(u==null) {
				out.println("vayana hai");
			}else {
				HttpSession session = request.getSession();
				session.setAttribute("email", u.getEmail());
				session.setAttribute("fname", u.getFname());
				session.setAttribute("lname", u.getLname());
				session.setAttribute("roleDB", "user");
				
				response.sendRedirect("UserProfile.jsp");
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		

			//response.sendRedirect("userlogin.jsp");
		
		
		
		
	}

}
