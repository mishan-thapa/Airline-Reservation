package admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import ticket.ticket;
import ticket.ticketdao;
import user.user;
import user.userdao;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import flight.ConnectionProvider;


public class AddFlightServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		out.println("ohh yea....!");
		
		String flightno = request.getParameter("addflightnoid");
		String flightname = request.getParameter("addflightnameid");
		String fromcity = request.getParameter("addfromcityid");
		String tocity = request.getParameter("addtocityid");
		String date = request.getParameter("adddateid");
		String time = request.getParameter("addtimeid");
		String airportname = request.getParameter("addairportnameid");
		String price = request.getParameter("addpriceid");
		
		//create a ticket class object to insert these value 
		ticket ticket = new ticket(flightno,flightname,fromcity,tocity,date,time,airportname,price);
		
		
		
		
		//to put in the database 
		//create a userdao object 
		try {
			ticketdao ticketdao = new ticketdao(ConnectionProvider.getconnection());
			boolean horw= ticketdao.saveflight(ticket);
			//response.sendRedirect("FlightInfoAdmin.jsp");
			out.print(horw);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
