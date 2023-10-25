<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon" type="image/x-icon" href="img/icon.png">
<title>DiGiBook: Registration</title>
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
<div class="container-fluid">
<div class="row p-2">
<div class="col-md-6 offset-md-3">
<div class="card">
<div class="card-body">
<h4 class="text-center"><b>Register Details</b></h4>
<form action="register" method="post">
  <div class="form-group">
    <label for="exampleInputEmail1">Name</label>
    <input type="text" class="form-control" name="name" placeholder="Enter Name">
  </div>
  <div class="form-group">
    <label for="exampleInputEmail1">Email</label>
    <input type="text" class="form-control" name="email" placeholder="Enter Email">
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="password" class="form-control" name="password" placeholder="Enter Password">
  </div>
  <div class="text-center mt-2">
  <button type="submit" class="btn btn-success">Register</button>
  <button type="reset" class="btn btn-danger">Clear</button>
  </div>
</form>
</div>
</div>
</div>
</div>
</div>
<div style="margin-top:175px">
<%@include file="css-js-file/footer.jsp" %>
</div>
</body>
</html>