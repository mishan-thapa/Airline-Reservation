<%@page import="flight.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>book flight</title>
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
if(session.getAttribute("roleDB")!= "user"){
	response.sendRedirect("userlogin.jsp"); 
}
%>

<br>


<!-- for selected ticket start -->

<div class="container-fluid text-center sticky-top" >
<h2>Selected Flight</h2>



<!-- table start -->

<form id="bookFormid" action="BookFlightServlet" method="post">
<button type="submit" class="btn btn-primary">Book Flight</button> No.of tickets <input type="text" name="numberofticketid1" id="numberofticketid1" value="" />

<input type="hidden" name="flightnumberid1" id="flightnumberid1" value="" required/>
<input type="hidden" name="flightnameid1" id="flightnameid1" value="" required />
<input type="hidden" name="fromcityid1" id="fromcityid1" value="" required/>
<input type="hidden" name="tocityid1" id="tocityid1" value="" required/>
<input type="hidden" name="dateid1" id="dateid1" value="" required/>
<input type="hidden" name="timeid1" id="timeid1" value="" required/>
<input type="hidden" name="airportnameid1" id="airportnameid1" value="" required/>
<input type="hidden" name="priceid1" id="priceid1" value="" />
<input type="hidden" name="fnameid1" id="fnameid1" value="<%= session.getAttribute("fname") %>" />
<input type="hidden" name="emailid1" id="emailid1" value="<%= session.getAttribute("email") %>" />



<table class="table table-light">
  
  <tbody>
    <tr>
      <th scope="row"><p id="flightnumberid" value=""></p></th>
      <td><p id="flightnameid"></p></td>
      <td><p id="fromcityid"></p></td>
      <td><p id="tocityid"></p></td>
      <td><p id="dateid"></p></td>
      <td><p id="timeid"></p></td>
      <td><p id="airportnameid"></p></td>
      <td><p id="priceid"></p></td>
    </tr>
    
  </tbody>
</table>
</form>
<!-- tabble end -->
</div>


<!-- for selected ticket end -->

<br>
<div class="container-fluid text-center" >
<h2>Flight List</h2>
</div>



<!-- coding to display table start -->

<table id="booktable" class="table table-light table-hover table-bordered ">

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
      
    </tr>
    <%} %>
  </tbody>
</table>




<!-- coding to display table end -->


<p id="demo"></p>
<p id="demo2"></p>



<!-- bootstrap js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script >

var rIndex,booktable=document.getElementById("booktable");

function selectedRowToInput()
{
    
    for(var i = 1; i < booktable.rows.length; i++)
    {
        booktable.rows[i].onclick = function()
        {
          // get the seected row index
          rIndex = this.rowIndex;
          
          document.getElementById('flightnumberid').innerHTML = this.cells[0].innerHTML;
          document.getElementById("flightnameid").innerHTML = this.cells[1].innerHTML;
          document.getElementById("fromcityid").innerHTML = this.cells[2].innerHTML;
          document.getElementById("tocityid").innerHTML = this.cells[3].innerHTML;
          document.getElementById("dateid").innerHTML = this.cells[4].innerHTML;
          document.getElementById("timeid").innerHTML = this.cells[5].innerHTML;
          document.getElementById("airportnameid").innerHTML = this.cells[6].innerHTML;
          document.getElementById("priceid").innerHTML = this.cells[7].innerHTML;
          
          
          document.getElementById('flightnumberid1').value = this.cells[0].innerHTML;
          document.getElementById("flightnameid1").value = this.cells[1].innerHTML;
          document.getElementById("fromcityid1").value = this.cells[2].innerHTML;
          document.getElementById("tocityid1").value = this.cells[3].innerHTML;
          document.getElementById("dateid1").value = this.cells[4].innerHTML;
          document.getElementById("timeid1").value = this.cells[5].innerHTML;
          document.getElementById("airportnameid1").value= this.cells[6].innerHTML;
          document.getElementById("priceid1").value = this.cells[7].innerHTML;
          //document.getElementById("lname").value = this.cells[1].innerHTML;
         // document.getElementById("age").value = this.cells[2].innerHTML;
        };
    }
}
selectedRowToInput();

</script>
</body>
</html>