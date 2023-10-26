<%@ page import="com.entity.User" %>
<nav class="navbar navbar-expand-lg navbar-dark bg-success">
 <a class="navbar-brand" href="index.jsp"><i class="fas fa-phone-square-alt"></i> DiGiBook</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp"><i class="fa-solid fa-house-chimney-user"></i> Home<span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="addcontacts.jsp"><i class="fa-solid fa-square-plus"></i> Add Contacts</a>
      </li>
       <li class="nav-item active">
        <a class="nav-link" href="viewcontacts.jsp"><i class="fa-solid fa-eye"></i> View Contacts</a>
      </li>
    </ul>
    <% 
    User user=(User)session.getAttribute("user"); 
    if(user==null){
    %>
    <form class="form-inline my-2 my-lg-0">
      <a href="login.jsp" class="btn btn-warning text-white"><i class="fa-solid fa-right-to-bracket"></i> Login</a>
      <a href="registration.jsp" class="btn btn-danger ml-2"><i class="fa-solid fa-user"></i> SignUp</a>
    </form>
    <%
    }else{%>
    	 <form class="form-inline my-2 my-lg-0">
    	 <a href="profile.jsp" class="btn btn-warning text-white"><%=user.getName()%></a>
    	 <a data-toggle="modal" data-target="#exampleModalCenter" class="btn btn-danger ml-2 text-white">Logout</a>
         </form>
   <%
   }
    %>
    <!-- Logout -->
   

<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header text-center">
        <h5 class="modal-title" style="color:red;" id="exampleModalLongTitle"><b>Warning...</b></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body text-center">
      <h5><b>Are You Sure to Logout...</b></h5>
        <button type="button" class="btn btn-warning text-white" data-dismiss="modal">Close</button>
        <a href="logout" class="btn btn-danger">Logout</a>
      </div>
      <div class="modal-footer">
      </div>
    </div>
  </div>
</div>
  </div>
</nav>