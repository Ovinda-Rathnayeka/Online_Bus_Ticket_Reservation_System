package com.payment;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteCardServlet")
public class DeleteCardServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get paymentId from request
        int paymentId = Integer.parseInt(request.getParameter("paymentId"));

        // Delete card from database
        boolean isDeleted = DBUtil.deleteCard(paymentId);

        // Redirect to cardDisplay.jsp after deletion
        if (isDeleted) {
            response.sendRedirect("profile.jsp");
        } else {
            response.getWriter().write("Error deleting the card.");
        }
    }
}
