package admin;

public class Admin {

	private String adminname;
	private String adminpassword;
	public Admin(String adminname, String adminpassword) {
		super();
		this.adminname = adminname;
		this.adminpassword = adminpassword;
	}
	public Admin() {
		super();
	}
	public String getAdminname() {
		return adminname;
	}
	public void setAdminname(String adminname) {
		this.adminname = adminname;
	}
	public String getAdminpassword() {
		return adminpassword;
	}
	public void setAdminpassword(String adminpassword) {
		this.adminpassword = adminpassword;
	}
	
	
	
}
