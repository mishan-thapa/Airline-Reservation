package ticket;

public class ticket {

private String fligtnumber ;
private String flightname;
private String fromCity;
private String toCity;
private String date;
private String time;
private String airportName;
private String price;
private String fname;
private String email;
private String ticketno;


public String getTicketno() {
	return ticketno;
}
public void setTicketno(String ticketno) {
	this.ticketno = ticketno;
}
public String getFname() {
	return fname;
}
public void setFname(String fname) {
	this.fname = fname;
}

public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getFligtnumber() {
	return fligtnumber;
}
public void setFligtnumber(String fligtnumber) {
	this.fligtnumber = fligtnumber;
}
public String getFlightname() {
	return flightname;
}
public void setFlightname(String flightname) {
	this.flightname = flightname;
}
public String getFromCity() {
	return fromCity;
}
public void setFromCity(String fromCity) {
	this.fromCity = fromCity;
}
public String getToCity() {
	return toCity;
}
public void setToCity(String toCity) {
	this.toCity = toCity;
}
public String getDate() {
	return date;
}
public void setDate(String date) {
	this.date = date;
}
public String getTime() {
	return time;
}
public void setTime(String time) {
	this.time = time;
}
public String getAirportName() {
	return airportName;
}
public void setAirportName(String airportName) {
	this.airportName = airportName;
}
public String getPrice() {
	return price;
}
public void setPrice(String price) {
	this.price = price;
}

public ticket(String fligtnumber, String flightname, String fromCity, String toCity, String date, String time,
		String airportName, String price, String fname, String email ,String ticketno) {
	super();
	this.fligtnumber = fligtnumber;
	this.flightname = flightname;
	this.fromCity = fromCity;
	this.toCity = toCity;
	this.date = date;
	this.time = time;
	this.airportName = airportName;
	this.price = price;
	this.fname = fname;
	this.email = email;
	this.ticketno = ticketno;
}
public ticket() {
	super();
}
public ticket(String fligtnumber, String flightname, String fromCity, String toCity, String date, String time,
		String airportName, String price) {
	super();
	this.fligtnumber = fligtnumber;
	this.flightname = flightname;
	this.fromCity = fromCity;
	this.toCity = toCity;
	this.date = date;
	this.time = time;
	this.airportName = airportName;
	this.price = price;
}





	
	
}
