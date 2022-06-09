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
<h2>List of all the users</h2>
</div>
<br>


<!-- coding to display table start -->

<table class="table table-light table-hover table-bordered ">
  <thead>
    <tr class="table-info">
      <th scope="col">First name</th>
      <th scope="col">Last name</th>
      <th scope="col">Email</th>
      <th scope="col">Password</th>
      <th scope="col">Gender</th>
      <th scope="col"></th>
    </tr>
  </thead>
  <% 
   String q = " Select * from userdata ";
   
   String url="jdbc:mysql://localhost:3306/airreservation";
	String user="root";
	String password="locus19#";
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection(url,user,password);
   Statement st = con.createStatement();
   ResultSet res =st.executeQuery(q);
   while(res.next()){
	   String fname =res.getString(2);
	   String lname = res.getString(3);
	   String email = res.getString(4);
	   String passwordd =res.getString(5);
	   String gender =res.getString(6);
	   %>
  <tbody>
    <tr>
      <th scope="row"><%= fname %></th>
      <td><%= lname %></td>
      <td><%=email %></td>
      <td><%= passwordd %></td>
      <td><%=gender %></td>
      <td>
      <form action="TestServlet" method="post" >
      <button type="submit" class="btn btn-primary">edit</button>
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