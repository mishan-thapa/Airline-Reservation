<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- bootstrap css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<!-- font awesome icon -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- mycss -->
<link rel="stylesheet" href="css/styles.css">


</head>
<body>

<%@include file="normal_navbar.jsp" %>

<br>
<br>

<div class="container d-flex justify-content-center">
<h2>User Login</h2>
</div>

<div class="container d-flex justify-content-center">

<div class="row">

<div class="col-md-4 ">

<!-- card -->
<div class="card" style="width: 18rem;">
  <div class="card-body">
  
  
  <!-- formm start -->
    <form action="login" method="post">
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Email address</label>
    <input name="loginid" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
  </div>
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Password</label>
    <input name="loginpass" type="password" class="form-control" id="exampleInputPassword1">
  </div >
  <button type="submit" class="btn btn-primary">log in</button>
</form>
<br>
<a href="createUserPage.jsp">create new account </a>
  </div>
</div>

</div>

</div>

</div>

<!-- bootstrap js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

</body>
</html>