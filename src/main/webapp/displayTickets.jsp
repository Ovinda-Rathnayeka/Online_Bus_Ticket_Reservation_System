<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.ticket.Ticket" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Your Tickets</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="styles.css">
    <style>
        /* Overall Container */
        #taf {
            font-family: Arial, sans-serif;
            width: 80%;
            margin: 40px auto;
            padding: 20px;
            background-color: #f7f7f7;
            border-radius: 10px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
            overflow:auto;
        }

        /* Table styling */
        #taf table {
		    width: 100%; /* Ensure the table fits within the container */
		    border-collapse: collapse;
		    margin: 20px 0;
		    font-size: 14px; /* Reduced font size for better fit */
		}
		
		#taf th, #taf td {
		    padding: 10px; /* Reduced padding */
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
        #taf td {
		    word-wrap: break-word; /* Allow long words to break and wrap to the next line */
		    white-space: normal; /* Ensure text can wrap within the cell */
		}
        

        /* Link (Action button) styling */
        #taf a {
            text-decoration: none;
            color: #fff;
            padding: 10px 15px;
            border-radius: 5px;
            font-size: 14px;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        /* Edit button styling */
        .edit {
            background-color: #28a745; /* Green */
        }

        .edit:hover {
            background-color: #218838; /* Darker Green */
            transform: scale(1.05); /* Slight zoom on hover */
        }

        /* Delete button styling */
        .delete {
            background-color: #f44336; /* Red */
        }

        .delete:hover {
            background-color: #d32f2f; /* Darker Red */
            transform: scale(1.05); /* Slight zoom on hover */
        }

        /* Pay button styling */
        .pay {
            background-color: #007BFF; /* Blue */
        }

        .pay:hover {
            background-color: #0056b3; /* Darker Blue */
            transform: scale(1.05); /* Slight zoom on hover */
        }

        /* Action buttons spacing */
        #taf .actions a {
            margin: 0 5px;
        }
        @media (max-width: 768px) {
		    #taf table {
		        font-size: 12px; /* Smaller font size */
		    }
		    #taf th, #taf td {
		        padding: 8px; /* Smaller padding */
		    }
		}
		        
    </style>
</head>
<body>
    <div id="taf">
        <h1>Your Tickets</h1>

        <table>
            <tr>
                <th>Ticket ID</th>
                <th>Email</th>
                <th>Bus Name</th>
                <th>From</th>
                <th>To</th>
                <th>Adult Tickets</th>
                <th>Child Tickets</th>
                <th>Total Price (LKR)</th>
                <th>Trip Type</th>
                <th colspan="3">Actions</th> <!-- Spans two columns for Edit and Delete -->
            </tr>

            <%
                List<Ticket> tickets = (List<Ticket>) request.getAttribute("tickets");
                if (tickets != null && !tickets.isEmpty()) {
                    for (Ticket ticket : tickets) {
                        String tripType = ticket.getTripType();
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
                <td><%= tripType %></td>

                <!-- Action buttons -->
                <td class="actions">
				    <a href="updateticket.jsp?id=<%= ticket.getTicketId() %>" class="edit">Edit</a>
				</td>

				<td class="actions">
				    <a href="deleteTicket?id=<%= ticket.getTicketId() %>" class="delete" onclick="return confirm('Are you sure you want to delete this ticket?');">Delete</a>
				</td>

				<td class="actions">
				     <a href="payment.jsp?ticketId=<%= ticket.getTicketId() %>" class="pay">Pay</a>
				</td>

            </tr>
            <%
                    }
                } else {
            %>
            <tr>
                <td colspan="10">No tickets found.</td>
            </tr>
            <%
                }
            %>
        </table>
    </div>
</body>
</html>
