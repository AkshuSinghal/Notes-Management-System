package com.Register;

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

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
        String name = request.getParameter("rname");
        String email = request.getParameter("remail");
        String password = request.getParameter("rpassword");
        
        
        
        
        UserDetails us = new UserDetails();
        us.setName(name);
        us.setEmail(email);
        us.setPassword(password);
        
        Query q = new Query(DbConnect.getConn());
        boolean f = q.registerQuery(us);
        
        if (f) {
            
            System.out.println("Registration successful. Redirecting to login.jsp");
            response.sendRedirect("login.jsp");
        } else {
            
            System.out.println("Registration failed. Redirecting to register.jsp");
            HttpSession session = request.getSession();
            session.setAttribute("reg-failed", "Something went wrong with the server");
            response.sendRedirect("register.jsp");
        }
    }
}

