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




@WebServlet("/UserdeleteServlet")
public class UserdeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userid");
        
		boolean isTrue;
		
		isTrue = UserDBUtill.deleteCustomer(userId);
		
		
		if (isTrue == true) {
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
			dispatcher.forward(request, response);
			
		}
		else {
			
			List<user> usDetails = UserDBUtill.getUser(userId);
	        
	        request.setAttribute("usDetails", usDetails);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("update.jsp");
			dispatcher.forward(request, response);
			
		}
	}

}
