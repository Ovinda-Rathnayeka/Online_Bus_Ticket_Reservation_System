package com.ticket;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateTicket")
public class UpdateTicketServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int ticketId = Integer.parseInt(request.getParameter("ticketId"));
        String fullName = request.getParameter("fullname");
        String email = request.getParameter("email");
        String contact = request.getParameter("phone");
        int seatCountAdult = Integer.parseInt(request.getParameter("adult-qty"));
        int seatCountChild = Integer.parseInt(request.getParameter("child-qty"));
        double totalPrice = Double.parseDouble(request.getParameter("total_price"));

        Ticket ticket = new Ticket();
        ticket.setTicketId(ticketId);
        ticket.setFullName(fullName);
        ticket.setEmail(email);
        ticket.setContact(contact);
        ticket.setSeatCountAdult(seatCountAdult);
        ticket.setSeatCountChild(seatCountChild);
        ticket.setTotalPrice(totalPrice);

        try {
            DBUtil.updateTicket(ticket); // Update ticket method in DBUtil
            response.sendRedirect("profile.jsp"); // Redirect after update
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error updating ticket: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
