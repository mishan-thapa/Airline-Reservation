package user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;

import flight.ConnectionProvider;

public class registerServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		PrintWriter out = response.getWriter();
		out.println("aayo hay");
		
		String first_name = request.getParameter("first_name");
		String last_name = request.getParameter("last_name");
		String email = request.getParameter("inputemail");
		String password = request.getParameter("inputpassword");
		String gender = request.getParameter("gender");
		//create a user class object to insert these value 
		user user = new user(first_name,last_name,email,password,gender);
		
		out.println("<div class=\"alert alert-success\" role=\"alert\">\r\n"
				+ "  <h4 class=\"alert-heading\">Well done!</h4>\r\n"
				+ "  <p>Aww yeah, you successfully read this important alert message. This example text is going to run a bit longer so that you can see how spacing within an alert works with this kind of content.</p>\r\n"
				+ "  <hr>\r\n"
				+ "  <p class=\"mb-0\">Whenever you need to, be sure to use margin utilities to keep things nice and tidy.</p>\r\n"
				+ "</div>");
		
		
		//to put in the database 
		//create a userdao object 
		try {
			userdao userd = new userdao(ConnectionProvider.getconnection());
			userd.saveuser(user);
			response.sendRedirect("userlogin.jsp");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		out.println(last_name);
	}

}
