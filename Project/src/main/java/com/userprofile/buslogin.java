package com.userprofile;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class buslogin
 */
@WebServlet("/buslogin")
public class buslogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		boolean isTrue;
		
		isTrue = UserDBUtill.validatebus(email, password, request);
		
		if (isTrue == true) {
			
			/*List<user> usDetails = UserDBUtill.getUser(email);
		    System.out.println("user Details: " + usDetails);
		    request.setAttribute("usDetails", usDetails);*/
		    
		    /*HttpSession session = request.getSession();
            session.setAttribute("userEmail", email); */
		    
		    RequestDispatcher dis = request.getRequestDispatcher("busindex-after-login.jsp");
		    dis.forward(request, response);
		    
		    //out.println("alert('Login Ok');");
		    
		} else {
			/*out.println("<script type='text/javascript'>");
			out.println("alert('Your username or password is incorrect');");
			out.println("location='login.jsp'");
			out.println("</script>");*/
			
			out.println("alert('Login Faild');");
		}
		
		
	}

}
