<%@ page import="com.entity.User" %>
<%@ page import="com.dao.ContactDao" %>
<%@ page import="com.entity.Contact" %>
<%@ page import="java.util.List" %>
<%@ page import="com.conn.DbConnect" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon" type="image/x-icon" href="img/icon.png">
<title>DiGiBook: View-Contacts</title>
<%@include file="css-js-file/cssjs.jsp" %>
<style>
.crd-ho:hover{
background-color:#edccbb;
}
</style>
</head>
<body style="background-color:#ceedcf;">
<%@include file="css-js-file/nav.jsp" %>
<%
if(user==null){
	session.setAttribute("invalidMsg","Please Login...");
	response.sendRedirect("login.jsp");
}
%>
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
<%
if(user!=null){
	ContactDao dao=new ContactDao(DbConnect.getConn());
	List<Contact> contact=dao.getAllContact(user.getId());
	for(Contact c:contact){
	%>
	<div class="col-md-4">
	<div class="card crd-ho">
	<div class="card-body">
	<h5><b>Name:</b> <b style="color:#243d9e"><%=c.getName() %></b></h5>
	<p><b>Email:</b> <%=c.getEmail() %></p>
	<p><b>Address:</b> <%=c.getAddress() %></p>
	<p><b>Phone:</b> <%=c.getPhone() %></p>
	<p><b>About:</b> <%=c.getAbout() %></p>
	<div class="text-center">
	<a href="editcontacts.jsp?cid=<%=c.getId()%>" class="btn btn-success text-white btn-sm">Edit</a>
	<a href="delete?cid=<%=c.getId() %>" class="btn btn-danger text-white btn-sm">Remove</a>
	</div>
	</div>
	</div>
	</div>
	<% 
	}
}
%>
</div>
</div>
<div style="margin-top:240px">
<%@include file="css-js-file/footer.jsp" %>
</div>
</body>
</html>