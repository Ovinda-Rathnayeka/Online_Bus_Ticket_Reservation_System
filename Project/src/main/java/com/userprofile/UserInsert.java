package com.userprofile;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




@WebServlet("/UserInsert")
public class UserInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		String nic = request.getParameter("nic");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		PrintWriter out = response.getWriter();
		
		out.println(firstname);
		
		
		boolean isTrue;
		
		isTrue=UserDBUtill.insertcustomer(firstname, lastname,nic,email,password);
		
		if(isTrue == true) {
			
			RequestDispatcher dis = request.getRequestDispatcher("sign-in.jsp");
			dis.forward(request, response);
			
			
			
		} else {
			
			out.println("alert('Data Not Insert');");
		}
	}

}
