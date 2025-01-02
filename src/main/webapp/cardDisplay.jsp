<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.payment.CardDetails, com.payment.DBUtil" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment List</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f8f8;
            padding: 50px;
        }

        /* Styling for the section */
        #payment-section {
            background-color: white; /* Slightly transparent white */
            
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 1200px;
            margin: 0 auto;
        }

        h2 {
            text-align: left;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #fff; /* Solid white background for table */
        }

        table, th, td {
            border: 1px solid #ccc;
            padding: 10px;
        }

        th {
            background-color: #f2f2f2;
        }

		/* Buttons styles */
		.action-btn {
		    text-decoration: none;
		    padding: 8px 12px;
		    border-radius: 4px;
		    font-size: 14px;
		    display: inline-block;
		    text-align: center;
		    width: 70px; /* Adjust width for consistent size */
		}
		
		.edit-btn {
		    background-color: #007bff; /* Blue color */
		    color: white;
		    margin-right: 30px; /* Adds space between the edit and delete buttons */
		}
		
		.delete-btn {
		    background-color: #dc3545; /* Red color */
		    color: white;
		}
		
		/* Center the buttons in the table column */
		td {
		    text-align: center;
		    vertical-align: middle;
		}
		
		/* Hover effects for buttons */
		.edit-btn:hover {
		    background-color: #0056b3; /* Darker blue on hover */
		}
		
		.delete-btn:hover {
		    background-color: #c82333; /* Darker red on hover */
		}

    </style>
</head>
<body>
    <section id="payment-section">
        <h2>My Cards</h2>

        <% 
            // Retrieve userId from session (assumed to be stored in session after login)
            Integer userId = (Integer) session.getAttribute("userid");

            if (userId == null) {
                // Redirect to login page if the user is not logged in
                response.sendRedirect("login.jsp");
                return;
            }

            // Get the list of payments for this user
            List<CardDetails> cardList = DBUtil.getCardsByUserId(userId);

            if (cardList != null && !cardList.isEmpty()) {
        %>
                <table>
                    <thead>
                        <tr>
                            <th>Card Number</th>
                            <th>Expiry Date</th>
                            <th>Card Holder</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                    <%
                        for (CardDetails card : cardList) {
                    %>
                        <tr>
                            <td><%= card.getCardNumber().replaceAll("(.{4})", "$1 ") %></td>
                            <td><%= card.getExpiryDate() %></td>
                            <td><%= card.getCardHolderName() %></td>
                            <td>
                                <!-- Edit button with paymentId passed as a parameter -->
                                <a href="editCard.jsp?paymentId=<%= card.getPaymentId() %>" class="action-btn edit-btn">Edit</a>

                                <!-- Delete button with paymentId passed as a parameter -->
                                <a href="DeleteCardServlet?paymentId=<%= card.getPaymentId() %>" class="action-btn delete-btn" onclick="return confirm('Are you sure you want to delete this payment?');">Delete</a>
                            </td>
                        </tr>
                    <%
                        }
                    %>
                    </tbody>
                </table>
        <%
            } else {
        %>
            <p>No payments found for this user.</p>
        <%
            }
        %>
    </section>
</body>
</html>
