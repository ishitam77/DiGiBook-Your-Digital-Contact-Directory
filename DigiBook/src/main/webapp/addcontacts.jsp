<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon" type="image/x-icon" href="img/icon.png">
<title>DiGi: Add-Contacts</title>
<%@include file="css-js-file/cssjs.jsp" %>
</head>
<body style="background-color:#ceedcf">
<%@include file="css-js-file/nav.jsp" %>
  <%
  String sucssMsg=(String)session.getAttribute("sucssMsg");
  String errorMsg=(String)session.getAttribute("errorMsg");
   if(sucssMsg!=null){
   %>
   	<div class="alert alert-warning" role="alert"><b><%=sucssMsg%></b></div>
	<%
	session.removeAttribute("sucssMsg");
   }
   if(errorMsg!=null){
	   %>
	   <div class="alert alert-danger" role="alert"><b><%=errorMsg%></b></div>
		<%
		session.removeAttribute("errorMsg");
   }
   %>
<%
if(user==null){ 
session.setAttribute("invalidMsg","Please Login...");
response.sendRedirect("login.jsp");
}
%>

<div class="container-fluid">
<div class="row p-2">
<div class="col-md-6 offset-md-3">
<div class="card">
<div class="card-body">
<h4 class="text-center"><b>Add Contacts</b></h4>
<form action="addContact" method="post">
<%
if(user!=null){
	%>
	<input type="hidden" value="<%=user.getId()%>" name="userid">
	<% 
}
%>
  <div class="form-group">
    <label>Name</label>
    <input type="text" class="form-control" name="name" placeholder="Enter Name">
  </div>
  <div class="form-group">
    <label>Email</label>
    <input type="text" class="form-control" name="email" placeholder="Enter Email">
  </div>
   <div class="form-group">
    <label>Adderss/Location</label>
    <input type="text" class="form-control" name="address" placeholder="Enter Address">
  </div>
  <div class="form-group">
    <label>Phone Number</label>
    <input type="text" class="form-control" name="phone" placeholder="Enter Phone Number">
  </div>
  <div class="form-group">
    <label>About</label>
    <textarea class="form-control" name="about" placeholder="Enter About User" rows="3"></textarea>
  </div>
  <div class="text-center mt-2">
  <button type="submit" class="btn btn-success">Save</button>
  <button type="reset" class="btn btn-danger">Clear</button>
  </div>
</form>
</div>
</div>
</div>
</div>
</div>
<div style="margin-top:90px">
<%@include file="css-js-file/footer.jsp" %>
</div>
</body>
</html>