package com.userprofile;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/UpdateUserServlet")
public class UpdateUserServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Retrieve parameters from the request
        String id = request.getParameter("cusid");
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String nic = request.getParameter("nic");
        String birthday = request.getParameter("birthday");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        
        

        
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userid");

       
        boolean isUpdated = UserDBUtill.updateuser(userId, firstname, lastname, nic, birthday,phone,address, email);

        if (isUpdated) {
           
            List<user> usDetails = UserDBUtill.getUserDetails(userId); 
            
            
            request.setAttribute("usDetails", usDetails);
            
          
            RequestDispatcher dis = request.getRequestDispatcher("profile.jsp");
            dis.forward(request, response);
            
        } else {
            
            response.sendRedirect("profil.jsp");  
        }
    }
}
