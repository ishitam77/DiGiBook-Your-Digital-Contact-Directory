<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon" type="image/x-icon" href="img/icon.png">
<title>DiGiBook: Login</title>
<%@include file="css-js-file/cssjs.jsp" %>
</head>
<body style="background-color:#ceedcf">
<%@include file="css-js-file/nav.jsp" %>
 <%
  String invalidMsg=(String)session.getAttribute("invalidMsg");
  if(invalidMsg!=null){
  %>
  <div class="alert alert-danger" role="alert"><b><%=invalidMsg %></b></div>
  <%
  session.removeAttribute("invalidMsg");
  }
  %>
  
  <%
  String logMsg=(String)session.getAttribute("logMsg");
  if(logMsg!=null){
  %>
  <div class="alert alert-warning" role="alert"><b><%=logMsg %></b></div>
  <%
  session.removeAttribute("logMsg");
  }
  %>
<div class="container-fluid">
<div class="row p-2">
<div class="col-md-4 offset-md-4">
<div class="card">
<div class="card-body">
<h4 class="text-center"><b style="color:#243d9e">Login Account</b></h4>
<form action="login" method="post">
  <div class="form-group">
    <label for="exampleInputEmail1">Email</label>
    <input type="text" class="form-control" name="email" placeholder="Enter Email">
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="password" class="form-control" name="password" placeholder="Enter Password">
  </div>
  <div class="text-center mt-2">
  <button type="submit" class="btn btn-success">Login</button>
  <button type="reset" class="btn btn-danger">Clear</button>
  </div>
</form>
</div>
</div>
</div>
</div>
</div>
<div style="margin-top:260px">
<%@include file="css-js-file/footer.jsp" %>
</div>
</body>
</html>