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
import com.entity.Contact;

@WebServlet("/addContact")
public class AddContactServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userIdStr = request.getParameter("userid");
		int userId = 0; // Default value if parsing fails

		if (userIdStr != null && !userIdStr.isEmpty()) {
		    try {
		        userId = Integer.parseInt(userIdStr);
		    } catch (NumberFormatException e) {
		        e.printStackTrace();
		    }
		}
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String address=request.getParameter("address");
		String phone=request.getParameter("phone");
		String about=request.getParameter("about");
		
		Contact c=new Contact(name,email,address,phone,about,userId);
		ContactDao dao=new ContactDao(DbConnect.getConn());
		boolean f=dao.saveContact(c);
		
		HttpSession session=request.getSession();
		if(f){
			session.setAttribute("sucssMsg","Contact Saved Successfully....");
			response.sendRedirect("addcontacts.jsp");
		}else{
			session.setAttribute("errorMsg","Something Went Wrong....");
			response.sendRedirect("addcontacts.jsp");
		}
	}

}
