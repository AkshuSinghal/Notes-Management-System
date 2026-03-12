<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<%@include file="ac/ac.jsp" %>
</head>
<body>
	<div class="container-fluid div-color">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-5">
					<div class="card header text-center text-white bg-custom">
						<i class="fa fa-user-circle-o fa-3x" aria-hidden="true"></i>
						<h4>Login</h4>
					</div>
					<div>
						<%
						   	String s=(String)session.getAttribute("log-failed");
						    if(s!=null)
						    {%>
						    	<div class="alert alert-danger" role="alert"><%=s%></div>
						    <%
						    session.removeAttribute("log-failed");
						    }
						%>
						<%
							String s1=(String)session.getAttribute("log-msg");
					    	if(s1!=null)
					    	{%>
					    		<div class="alert alert-success" role="alert"><%=s1%></div>
					    	<%
					    	session.removeAttribute("log-msg");
					    	}
						%>
					</div>
					<div class="card-body">
						<form action="LoginServlet" method="post">
							<div class="form-group">
							    <label for="exampleInputEmail">Enter Email id</label>
								<input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="lemail" >
								
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Enter Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1" name="lpassword">
							</div>
							<button type="submit" class="btn btn-primary badge-pill btn-block">Login</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>