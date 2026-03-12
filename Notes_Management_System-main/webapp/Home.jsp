<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	   UserDetails us1=(UserDetails)session.getAttribute("userD");
	   if(us1==null)
	   {
		   response.sendRedirect("login.jsp");
	   }
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home page</title>
<%@include file="ac/ac.jsp"%>
</head>
<body>
  <div class="container-fluid">
  	<%@include file="ac/navbar.jsp"%>
  	<div class="card mt-5">
  		<div class="card-body text-center">
  		   <img alt="" src="img/p.jpeg">
  		   <h1>Start Taking Your Notes</h1>
  		   <a href="addnotes.jsp" class="btn btn-outline-primary">Start</a>
  		</div>
  	</div>
  </div>
  
</body>
</html>