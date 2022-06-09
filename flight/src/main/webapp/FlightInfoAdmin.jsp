<%@page import="flight.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Details</title>
<!-- bootstrap css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<!-- font awesome icon -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- mycss -->
<link rel="stylesheet" href="css/styles.css">


</head>
<body>

<%@include file="normal_navbar.jsp" %>

<%
if(session.getAttribute("roleDB")!= "admin"){
	response.sendRedirect("AdminLoginPage.jsp"); 
}
%>

<br>
<br>
<div class="container-fluid text-center" >
<h2>List of all the flights</h2>
</div>
<br>



<!-- coding to display table start -->

<table class="table table-light table-hover table-bordered caption-top">
<caption>
<form >
<button type="submit" class="btn btn-primary">Add Flight</button>
</form>
</caption>
  <thead class="table-info">
    <tr>
      <th scope="col">Flight No.</th>
      <th scope="col">Flight Name</th>
      <th scope="col">From City</th>
      <th scope="col">To City</th>
      <th scope="col">Date</th>
      <th scope="col">Time</th>
      <th scope="col">Airport Name</th>
      <th scope="col">Price</th>
      <th scope="col"></th>
    </tr>
  </thead>
  <% 
   String q = " Select * from flightinfo ";
   
   String url="jdbc:mysql://localhost:3306/airreservation";
	String user="root";
	String password="locus19#";
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection(url,user,password);
   Statement st = con.createStatement();
   ResultSet res =st.executeQuery(q);
   while(res.next()){
	   String flightno =res.getString(1);
	   String flightname = res.getString(2);
	   String fromcity = res.getString(3);
	   String tocity =res.getString(4);
	   String date =res.getString(5);
	   String time =res.getString(6);
	   String airportname =res.getString(7);
	   String price =res.getString(8);
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
      <td>
      <form action="TestServlet" method="post" >
      <button type="submit" class="btn btn-primary">Edit</button>
      </form>
      </td>
    </tr>
    <%} %>
  </tbody>
</table>




<!-- coding to display table end -->



<!-- bootstrap js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

</body>
</html>