package com.addbus;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteBusServlet")
public class DeleteBusServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        int busId = Integer.parseInt(request.getParameter("busId"));

        try {
            DBUtil.deleteBus(busId);
            response.sendRedirect("DisplayBusesServlet"); // Redirect to the display page after deletion
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Unable to delete bus.");
        }
    }
}
