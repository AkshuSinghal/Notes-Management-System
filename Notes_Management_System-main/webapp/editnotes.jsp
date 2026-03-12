<%@ page import="com.UserD.Postdetails" %>
<%@ page import="com.Query.ANQuery" %>
<%@ page import="com.Db.DbConnect" %>
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
<title>Edit Page</title>
<%@ include file="ac/ac.jsp" %>
</head>
<body>
     <%
	    Integer val=Integer.parseInt(request.getParameter("note_id"));
	    ANQuery q=new ANQuery(DbConnect.getConn());
	    Postdetails p= q.getInfo(val);
	%>
    <div class="container-fluid">
		<%@include file="ac/navbar.jsp"%>
		<h1 class="text-center">Edit your Notes</h1>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<form action="EditNotesServlet" method="post">
						<input type="hidden" value="<%=p.getId() %>" name="id">
						<div class="form-group">
							<label for="exampleInputEmail1">Enter Title</label> <input
								type="text" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" name="title" required="required" value="<%=p.getTitle() %>">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Enter Content</label>
							<textarea rows="6" cols="" class="form-control" name="content" required="required"><%=p.getContent() %></textarea>
						</div>
						<div class="container text-center">
							<button type="submit" class="btn btn-primary">Add</button>
						</div>
						
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>