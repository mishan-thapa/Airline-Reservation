package admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Admindao {

	private Connection con;

	public Admindao(Connection con) {
		this.con = con;
	}
	
	public Admin getAdminNameAndPassword(String adminname,String adminpassword) {
		Admin admin=null;
		
		try {
			String query ="select * from adminlist where adminname=? and adminpassword=?";
			PreparedStatement pstm = con.prepareStatement(query);
			pstm.setString(1, adminname);
			pstm.setString(2, adminpassword);
			
			ResultSet set = pstm.executeQuery();
			
			while(set.next()) {
				admin = new Admin();
				
				admin.setAdminname(set.getString("adminname"));
				admin.setAdminpassword(set.getString("adminpassword"));
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return admin;
	}
	
}
