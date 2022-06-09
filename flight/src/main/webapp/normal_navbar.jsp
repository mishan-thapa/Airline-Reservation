<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="base.jsp"> <span class="fa fa-send-o"></span> Air Reservation</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <%if(session.getAttribute("roleDB")==null){ %>
        <li class="nav-item">
          <a class="nav-link" href="userlogin.jsp"> <span class="	fa fa-mail-forward"></span>
           user login</a>
        </li>
        <%}else if(session.getAttribute("roleDB")=="user"){ %>
        <li class="nav-item">
          <a class="nav-link" href="UserProfile.jsp"> 
           my profile</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="BookFlight.jsp"> 
           book flight</a>
        </li>
        
        <%}else if(session.getAttribute("roleDB")=="admin"){ %>
                 <li class="nav-item">
          <a class="nav-link" href="UserDetailAdmin.jsp"> 
           users</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="FlightInfoAdmin.jsp"> 
           flights</a>
        </li>

      
        <%} %> 
        
        <li class="nav-item">
          <a class="nav-link" href="#">about us</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">contact</a>
        </li>
        
      </ul>
     <%
     if(session.getAttribute("roleDB")==null){    %>
      <form class="d-flex"  >
          <a class="nav-link" href="AdminLoginPage.jsp">admin login</a>
      </form>
      <%}else if(session.getAttribute("roleDB")=="user"){ %>
      
      <form action="LogOut" method="get">
<button type="submit" class="btn btn-primary">log out</button>
</form>

<%}else if(session.getAttribute("roleDB")=="admin"){ %>

      <form action="AdminLogOut" method="get">
<button type="submit" class="btn btn-primary">Admin logOut</button>
</form>
<%} %>      
    </div>
  </div>
</nav>