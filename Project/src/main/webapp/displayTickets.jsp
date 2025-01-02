<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.ticket.Ticket" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Your Tickets</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        /* Container styling */
        #taf {
            font-family: Arial, sans-serif;
            width: 80%;
            margin: 20px auto;
            padding: 20px;
            background-color: #f7f7f7;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        /* Table styling */
        #taf table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }

        #taf th, #taf td {
            padding: 12px;
            text-align: center;
            border: 1px solid #ddd;
        }

        #taf th {
            background-color: #0082e7;
            color: white;
        }

        #taf tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        #taf tr:hover {
            background-color: #ddd;
        }

        /* Link styling */
		#taf a {
		    text-decoration: none;
		    color: #fff;
		    padding: 6px 12px;
		    border-radius: 4px;
		    font-size: 14px;
		}
		
		/* Edit button styling */
		.edit {
		    background-color: #008CBA; /* Blue color */
		}
		
		.edit:hover {
		    background-color: #007BB5; /* Darker blue on hover */
		}
		
		/* Delete button styling */
		.delete {
		    background-color: #f44336; /* Red color */
		}
		
		.delete:hover {
		    background-color: #d32f2f; /* Darker red on hover */
		}
		
		/* Action buttons spacing */
		#taf .actions a {
		    margin: 0 5px;
		}

    </style>
</head>
<body>
    <div id="taf">
        <h1>Your Tickets</h1>

        <table>
            <tr>
                <th>Ticket ID</th>
                <th>email</th>
                <th>Bus Name</th>
                <th>From</th>
                <th>To</th>
                <th>Adult Tickets</th>
                <th>Child Tickets</th>
                <th>Total Price (LKR)</th>
                <th>Trip Type</th>
                <th colspan="2">Actions</th> <!-- Spans two columns for Edit and Delete -->
            </tr>

            <%
                List<Ticket> tickets = (List<Ticket>) request.getAttribute("tickets");
                if (tickets != null && !tickets.isEmpty()) {
                    for (Ticket ticket : tickets) {
                        String tripType = ticket.getTripType(); // Get the trip type (One-way or Round-trip)

                        // Debugging output for the trip type
                          // Debugging: output trip type in HTML
            %>
            <tr>
                <td><%= ticket.getTicketId() %></td>
                <td><%= ticket.getEmail() %></td>
                <td><%= ticket.getBusName() %></td>
                <td><%= ticket.getDestinationFrom() %></td>
                <td><%= ticket.getDestinationTo() %></td>
                <td><%= ticket.getSeatCountAdult() %></td>
                <td><%= ticket.getSeatCountChild() %></td>
                <td><%= ticket.getTotalPrice() %></td>
                <td><%= tripType %></td> <!-- Display trip type -->

                <!-- Action buttons -->
                <td class="actions">
				    <% if ("One-way".equals(tripType)) { %>
				        <a href="updateticket.jsp?id=<%= ticket.getTicketId() %>" class="edit">Edit</a> <!-- One-way edit servlet -->
				    <% } else if ("Round-Trip".equals(tripType)) { %> <!-- Changed this line to match the exact case -->
				        <a href="updateticket.jsp?id=<%= ticket.getTicketId() %>" class="edit">Edit</a> <!-- Round-trip edit servlet -->
				    <% } else { %>
				        <span>Unknown Trip Type</span>
				    <% } %>
				</td>

                <td class="actions">
                    <a href="deleteTicket?id=<%= ticket.getTicketId() %>" class="delete" onclick="return confirm('Are you sure you want to delete this ticket?');">Delete</a>
                </td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr>
                <td colspan="10">No tickets found.</td> <!-- Adjust colspan to match number of columns -->
            </tr>
            <%
                }
            %>
        </table>
    </div>
</body>
</html>
