package com.ticket;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/InsertTicket")
public class InsertTicketServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve userId from the session
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userid");
        

		// Retrieve the busId from the session
		Integer busId = (Integer) session.getAttribute("busId");

        // Retrieve form data
        String bookingDate = request.getParameter("departure-date");
        int seatCountAdult = Integer.parseInt(request.getParameter("adult-qty"));
        int seatCountChild = Integer.parseInt(request.getParameter("child-qty"));
        String fullName = request.getParameter("fullname");
        String email = request.getParameter("email");
        String contact = request.getParameter("phone");
        String tripType = request.getParameter("triptype");
        double totalPrice = Double.parseDouble(request.getParameter("total_price"));
        int busid = busId;

        // Create a Ticket object and set the values
        Ticket ticket = new Ticket();
        ticket.setBookingDate(bookingDate);
        ticket.setSeatCountAdult(seatCountAdult);
        ticket.setSeatCountChild(seatCountChild);
        ticket.setUserId(userId);
        ticket.setFullName(fullName);
        ticket.setEmail(email);
        ticket.setContact(contact);
        ticket.setTripType(tripType);
        ticket.setTotalPrice(totalPrice);
        ticket.setBusid(busid);

        
        try {
            DBUtil.insertTicket(ticket);
            response.sendRedirect("payment.jsp"); // Redirect on success
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.html"); // Redirect on error
        }
    }
}
