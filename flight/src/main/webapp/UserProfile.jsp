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




<!-- container start -->

<div class="container ">

<!-- column div start -->
<div class="row justify-content-center">
    <div class="col-md-4 ">
     
     User
     <div class="card">
  <div class="card-body">
    full name:  <%= session.getAttribute("fname") %>
    <%= session.getAttribute("lname") %>
    <br>
    email: <%= session.getAttribute("email") %>
  </div>
</div>
     
    </div>
    <div class="col">
      Ticket
      <div class="card">
  <div class="card-body">
    booked ticket:
    <br>
    <%= session.getAttribute("fname") %>
  </div>
</div>
      
      
    </div>
  </div>
<!-- column div end -->
  
</div>
<!-- container end -->



<!-- bootstrap js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

</body>
</html>