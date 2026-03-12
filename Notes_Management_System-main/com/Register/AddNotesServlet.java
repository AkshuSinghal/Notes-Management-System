package com.Register;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Db.DbConnect;
import com.Query.ANQuery;


@WebServlet("/AddNotesServlet")
public class AddNotesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int uid=Integer.parseInt(request.getParameter("uid"));
		String ti=request.getParameter("title");
		String co=request.getParameter("content");
		
		ANQuery obj=new ANQuery(DbConnect.getConn());
		boolean f=obj.postQuery(ti, co, uid);
		if(f)
		{
			System.out.println("Database Added");
			response.sendRedirect("ShowNotes.jsp");
			
		}
		else {
			System.out.println("database not added");
		}
	}

}
