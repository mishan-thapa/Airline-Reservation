package admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import flight.ConnectionProvider;


public class AdminLogin extends HttpServlet {
	
	//this below is for sending to the login page

	
	//this below is for the adminlogin 
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		PrintWriter out = response.getWriter();
		String adminname =request.getParameter("adminname");
		String adminpassword = request.getParameter("adminpassword");
		
		try {
			Admindao dao = new Admindao(ConnectionProvider.getconnection());
			Admin a= dao.getAdminNameAndPassword(adminname, adminpassword);
			
			if(a==null) {
				out.println("vayana hai");
			}else {
				HttpSession session = request.getSession();
				session.setAttribute("adminname", adminname);
				session.setAttribute("roleDB", "admin");
				response.sendRedirect("UserDetailAdmin.jsp");
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

	
}
