package ticket;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import user.userdao;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import flight.ConnectionProvider;


public class BookFlightServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		//response.sendRedirect("UserProfile.jsp");
		PrintWriter out = response.getWriter();
		String flightnumber=request.getParameter("flightnumberid1");
		
		String flightname= request.getParameter("flightnameid1");
		String fromcity=request.getParameter("fromcityid1");
		String tocity=request.getParameter("tocityid1");
		String date=request.getParameter("dateid1");
		String time=request.getParameter("timeid1");
		String airportname=request.getParameter("airportnameid1");
		String price=request.getParameter("priceid1");
		out.println("aayo hay");
		
		String fname = request.getParameter("fnameid1");
		String email=request.getParameter("emailid1");
		String ticketno=request.getParameter("numberofticketid1");
		
ticket ticket = new ticket(flightnumber,flightname,fromcity,tocity,date,time,airportname,price,fname,email,ticketno);
		
		try {
			ticketdao ticketbook = new ticketdao(ConnectionProvider.getconnection());
			ticketbook.bookticket(ticket);
			response.sendRedirect("UserProfile.jsp");
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
