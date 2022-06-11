package ticket;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import user.user;

public class ticketdao {

	private Connection con;

	public ticketdao(Connection con) {
		this.con = con;
	}
	
	
	public boolean saveflight(ticket ticket) {
		try {
			
			
			String query ="insert into flightinfo(flightno,flightname,fromcity,tocity,date,time,airportname,price) values(?,?,?,?,?,?,?,?)";
			PreparedStatement pstmt = this.con.prepareStatement(query);
			pstmt.setString(1, ticket.getFligtnumber() );
			pstmt.setString(2,ticket.getFlightname() );
			pstmt.setString(3,ticket.getFromCity() );
			pstmt.setString(4,ticket.getToCity() );
			pstmt.setString(5,ticket.getDate() );
			pstmt.setString(6,ticket.getTime() );
			pstmt.setString(7,ticket.getAirportName() );
			pstmt.setString(8,ticket.getPrice() );
			
			
			pstmt.executeUpdate();
			return true;
		}catch(Exception e) {
			e.printStackTrace();
			return false;
		}
		
	}
	
	
	
	public ticket getticketinfo(String flightno) {
		ticket ticket=null;
		
		try {
			String query ="select * from flightinfo where flightno =?";
			PreparedStatement pstm = con.prepareStatement(query);
			pstm.setString(1, flightno);
			
			ResultSet set = pstm.executeQuery();
			
			while(set.next()) {
				ticket = new ticket();
				
				ticket.setFligtnumber(flightno);
				ticket.setFlightname(set.getString(2));
				ticket.setFromCity(set.getString(3));
				ticket.setToCity(set.getString(4));
				ticket.setDate(set.getString(5));
				ticket.setTime(set.getString(6));
				ticket.setAirportName(set.getString(7));
				ticket.setPrice(set.getString(8));
				
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return ticket;
	}
	
	public void bookticket(ticket ticket) {
try {
			
			
			String query ="insert into bookedflights(flightno,flightname,fromcity,tocity,date,time,airportname,price,fname,email,ticketno) values(?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement pstmt = this.con.prepareStatement(query);
			pstmt.setString(1,ticket.getFligtnumber());
			pstmt.setString(2,ticket.getFlightname());
			pstmt.setString(3,ticket.getFromCity());
			pstmt.setString(4,ticket.getToCity());
			pstmt.setString(5,ticket.getDate());
			pstmt.setString(6,ticket.getTime());
			pstmt.setString(7,ticket.getAirportName());
			pstmt.setString(8,ticket.getPrice());
			pstmt.setString(9,ticket.getFname());
			pstmt.setString(10,ticket.getEmail());
			pstmt.setString(11,ticket.getTicketno());
			
			
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}
	}
	
}
