<%@ page import="java.util.List" %>
<%@ page import="com.addbus.bus" %>
<%@ page import="com.addbus.DBUtil" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="utf-8">
    <title>Bus Journey</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/cards.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
    
	    button {
		    background-color: #007BFF; /* Neon green background */
		    color: black; /* Black text */
		    border: 2px solid #007BFF; /* Neon green border */
		    padding: 15px 30px; /* Larger padding for bigger button */
		    font-size: 18px; /* Larger font size */
		    border-radius: 8px; /* Slightly larger rounded corners */
		    cursor: pointer; /* Pointer cursor on hover */
		    transition: all 0.3s ease; /* Smooth transition for all changes */
		    box-shadow: 0 0 5px #007BFF; /* Subtle neon glow around button */
		}
		
		button:hover {
		    background-color: #007BFF; /* Transparent background on hover */
		    color: #fff; /* Neon green text */
		    border-color: #007BFF; /* Neon green border */
		    transform: scale(1.1); /* Slightly larger on hover */
		    box-shadow: 0 0 5px #007BFF, 0 0 8px #007BFF; /* More intense neon glow */
		}

		
        footer {
            text-align: center;
            padding: 20px;
            background: #0d4875;
            color: #fff;
            margin-top: 60px;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>
<body>
	<%@ include file="busOpNav.jsp" %>

    <section>
        <div class="content">
            <h1>Your Safe Travel Journey is Our Goal</h1>
            <p>Add a bus, expand your horizons. With Bus Journey, every new route opens doors to endless possibilities!</p>
            <button onclick="window.location.href='AddBus.jsp'">Add Bus</button>
        </div>
    </section>

    <h2 class="popular-routes-title">Available Bus Routes</h2>
    <section class="popular-routes">
        <div class="route-cards">
            <%
                try {
                    // Fetch the list of buses from the database
                    List<bus> busList = DBUtil.getAllBuses();

                    // Check if there are any buses to display
                    if (busList.isEmpty()) {
                        out.println("<p>No bus routes available at the moment.</p>");
                    } else {
                        // Iterate through each bus and create a card for it
                        for (bus b : busList) {
            %>
            <div class="card">
                <img src="ImageServlet?busId=<%= b.getBusId() %>" alt="<%= b.getBusName() %>" class="card-image">
                <h3><%= b.getBusName() %></h3>
                <p>Route: <%= b.getDestinationFrom() %> to <%= b.getDestinationTo() %></p>
                <p>Departure Time: <%= b.getDepartureTime() %></p>
                <p>Departure Date: <%= b.getDepartureDate() %></p>
                <p>Adult Price: <%= b.getAdultSeatPrice() %> LKR</p>
                <p>Child Price: <%= b.getChildSeatPrice() %> LKR</p>
            </div>
            <%
                        }
                    }
                } catch (SQLException e) {
                    out.println("<p>Error retrieving bus data: " + e.getMessage() + "</p>");
                }
            %>
        </div>
    </section>

    <footer>
        <p>&copy; 2024 Bus Journey. All rights reserved.</p>
    </footer>

    <script src="after-login.js"></script>
</body>
</html>
