package com.addbus;

import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ImageServlet")
public class ImageServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String busIdStr = request.getParameter("busId");
        int busId;

        try {
            busId = Integer.parseInt(busIdStr);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid bus ID.");
            return;
        }

        try (InputStream imageStream = DBUtil.getImageById(busId)) {
            if (imageStream != null) {
                response.setContentType("image/jpeg"); // Change based on the image type
                byte[] buffer = new byte[1024];
                int bytesRead;
                while ((bytesRead = imageStream.read(buffer)) != -1) {
                    response.getOutputStream().write(buffer, 0, bytesRead);
                }
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Image not found for ID: " + busId);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error while retrieving image.");
        }
    }
}
