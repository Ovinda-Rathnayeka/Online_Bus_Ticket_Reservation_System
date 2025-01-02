package com.userprofile;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/DisplayUser")
public class DisplayUser extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        
        HttpSession session = request.getSession();
        
        
        Integer userId = (Integer) session.getAttribute("userid");
        
        
        if (userId != null) {
           
            List<user> usDetails = UserDBUtill.getUser(userId);
            
            
            request.setAttribute("usDetails", usDetails);
            
            
            RequestDispatcher dispatcher = request.getRequestDispatcher("userdashboard.jsp");
            dispatcher.forward(request, response);
            
        } else {
            
            response.sendRedirect("sign-in.jsp");
        }
    }
}
