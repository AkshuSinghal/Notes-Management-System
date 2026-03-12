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


@WebServlet("/EditNotesServlet")
public class EditNotesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer id=Integer.parseInt(request.getParameter("id"));
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		
		ANQuery obj=new ANQuery(DbConnect.getConn());
		boolean f=obj.setInfo(id,title,content);
		if(f)
		{
			System.out.println("Updated successfully");
			HttpSession session=request.getSession();
			session.setAttribute("Um", "Notes updated successfully");
			response.sendRedirect("ShowNotes.jsp");
		}
		else {
			System.out.println("Data not Updated");
		}
	}

}
