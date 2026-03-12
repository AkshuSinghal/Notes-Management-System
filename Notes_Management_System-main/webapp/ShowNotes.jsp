<%@ page import="com.UserD.Postdetails" %>
<%@ page import="com.Query.ANQuery" %>
<%@ page import="com.Db.DbConnect" %>
<%@ page import="java.util.List" %>
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
<title>Show Notes</title>
<%@include file="ac/ac.jsp" %>
</head>
<body>
	<%@include file="ac/navbar.jsp" %>
	<%
	    String st=(String)session.getAttribute("Um");
	    if(st!=null)
	    {%>
	    	<div class="alert alert-success" role="alert"><%=st%></div>
	    <%}
	    session.removeAttribute("Um");
	%>
	<%
	    String st1=(String)session.getAttribute("Ud");
	    if(st1!=null)
	    {%>
	    	<div class="alert alert-success" role="alert"><%=st1%></div>
	    <%}
	    session.removeAttribute("Ud");
	%>
	<div class="container">
		<h2 class="text-center">ALL NOTES</h2>
		<div class="row">
			<div class="col-md-12">
				<%
					if(us1!=null)
					{
						ANQuery obj=new ANQuery(DbConnect.getConn());
						List<Postdetails> l=obj.getData(us1.getId());
						for(Postdetails it:l)
						{%>
							<div class="card mt-3">
							<img alt="" src="img/p.jpeg" class="card-img-top mt-2 mx-auto"
							style="max-width: 100px;">
								<div class="card-body p-4">
									<h5 class="card-title"><%=it.getTitle() %></h5>
									<p><%=it.getContent() %>.</p>
									<p>
										<b class="text-success">Published By:<%=us1.getName() %></b><b class="text-primary"></b>
									</p>
									<p>
										<b class="text-success">Published Date:<%=it.getPdate() %></b><b class="text-primary"></b>
									</p>
									<div class="container text-center mt-2">
										<a href="deleteServlet?note_id=<%=it.getId() %>" class="btn btn-danger">DELETE</a> 
										<a href="editnotes.jsp?note_id=<%=it.getId() %>" class="btn btn-primary">EDIT</a>
									</div>
								</div>
							</div>
						<%}
					}
				%>
			
			</div>
		</div>

	</div>
</body>
</html>