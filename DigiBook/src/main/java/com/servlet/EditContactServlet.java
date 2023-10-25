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

@WebServlet("/update")
public class EditContactServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int cid=Integer.parseInt(request.getParameter("cid"));
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String address=request.getParameter("address");
		String phone=request.getParameter("phone");
		String about=request.getParameter("about");
		
		Contact c=new Contact();
		c.setId(cid);
		c.setName(name);
		c.setEmail(email);
		c.setAddress(address);
		c.setPhone(phone);
		c.setAbout(about);
		ContactDao dao=new ContactDao(DbConnect.getConn());
		boolean f=dao.updateContact(c);
		HttpSession session=request.getSession();
		if(f){
			session.setAttribute("sucssMsg","Contact Updated Successfully....");
			response.sendRedirect("viewcontacts.jsp");
		}else{
			session.setAttribute("errorMsg","Something Went Wrong....");
			response.sendRedirect("editcontacts.jsp?cid="+cid);
		}
		
	}

}
