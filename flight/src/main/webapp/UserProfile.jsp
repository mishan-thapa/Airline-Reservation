<%@page import="ticket.ticketdao"%>
<%@page import="flight.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@page import="ticket.ticket"%>
<%@page import="com.mysql.cj.jdbc.interceptors.SessionAssociationInterceptor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile</title>

<!-- bootstrap css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<!-- font awesome icon -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- mycss -->
<link rel="stylesheet" href="css/styles.css">


</head>
<body>

<%
if(session.getAttribute("roleDB")!= "user"){
	response.sendRedirect("userlogin.jsp");
}
%>

<%@include file="normal_navbar.jsp" %>


<br>
<div class="container d-flex justify-content-center">
<h2>Profile</h2>
</div>

<!-- container start -->

<div class="container d-flex justify-content-center">

<div class="row">

<div class="col-md-4 ">

<!-- card -->
<div class="card border-primary mb-3" style="width: 25rem;">
  <div class="card-body ">
  
  
full name:  <%= session.getAttribute("fname") %>
    <%= session.getAttribute("lname") %>
    <br>
    email: <%= session.getAttribute("email") %>

  </div>
</div>

</div>

</div>

</div>

<!-- container end -->

<!-- booked ticket container start -->

<div class="container d-flex justify-content-center">
<h2>your booked tickets</h2>
</div>

<table  class="table table-light table-hover table-bordered ">
<thead  class="table-info">
    <tr>
      <th scope="col">flight no.</th>
      <th scope="col">flight name</th>
      <th scope="col">from city</th>
      <th scope="col">to city</th>
      <th scope="col">date</th>
      <th scope="col">time</th>
      <th scope="col">airsport name</th>
      <th scope="col">price</th>
      <th scope="col">No. of tickets</th>
    </tr>
  </thead>
<% 
String query = "select * from bookedflights where email=? ";
   String emailString =(String)session.getAttribute("email");
   
   String url="jdbc:mysql://localhost:3306/airreservation";
	String user="root";
	String password="locus19#";
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection(url,user,password);
	PreparedStatement pstm = con.prepareStatement(query);
	pstm.setString(1, emailString);
	ResultSet res = pstm.executeQuery();
   while(res.next()){
	   String flightno =res.getString(1);
	   String flightname = res.getString(2);
	   String fromcity = res.getString(3);
	   String tocity =res.getString(4);
	   String date =res.getString(5);
	   String time =res.getString(6);
	   String airportname =res.getString(7);
	   String price =res.getString(8);
	   String ticketno= res.getString(11);
	   %>
	   
  <tbody>
    <tr>
      <th scope="row"><%= flightno%></th>
      <td><%= flightname %></td>
      <td><%=fromcity %></td>
      <td><%= tocity %></td>
      <td><%=date %></td>
      <td><%= time %></td>
      <td><%=airportname %></td>
      <td><%= price %></td>
      <td><%= ticketno %></td>
      
    </tr>
    <%} %>
 </tbody>
</table>

<!-- booked ticket container end -->



<!-- bootstrap js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

</body>
</html>