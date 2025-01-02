<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.addbus.bus" %>
<%@ page import="com.addbus.DBUtil" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/after-login.css">
    <link rel="stylesheet" href="AddBus.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Bus Details Form</title>
    
</head>
<body>
    <nav>
        <input type="checkbox" id="check">
        <label for="check" class="checkbtn">&#9776;</label>
        <label class="logo">Bus Journey</label>
        <ul class="links">
            <li><a href="busindex-after-login.jsp">Home</a></li>
            <li><a class="active" href="AddBus.jsp">Add Bus</a></li>
            <li><a href="DisplayBusesServlet">Bus Details</a></li>
            <li><a href="about.jsp">About Us</a></li>
            <li><a href="contact.jsp">Contact Us</a></li>
            <li><a href="feedback.jsp">Feedback</a></li>
        </ul>
        
    </nav>
    
    <div class="container">
        <h1>Add Bus Details</h1>
        <form action="AddBusServlet" method="POST" enctype="multipart/form-data">
            <label for="bus_name">Bus Name:</label>
            <input type="text" id="bus_name" name="bus_name" required>

            <label for="bus_number">Bus Number:</label>
            <input type="text" id="bus_number" name="bus_number" required>

            <label for="seat_count">Seat Count:</label>
            <input type="number" id="seat_count" name="seat_count" required>

            <label for="destination_from">Destination From:</label>
            <input type="text" id="destination_from" name="destination_from" required>

            <label for="destination_to">Destination To:</label>
            <input type="text" id="destination_to" name="destination_to" required>

            <label for="departure_time">Departure Time:</label>
            <input type="time" id="departure_time" name="departure_time" required>

            <label for="departure_date">Departure Date:</label>
            <input type="date" id="departure_date" name="departure_date" required>

            <label for="adult_seat_price">Adult Seat Price:</label>
            <input type="number" id="adult_seat_price" name="adult_seat_price" step="0.01" required>

            <label for="child_seat_price">Child Seat Price:</label>
            <input type="number" id="child_seat_price" name="child_seat_price" step="0.01" required>

            <label for="note">Note:</label>
            <textarea id="note" name="note"></textarea>

            <label for="image">Image:</label>
            <input type="file" id="image" name="image" accept="image/*">

            <label for="busopid">Bus Operator ID:</label>
            <input type="number" id="busopid" name="busopid" required>

            <button type="submit">Submit</button>
        </form>
    </div>
    
        <footer>
        <p>&copy; 2024 Bus Journey. All rights reserved.</p>
    </footer>

</body>
</html>
