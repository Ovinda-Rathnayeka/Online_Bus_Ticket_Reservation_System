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
    <link rel="stylesheet" href="css/after-login.css">
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/cards.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
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
    <nav>
        <input type="checkbox" id="check">
        <label for="check" class="checkbtn">&#9776;</label>
        <label class="logo">Bus Journey</label>
        <ul class="links">
            <li><a class="active" href="index-after-login.jsp">Home</a></li>
            <li><a href="displayTickets">My Tickets</a></li>
            <li><a href="about.jsp">About Us</a></li>
            <li><a href="contact.jsp">Contact Us</a></li>
            <li><a href="feedback.jsp">Feedback</a></li>
        </ul>
        <div class="profile-container">
            <a href="profile.jsp" class="profile">
                <i class="fa fa-user-circle" aria-hidden="true"></i>
            </a>
        </div>
    </nav>

    <section>
        <div class="content">
            <h1>Your Safe Travel Journey is Our Goal</h1>
            <p>Welcome to Go Bus Online, your trusted partner for hassle-free bus ticket bookings! Whether you're planning a one-way journey or a round-trip adventure, our platform offers a simple and convenient way to secure your seats. Explore routes across cities, compare fares, and book your journey in just a few clicks. Travel with ease and comfort, knowing your bus ticket is sorted—let the adventure begin!</p>

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
                <button onclick="window.location.href='booking.jsp?busId=<%= b.getBusId() %>'">Book One-Way Trip</button>
                <button onclick="window.location.href='round-trip.jsp?busId=<%= b.getBusId() %>'">Book Round Trip</button>
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

    
</body>
</html>
