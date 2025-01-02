package com.payment;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/DisplayCardsServlet")
public class CardDetailsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the userId from the session
    	HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userid");
        
        if (userId != null) {
            // Retrieve the list of cards for the user from the payments table
            List<CardDetails> cardList = DBUtil.getCardsByUserId(userId);
            request.setAttribute("cardList", cardList);

            // Forward the request and card details to JSP page for display
            RequestDispatcher dispatcher = request.getRequestDispatcher("profile.jsp");
            dispatcher.forward(request, response);
        } else {
            // Redirect to login page if the user is not logged in
            response.sendRedirect("login.jsp");
        }
    }
}
