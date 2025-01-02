package com.addbus;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig
@WebServlet("/UpdateBusServlet")
public class UpdateBusServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int busId = Integer.parseInt(request.getParameter("busId"));
        String busName = request.getParameter("busName");
        String busNumber = request.getParameter("busNumber");
        int seatCount = Integer.parseInt(request.getParameter("seatCount"));
        String destinationFrom = request.getParameter("destinationFrom");
        String destinationTo = request.getParameter("destinationTo");
        String departureTime = request.getParameter("departureTime");
        String departureDate = request.getParameter("departureDate");
        double adultSeatPrice = Double.parseDouble(request.getParameter("adultSeatPrice"));
        double childSeatPrice = Double.parseDouble(request.getParameter("childSeatPrice"));
        String note = request.getParameter("note");
        Part filePart = request.getPart("image");

        try {
            DBUtil.updateBus(busId, busName, busNumber, seatCount, destinationFrom, destinationTo,
                    departureTime, departureDate, adultSeatPrice, childSeatPrice, note, filePart);
            response.sendRedirect("DisplayBusesServlet");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error while updating bus.");
        }
    }
}
