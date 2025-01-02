package com.addbus;

import java.io.IOException;
import java.net.URLEncoder;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig // Enable multipart handling
@WebServlet("/AddBusServlet")
public class AddBusServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Process the file upload
        Part filePart = request.getPart("image"); // Retrieves <input type="file" name="image">

        // Get the form fields
        String busName = request.getParameter("bus_name");
        String busNumber = request.getParameter("bus_number");
        String seatCountStr = request.getParameter("seat_count");
        String destinationFrom = request.getParameter("destination_from");
        String destinationTo = request.getParameter("destination_to");
        String departureTime = request.getParameter("departure_time");
        String departureDate = request.getParameter("departure_date");
        String adultSeatPriceStr = request.getParameter("adult_seat_price");
        String childSeatPriceStr = request.getParameter("child_seat_price");
        String note = request.getParameter("note");
        String busOperatorIdStr = request.getParameter("busopid");

        int seatCount = 0;
        double adultSeatPrice = 0.0;
        double childSeatPrice = 0.0;
        int busOperatorId = 0;

        // Validate and parse input fields
        try {
            if (seatCountStr != null && !seatCountStr.trim().isEmpty()) {
                seatCount = Integer.parseInt(seatCountStr);
            }

            if (adultSeatPriceStr != null && !adultSeatPriceStr.trim().isEmpty()) {
                adultSeatPrice = Double.parseDouble(adultSeatPriceStr);
            }

            if (childSeatPriceStr != null && !childSeatPriceStr.trim().isEmpty()) {
                childSeatPrice = Double.parseDouble(childSeatPriceStr);
            }

            if (busOperatorIdStr != null && !busOperatorIdStr.trim().isEmpty()) {
                busOperatorId = Integer.parseInt(busOperatorIdStr);
            }

        } catch (NumberFormatException e) {
            response.sendRedirect("AddBus.jsp?errorMessage=" + URLEncoder.encode("Invalid number format.", "UTF-8"));
            return;
        }

        // Validate required fields
        if (busName == null || busName.trim().isEmpty()) {
            response.sendRedirect("AddBus.jsp?errorMessage=" + URLEncoder.encode("Bus name is required.", "UTF-8"));
            return;
        }

        // Insert bus details into the database
        try {
            DBUtil.insertBus(busName, busNumber, seatCount, destinationFrom, destinationTo,
                             departureTime, departureDate, adultSeatPrice, childSeatPrice,
                             note, filePart, busOperatorId);
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("AddBus.jsp?errorMessage=" + URLEncoder.encode("Failed to add bus: " + e.getMessage(), "UTF-8"));
            return;
        }

        // Redirect to display all buses or a success page
        response.sendRedirect("DisplayBusesServlet");
    }
}
