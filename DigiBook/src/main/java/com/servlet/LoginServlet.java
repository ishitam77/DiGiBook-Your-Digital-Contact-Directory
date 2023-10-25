package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entity.User;
import com.conn.DbConnect;
import com.dao.UserDao;


@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		
		UserDao dao=new UserDao(DbConnect.getConn());
		User u=dao.loginUser(email, password);
		HttpSession session=request.getSession();
		if(u!=null) {
			session.setAttribute("user", u);
			response.sendRedirect("index.jsp");
		}else {
			session.setAttribute("invalidMsg", "Wrong Credentials...");
			response.sendRedirect("login.jsp");
		}
		
	}

}
