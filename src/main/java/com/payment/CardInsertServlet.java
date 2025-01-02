package com.payment;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/CardInsertServlet")
public class CardInsertServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        // Retrieve form parameters
        String cardNumber = request.getParameter("cardNumber").replaceAll("\\s", "");
        String expiryDate = request.getParameter("expiryDate");
        String cvc = request.getParameter("cvc");
        String cardName = request.getParameter("cardName");
        
        // Retrieve hidden fields
        String ticketId = request.getParameter("ticketId");
        String userId = request.getParameter("userId");

        boolean isSuccess = DBUtil.insertCardPayment(ticketId, userId, cardNumber, expiryDate, cvc, cardName);

        if (isSuccess) {
            // Redirect to success page (you can customize this)
            response.sendRedirect("profile.jsp");
        } else {
            // Redirect to failure page (you can customize this)
            response.sendRedirect("payment-failure.jsp");
        }
    }
}
