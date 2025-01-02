<%@ page import="java.util.List" %>
<%@ page import="com.addbus.bus" %>
<%@ page import="com.addbus.DBUtil" %>
<%@ page import="java.sql.SQLException" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="utf-8">
    <title>Bus-Home</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/nav.css">
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
            width: 100%;
        }
        .error-message {
            background-color: #ffdddd;
            color: #d8000c;
            border: 1px solid #d8000c;
            padding: 10px;
            margin: 20px 0;
            border-radius: 5px;
            display: none; /* Initially hidden */
        }
    </style>
</head>
<body>

<nav>
    <input type="checkbox" id="check">
    <label for="check" class="checkbtn">&#9776;</label>
    <label class="logo">Bus Journey</label>
    <ul class="links">
        <li><a class="active" href="index.jsp">Home</a></li>
        <li><a href="BookingForm/booking.html">Book Tickets</a></li>
        <li><a href="About/about.html">About Us</a></li>
        <li><a href="contact.jsp">Contact Us</a></li>
        <li><a href="feedback/feedback.html">Feedback</a></li>
    </ul>
    <div class="signup-login">
        <a href="sign-up.jsp" class="signup">Sign Up</a>
        <a href="sign-in.jsp" class="login">Sign In</a>
    </div>
</nav>

<section>
    <div class="content">
        <h1>Your Safe Travel Journey is Our Goal</h1>
        <p>Welcome to Go Bus Online, your trusted partner for hassle-free bus ticket bookings! Whether you're planning a one-way journey or a round-trip adventure, our platform offers a simple and convenient way to secure your seats. Explore routes across cities, compare fares, and book your journey in just a few clicks. Travel with ease and comfort, knowing your bus ticket is sorted—let the adventure begin!</p>
    </div>
</section>

<h2 class="popular-routes-title">Popular Routes</h2>
<section class="popular-routes">
    <div class="route-cards">
        <%
            try {
                // Fetch the list of buses from the database
                List<bus> busList = DBUtil.getAllBuses();

                // Check if the user is logged in using the implicit session object
                Boolean isLoggedIn = (session.getAttribute("user") != null);

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
            <%
                if (isLoggedIn) {
            %>
            <button onclick="window.location.href='../BookingForm/booking.html'">Book Now</button>
            <%
                } else {
            %>
            <button onclick="showErrorMessage()">Book Now</button>
            <%
                }
            %>
        </div>
        <%
                }
            } catch (SQLException e) {
                out.println("<p>Error retrieving bus data: " + e.getMessage() + "</p>");
            }
        %>
    </div>
</section>

<!-- Error message div -->
<div class="error-message" id="error-message">
    Please log in to book tickets.
</div>

<footer>
    <p>&copy; 2024 Bus Journey. All rights reserved.</p>
</footer>

<script>
    function showErrorMessage() {
        // Show the error message
        document.getElementById('error-message').style.display = 'block';
    }
</script>

</body>
</html>
