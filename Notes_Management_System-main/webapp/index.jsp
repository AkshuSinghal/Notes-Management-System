<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="com.Db.DbConnect" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.back-img {
  background: url("img/yo.jpeg");
  width: 100%;
  height: 100vh;
  background-repeat: no-repeat;
  background-size: cover;
  display: flex;
  justify-content: center;
  align-items: center;
  text-align: center;
  flex-direction: column;
}
.text-center h1 {
  color: green; 
  margin-bottom: 40px; 
  font-size: 4em;
}
.text-center h2 {
  color: purple; 
  margin-bottom: 60px; 
  font-size: 3em;
}
.btn-container{
	margin-top: 40px;
}
.btn {
  margin: 40px; 
  border-radius: 15px;
  padding: 80px 120px; 
  font-size: 3em; 
  color: white;
  text-decoration: none;
}
.btn-dark{
  background-color: #f44336 !important;
}
</style>
<meta charset="UTF-8">
<title>Index Page</title>
<%@include file="ac/ac.jsp"%>
</head>
<body>
  <div class="container-fluid back-img">
    <div class="text-center">
      <h1>NOTES MANAGEMENT SYSTEM</h1>
      <a href="login.jsp" class="btn btn-dark"><i class="fa fa-user-circle-o" aria-hidden="true"></i>Login</a>
      <a href="register.jsp" class="btn btn-dark"><i class="fa fa-user-plus" aria-hidden="true"></i>Register</a>
      <h2>BY AKHIL THAKUR</h2>
    </div>
  </div>
</body>
</html>
