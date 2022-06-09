package user;

public class user {

	private int id;
	private String fname;
	private String lname;
	private String gender;
	private String email;
	private String password;
	
	
	public user(int id, String fname, String lname, String gender, String email, String password) {
		super();
		this.id = id;
		this.fname = fname;
		this.lname = lname;
		this.gender = gender;
		this.email = email;
		this.password = password;
	}


	public user() {
		super();
	}


	public user(String fname, String lname, String email, String password, String gender) {
		super();
		this.fname = fname;
		this.lname = lname;
		this.gender = gender;
		this.email = email;
		this.password = password;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getFname() {
		return fname;
	}


	public void setFname(String fname) {
		this.fname = fname;
	}


	public String getLname() {
		return lname;
	}


	public void setLname(String lname) {
		this.lname = lname;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}
	
	
	
}
