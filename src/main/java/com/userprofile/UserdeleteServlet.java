package com.userprofile;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UserdeleteServlet")
public class UserdeleteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        // Get the user ID from the request parameter
        String userIdParam = request.getParameter("id");
        Integer userId = null;
        
        try {
            userId = Integer.parseInt(userIdParam);
        } catch (NumberFormatException e) {
            // Handle invalid or missing user ID (redirect to error page)
            response.sendRedirect("error.jsp");
            return;
        }

        // Call the delete method from the database utility class
        boolean isTrue = UserDBUtill.deleteCustomer(userId);

        if (isTrue) {
            // If deletion is successful, redirect to index page
            RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
            dispatcher.forward(request, response);
        } else {
            // If deletion failed, fetch user details and forward back to profile page
            List<user> usDetails = UserDBUtill.getUser(userId);
            request.setAttribute("usDetails", usDetails);
            
            RequestDispatcher dispatcher = request.getRequestDispatcher("profile.jsp");
            dispatcher.forward(request, response);
        }
    }
}
