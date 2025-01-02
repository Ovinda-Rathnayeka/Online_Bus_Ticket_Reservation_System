package com.addbus;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DisplayBusesServlet")
public class DisplayBusesServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        PrintWriter out = response.getWriter();
        
        try {
            List<bus> busList = DBUtil.getAllBuses(); // Fetch the list of buses
            out.println("<html>");
            out.println("<head>");
            out.println("<style>");
            out.println("body { font-family: system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif; background-color: #f4f4f4; margin: 0; padding: 20px; }");
            out.println("h1 { text-align: center; color: #333; }");
            out.println("#busTable { width: 100%; border-collapse: collapse; margin: 20px 0; box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); }");
            out.println("#busTable th, #busTable td { border: 1px solid #dddddd; text-align: left; padding: 12px; }");
            out.println("#busTable th { background-color: #0082e6; color: white; }");
            out.println("#busTable tr:nth-child(even) { background-color: #f2f2f2; }");
            out.println("#busTable tr:hover { background-color: #ddd; }");
            out.println("#busTable img { width: 100px; height: 100px; object-fit: cover; border-radius: 5px; }");
            out.println("input[type='submit'] { border: none; padding: 10px 15px; cursor: pointer; border-radius: 5px; }");
            out.println(".editBtn { background-color: #007bff; color: white; }");
            out.println(".editBtn:hover { background-color: #0056b3; }");
            out.println(".deleteBtn { background-color: #dc3545; color: white; }");
            out.println(".deleteBtn:hover { background-color: #c82333; }");
            out.println("</style>");
            out.println("</head>");
            out.println("<body>");
            
         // Add "Back to Home" button
            out.println("<div style= margin-top: 20px;'>");
            out.println("<form action='busindex-after-login.jsp' method='GET'>");
            out.println("<input type='submit' value='Back to Home' style='padding: 10px 20px; background-color: #007bff; color: white; border: none; cursor: pointer; border-radius: 5px;'/>");
            out.println("</form>");
            out.println("</div>");
            
            
            out.println("<h1>Bus Schedule</h1>");
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
                out.println("<input type='submit' value='Edit' class='editBtn'/>");
                out.println("</form>");
                
                out.println("<form action='DeleteBusServlet' method='GET' style='display:inline;'>");
                out.println("<input type='hidden' name='busId' value='" + bus.getBusId() + "'/>");
                out.println("<input type='submit' value='Delete' class='deleteBtn'/>");
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
