package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DbConnect;
import com.dao.ContactDao;

@WebServlet("/delete")
public class DeleteContactServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	int cid=Integer.parseInt(request.getParameter("cid"));	
	ContactDao dao=new ContactDao(DbConnect.getConn());
	
	boolean f=dao.deleteContactById(cid);
	HttpSession session=request.getSession();
	if(f) {
		session.setAttribute("sucssMsg", "Contact Deleted Successfully...");
		response.sendRedirect("viewcontacts.jsp");
		}else {
			session.setAttribute("errorMsg", "Something Went Wrong...");
			response.sendRedirect("viewcontacts.jsp");
		}
	}

}
