<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Page</title>
<%@include file="ac/ac.jsp"%>
</head>
<body>
	<div class="container-fluid div-color">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-5">
					<div class="card header text-center text-white bg-custom">
						<i class="fa fa-user-plus fa-3x" aria-hidden="true"></i>
						<h4>Register</h4>
					</div>
					<div>
						<%
						   	String s=(String)session.getAttribute("reg-failed");
						    if(s!=null)
						    {%>
						    	<div class="alert alert-danger" role="alert"><%=s%></div>
						    <%
						    session.removeAttribute("reg-failed");
						    }
						%>
					</div>
					<div class="card-body">
						<form action="RegisterServlet" method="post">
							<div class="form-group">
								 <label for="exampleInputText">Enter Full Name</label>
								 <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="rname"> 
							</div>
							<div class="form-group">
							    <label for="exampleInputEmail">Enter Email id</label>
								<input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name= "remail">
								
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Enter Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1" name="rpassword">
							</div>
							<button type="submit" class="btn btn-primary badge-pill btn-block">Register</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>