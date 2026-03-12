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
<title>Add Notes</title>
<%@include file="ac/ac.jsp"%>
</head>
<body>
	<div class="container-fluid">
		<%@include file="ac/navbar.jsp"%>
		<h1 class="text-center">Add Your Notes</h1>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<form action="AddNotesServlet" method="post">
						<%
							UserDetails us=(UserDetails)session.getAttribute("userD");
						    if(us!=null)
						    {%>
						    	<input type="hidden" value="<%=us.getId() %>" name="uid">
						    <%}
						%>
						<div class="form-group">
							<label for="exampleInputEmail1">Enter Title</label> <input
								type="text" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" name="title" required="required">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Enter Content</label>
							<textarea rows="6" cols="" class="form-control" name="content" required="required"></textarea>
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