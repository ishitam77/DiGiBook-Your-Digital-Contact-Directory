package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DbConnect;
import com.dao.UserDao;
import com.entity.User;

@WebServlet("/edituser")
public class EditUserServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User user = new User();
        user.setId(id);
        user.setName(name);
        user.setEmail(email);
        user.setPassword(password);

        UserDao userDao = new UserDao(DbConnect.getConn());
        boolean success = userDao.updateUser(user);

        HttpSession session = request.getSession();
        if (success) {
            session.setAttribute("successMsg", "Profile Updated Successfully");
            session.invalidate(); 
            response.sendRedirect("login.jsp"); 
        } else {
            session.setAttribute("errorMsg", "Something Went Wrong");
            response.sendRedirect("profile.jsp");
        }
    }
}
