package com.ticket;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;

@WebServlet("/deleteTicket")  // This is the key line that maps the servlet to the URL /deleteTicket
public class DeleteTicketServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String ticketIdParam = request.getParameter("id");

        if (ticketIdParam != null && !ticketIdParam.isEmpty()) {
            try {
                int ticketId = Integer.parseInt(ticketIdParam);
                
                // Call the DBUtil method to delete the ticket by ID
                DBUtil.deleteTicketById(ticketId);
                
                // Redirect to the tickets page after deletion
                response.sendRedirect("displayTickets");  // Change this to your actual JSP page

            } catch (NumberFormatException e) {
                response.getWriter().println("Invalid ticket ID format.");
            } catch (SQLException e) {
                response.getWriter().println("Error deleting the ticket: " + e.getMessage());
            }
        } else {
            response.getWriter().println("Ticket ID is missing.");
        }
    }
}
