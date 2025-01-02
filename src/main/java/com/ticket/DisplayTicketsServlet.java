package com.ticket;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/displayTickets")
public class DisplayTicketsServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userid"); // Assuming userId is stored in session as an integer

        DBUtil dbUtil = new DBUtil();
        List<Ticket> tickets = dbUtil.getTicketsByUserId(userId);

        request.setAttribute("tickets", tickets); // Pass the ticket list to the JSP page
        request.getRequestDispatcher("displayTickets.jsp").forward(request, response); // Forward to JSP page
    }
}
