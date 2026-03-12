package com.Register;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Db.DbConnect;
import com.Query.ANQuery;


@WebServlet("/deleteServlet")
public class deleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer id=Integer.parseInt(request.getParameter("note_id"));
		ANQuery obj=new ANQuery(DbConnect.getConn());
		boolean f=obj.delete(id);
		if(f)
		{
			HttpSession session=request.getSession();
			session.setAttribute("Ud", "Notes deleted successfully");
			response.sendRedirect("ShowNotes.jsp");
		}
		else {
			System.out.println("some error occured");
		}
	}

}
