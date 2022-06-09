package user;
import java.sql.*;


public class userdao {
	
	private Connection con;

	public userdao(Connection con) {
		this.con = con;
	}
	
	public boolean saveuser(user user) {
		boolean f =false;
		try {
			
			
			String query ="insert into userdata(fname,lname,email,password,gender) values(?,?,?,?,?)";
			PreparedStatement pstmt = this.con.prepareStatement(query);
			pstmt.setString(1, user.getFname());
			pstmt.setString(2,user.getLname() );
			pstmt.setString(3,user.getEmail() );
			pstmt.setString(4,user.getPassword() );
			pstmt.setString(5,user.getGender() );
			
			pstmt.executeUpdate();
			f=true;
		}catch(Exception e) {
			e.printStackTrace();
			
		}
		return f;
	}
	
	public user getUserEmailAndPassword(String email,String password) {
		user user = null;
		
		try {
			String query = "select * from userdata where email=? and password=?";
			PreparedStatement pstm = con.prepareStatement(query);
			pstm.setString(1, email);
			pstm.setString(2, password);
			
			ResultSet set = pstm.executeQuery();
			if(set.next()) {
				user = new user();
				String fname = set.getString("fname");
				String lname = set.getString("lname");
				String emails = set.getString("email");
				String passwords = set.getString("password");
				String gender = set.getString("gender");
				
				user.setEmail(emails);
				user.setFname(fname);
				user.setLname(lname);
				user.setPassword(passwords);
				user.setGender(gender);
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return user;
	}
	
	
	

}
