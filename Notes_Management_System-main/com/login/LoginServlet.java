package com.login;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Db.DbConnect;
import com.Query.Query;
import com.UserD.UserDetails;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("lemail");
        String password = request.getParameter("lpassword");

        UserDetails us = new UserDetails();
        us.setEmail(email);
        us.setPassword(password);

        Query q = new Query(DbConnect.getConn());
        UserDetails user = q.loginQuery(us);

        if (user!=null) {
        	
            System.out.println("login successful. Redirecting to Home.jsp");
            HttpSession session=request.getSession();
            session.setAttribute("userD", user);
            response.sendRedirect("Home.jsp");
        } else {
            System.out.println("login failed. Redirecting to login.jsp");
            HttpSession session = request.getSession();
            session.setAttribute("log-failed", "No such data available");
            response.sendRedirect("login.jsp");
        }
	}
}

