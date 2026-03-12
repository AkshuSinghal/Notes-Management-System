<%@ page import="com.UserD.UserDetails" %>

<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
  <a class="navbar-brand" href="#">Navbar</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="Home.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="addnotes.jsp">Add Notes</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="ShowNotes.jsp">Show Notes</a>
      </li>
    </ul>
    <%
        UserDetails user = (UserDetails) session.getAttribute("userD");
        if (user != null) {
    %>
        	<a class="btn btn-light my-2 my-sm-0 mr-4" href="#"><i class="fa fa-user-circle-o" aria-hidden="true"></i> <%= user.getName() %></a>
        	<a href="LogoutServlet" class="btn btn-light my-2 my-sm-0"><i class="fa fa-sign-out"></i> Logout</a>
    <% } %>
  </div>
</nav>
