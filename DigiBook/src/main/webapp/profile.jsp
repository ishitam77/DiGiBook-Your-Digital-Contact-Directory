<%@ page import="com.dao.UserDao" %>
<%@ page import="com.entity.User" %>
<%@ page import="com.conn.DbConnect" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon" type="image/x-icon" href="img/icon.png">
<title>DiGiBook: Profile</title>
<%@include file="css-js-file/cssjs.jsp" %>
</head>
<body style="background-color: #ceedcf;">
    <%@include file="css-js-file/nav.jsp" %>
	
	<%
String sucssMsg=(String)session.getAttribute("sucssMsg");
String errorMsg=(String)session.getAttribute("errorMsg");
if(sucssMsg!=null){
	%>
<div class="alert alert-warning" role="alert">
  <b><%=sucssMsg%></b>
</div>
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
    <div class="container">
    <div class="row p-4">
        <div class="col-md-6 mx-auto">
            <div class="card">
                <div class="card-body">
                    <h4 class="text-center"><b style="color:red">Profile: <b style="color:#243d9e"><%= user.getName() %></b></b></h4>
                    <form action="edituser" method="post">
                        <input type="hidden" name="id" value="<%= user.getId() %>">
                        <div class="form-group">
                            <label>Name</label>
                            <input type="text" class="form-control" name="name" value="<%= user.getName() %>" placeholder="Enter Name">
                        </div>
                        <div class="form-group">
                            <label>Email</label>
                            <input type="text" class="form-control" name="email" value="<%= user.getEmail() %>" placeholder="Enter Email">
                        </div>
                        <div class="form-group">
                            <label>Password</label>
                            <input type="password" class="form-control" name="password" value="<%= user.getPassword() %>" placeholder="Enter New Password">
                        </div>
                        <div class="text-center mt-2">
                                <button type="submit" class="btn btn-success text-white btn-sm">Save Changes</button>
                            </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<div style="margin-top:160px">
<%@include file="css-js-file/footer.jsp" %>
</div>
</body>
</html>