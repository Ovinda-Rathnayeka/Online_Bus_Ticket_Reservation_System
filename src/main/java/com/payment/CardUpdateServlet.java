package com.payment;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CardUpdateServlet")
public class CardUpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form parameters
        int paymentId = Integer.parseInt(request.getParameter("paymentId"));
        String cardNumber = request.getParameter("cardNumber").replaceAll("\\s", "");
        String expiryDate = request.getParameter("expiryDate");
        String cvc = request.getParameter("cvc");  // Retrieve CVC from form
        String cardName = request.getParameter("cardName");

        // Update the card details in the database, including CVC
        boolean isSuccess = DBUtil.updateCardDetails(paymentId, cardNumber, expiryDate, cvc, cardName);

        // Redirect based on success or failure
        if (isSuccess) {
            // Redirect to success page or back to card list
            response.sendRedirect("profile.jsp");
        } else {
            // Redirect to edit page with an error message
            response.sendRedirect("editCard.jsp?paymentId=" + paymentId + "&error=true");
        }
    }
}
