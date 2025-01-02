package com.addbus;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Base64;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/DisplayBusesServlet")
public class DisplayBusesServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        PrintWriter out = response.getWriter();
        

        HttpSession session = request.getSession();
        
        
        Integer busopid = (Integer) session.getAttribute("busopid");
        
        try {
        	
            List<bus> busList = DBUtil.getAllBuses(); // Fetch the list of buses
            out.println("<html>");
            out.println("<head>");
            out.println("<style>");
            out.println("body { font-family: Arial, sans-serif; background-color: #f4f4f4; margin: 0; padding: 20px; }");
            out.println("h1 { text-align: center; color: #333; }");
            out.println("#busTable { width: 100%; border-collapse: collapse; margin: 20px 0; box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); }");
            out.println("#busTable th, #busTable td { border: 1px solid #dddddd; text-align: left; padding: 12px; }");
            out.println("#busTable th { background-color: #0082e6; color: white; }"); // Changed header bg color
            out.println("#busTable tr:nth-child(even) { background-color: #f2f2f2; }");
            out.println("#busTable tr:hover { background-color: #ddd; }");
            out.println("#busTable img { width: 100px; height: 100px; object-fit: cover; border-radius: 5px; }");
            out.println("input[type='submit'] { color: white; border: none; padding: 10px 15px; cursor: pointer; border-radius: 5px; }");
            out.println("input[type='submit'][value='Edit'] { background-color: #008CBA; }"); // Blue for Edit
            out.println("input[type='submit'][value='Delete'] { background-color: #f44336; }"); // Red for Delete
            out.println("input[type='submit']:hover { opacity: 0.8; }"); // Added hover effect for buttons
            out.println("</style>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Bus Schedule</h1>");
            
            // Home button
            out.println("<form action='busindex-after-login.jsp' method='GET' style='text-align:left;'>");
            out.println("<input type='submit' value='Home' style='background-color: #000080; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer;'/>");
            out.println("</form>");

            
            out.println("<table id='busTable'>");
            out.println("<thead><tr><th>Bus Name</th><th>Bus Number</th>"
                       + "<th>Departure Time</th><th>Departure Date</th>"
                       + "<th>From</th><th>To</th>"
                       + "<th>Adult Price</th><th>Child Price</th>"
                       + "<th>Image</th><th>Actions</th></tr></thead>");
            out.println("<tbody>");
            
            for (bus bus : busList) {
                out.println("<tr>");
                out.println("<td>" + bus.getBusName() + "</td>");
                out.println("<td>" + bus.getBusNumber() + "</td>");
                out.println("<td>" + bus.getDepartureTime() + "</td>");
                out.println("<td>" + bus.getDepartureDate() + "</td>");
                out.println("<td>" + bus.getDestinationFrom() + "</td>");
                out.println("<td>" + bus.getDestinationTo() + "</td>");
                out.println("<td>" + bus.getAdultSeatPrice() + "</td>");
                out.println("<td>" + bus.getChildSeatPrice() + "</td>");
                out.println("<td><img src='ImageServlet?busId=" + bus.getBusId() + "' alt='Bus Image'/></td>");
                
                // Add Edit and Delete buttons
                out.println("<td>");
                out.println("<form action='EditBusServlet' method='GET' style='display:inline;'>");
                out.println("<input type='hidden' name='busId' value='" + bus.getBusId() + "'/>");
                out.println("<input type='submit' value='Edit'/>");
                out.println("</form>");
                
                out.println("<form action='DeleteBusServlet' method='GET' style='display:inline;'>");
                out.println("<input type='hidden' name='busId' value='" + bus.getBusId() + "'/>");
                out.println("<input type='submit' value='Delete'/>");
                out.println("</form>");
                
                out.println("</td>");
                out.println("</tr>");
            }
            out.println("</tbody>");
            out.println("</table>");
            out.println("</body>");
            out.println("</html>");
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("<p>Error retrieving bus data: " + e.getMessage() + "</p>");
        } finally {
            out.close();
        }
    }
}
