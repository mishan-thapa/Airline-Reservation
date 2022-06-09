package flight;

import java.sql.*;

public class ConnectionProvider{
	
	public static Connection con;
	
	public static Connection getconnection() throws SQLException{
		
		String url="jdbc:mysql://localhost:3306/airreservation";
		String user="root";
		String password="locus19#";
		
	
		try {
			
			if(con==null) {
				Class.forName("com.mysql.jdbc.Driver");
				con=DriverManager.getConnection(url,user,password);
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return con;
	}
	
}