package com.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DbConnect;
import com.dao.ContactDao;
import com.dao.UserDao;
import com.entity.Contact;
import com.entity.User;

@WebServlet("/deleteuser")
public class DeleteUserServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get the user's ID from the request parameters
        int userId = Integer.parseInt(request.getParameter("id"));

        Connection conn = DbConnect.getConn();
        UserDao userDao = new UserDao(conn);
        ContactDao contactDao = new ContactDao(conn);
        HttpSession session = request.getSession();

        User user = userDao.getUserById(userId);

        if (user != null) {
            // Check if the user has contacts
            List<Contact> userContacts = contactDao.getAllContact(userId);

            if (userContacts.isEmpty()) {
                // User has no contacts, proceed to delete the user
                boolean deleteUser = userDao.deleteUser(userId);

                if (deleteUser) {
                    session.setAttribute("sucssMsg", "User Deleted Successfully...");
                    session.invalidate(); 
                    response.sendRedirect("login.jsp"); 
                } else {
                    session.setAttribute("errorMsg", "Something Went Wrong...");
                    response.sendRedirect("profile.jsp");
                }
            } else {
                // User has contacts, delete the contacts first
                boolean deleteContacts = contactDao.deleteContactsByUserId(userId);

                if (deleteContacts) {
                    // Contacts were successfully deleted, delete the user
                    boolean deleteUser = userDao.deleteUser(userId);

                    if (deleteUser) {
                        session.setAttribute("sucssMsg", "User Deleted Successfully...");
                        session.invalidate(); 
                        response.sendRedirect("login.jsp"); 
                    } else {
                        session.setAttribute("errorMsg", "Something Went Wrong...");
                        response.sendRedirect("profile.jsp");
                    }
                } else {
                    session.setAttribute("errorMsg", "Something Went Wrong...");
                    response.sendRedirect("profile.jsp");
                }
            }
        } else {
            session.setAttribute("errorMsg", "Something Went Wrong...");
            response.sendRedirect("profile.jsp");
        }
    }
}
