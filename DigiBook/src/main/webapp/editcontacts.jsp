<%@ page import="com.dao.ContactDao" %>
<%@ page import="com.entity.Contact" %>
<%@ page import="com.conn.DbConnect" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon" type="image/x-icon" href="img/icon.png">
<title>DiGiBook: Edit-Contacts</title>
<%@include file="css-js-file/cssjs.jsp" %>
</head>
<body style="background-color:#ceedcf">
<%@include file="css-js-file/nav.jsp" %>
 <%
  String errorMsg=(String)session.getAttribute("errorMsg");

   if(errorMsg!=null){
	   %>
	   	<div class="alert alert-danger" role="alert"><b><%=errorMsg%></b></div>
		<%
		session.removeAttribute("errorMsg");
   }
   %>
<%
if(user==null){
	session.setAttribute("invalidMsg","Login Please");
	response.sendRedirect("login.jsp");
}
%>
<div class="container-fluid">
<div class="row p-2">
<div class="col-md-6 offset-md-3">
<div class="card">
<div class="card-body">
<h4 class="text-center"><b>Add Contacts</b></h4>
<form action="update" method="post">
<%
    int cid = Integer.parseInt(request.getParameter("cid"));
    ContactDao dao = new ContactDao(DbConnect.getConn());
    Contact c = dao.getContactByID(cid);
%>
<input type="hidden" name="cid" value="<%=cid%>"> 
  <div class="form-group">
    <label>Name</label>
    <input value="<%=c.getName()%>" type="text" class="form-control" name="name" placeholder="Enter Name">
  </div>
  <div class="form-group">
    <label>Email</label>
    <input value="<%=c.getEmail()%>" type="text" class="form-control" name="email" placeholder="Enter Email">
  </div>
   <div class="form-group">
    <label>Adderss/Location</label>
    <input value="<%=c.getAddress()%>" type="text" class="form-control" name="address" placeholder="Enter Address">
  </div>
  <div class="form-group">
    <label>Phone Number</label>
    <input value="<%=c.getPhone()%>" type="text" class="form-control" name="phone" placeholder="Enter Phone Number">
  </div>
  <div class="form-group">
    <label>About</label>
    <textarea class="form-control" name="about" placeholder="Enter About User" rows="3"><%=c.getAbout()%></textarea>
  </div>
  <div class="text-center mt-2">
  <button type="submit" class="btn btn-success">Edit Changes</button>
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