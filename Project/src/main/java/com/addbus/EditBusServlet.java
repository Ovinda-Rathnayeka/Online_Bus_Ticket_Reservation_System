package com.addbus;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/EditBusServlet")
public class EditBusServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int busId = Integer.parseInt(request.getParameter("busId"));
        
        try {
            bus bus = DBUtil.getBusById(busId);
            request.setAttribute("bus", bus);
            request.getRequestDispatcher("EditBus.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error while retrieving bus.");
        }
    }
}
