<%@ page import="java.sql.SQLException" %>
<%@ page import="com.ticket.Ticket" %>
<%@ page import="com.ticket.DBUtil" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
    // Retrieve the ticketId from the request (GET parameter)
    String ticketIdParam = request.getParameter("id");
    Ticket ticket = null;

    if (ticketIdParam != null) {
        try {
            int ticketId = Integer.parseInt(ticketIdParam);
            // Fetch the ticket by ID
            ticket = DBUtil.getTicketById(ticketId);
        } catch (NumberFormatException e) {
            out.println("<p>Error: Invalid ticket ID format.</p>");
        } catch (SQLException e) {
            out.println("<p>Error retrieving ticket details: " + e.getMessage() + "</p>");
        }
    } else {
        out.println("<p>Error: Ticket ID is missing.</p>");
    }

    // Store ticket details in variables for reuse
    int ticketId = 0;
    String fullName = "";
    String email = "";
    String phone = "";
    int adultQty = 0;
    int childQty = 0;
    double adultSeatPrice = 0.0;
    double childSeatPrice = 0.0;
    double totalPrice = 0.0;
    String destinationFrom = "";
    String destinationTo = "";

    if (ticket != null) {
        ticketId = ticket.getTicketId();
        fullName = ticket.getFullName();
        email = ticket.getEmail();
        phone = ticket.getContact();
        adultQty = ticket.getSeatCountAdult();
        childQty = ticket.getSeatCountChild();
        adultSeatPrice = ticket.getAdultSeatPrice();
        childSeatPrice = ticket.getChildSeatPrice();
        totalPrice = ticket.getTotalPrice();
        destinationFrom = ticket.getDestinationFrom(); 
        destinationTo = ticket.getDestinationTo(); 
    }

    // Create or retrieve the session
    HttpSession httpSession = request.getSession(); 
    httpSession.setAttribute("ticketId", ticketId);  // Store ticketId in the session
%>

<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="utf-8">
    <title>Update Booking</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" 
    integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="test.css">
    <link rel="stylesheet" href="css/after-login.css">
</head>

<body>
    <nav>
        <input type="checkbox" id="check">
        <label for="check" class="checkbtn">&#9776;</label>
        <label class="logo">Bus Journey</label>
        <ul class="links">
            <li><a href="../after-login/index-after-login.html">Home</a></li>
            <li><a href="booking.html">Book Tickets</a></li>
            <li><a href="../About/about.html">About Us</a></li>
            <li><a href="../Contact/contact.html">Contact Us</a></li>
            <li><a href="../feedback/feedback.html">Feedback</a></li>
        </ul>
        <div class="profile-container">
            <a href="profile.jsp" class="profile" onclick="toggleDropdown()">
                <i class="fa fa-user-circle" aria-hidden="true"></i>
            </a>
        </div>
    </nav>

    <div class="container">
        <h3 class="getquotetext">Update My Booking</h3>

        <% if (ticket != null) { %>
            <form action="UpdateTicket" method="post">
                <input type="hidden" name="ticketId" value="<%= ticketId %>">

            <div class="blocks">
                <!-- Left section with form fields -->
                <div class="left">
                    <!-- Contact Information -->
                    <label for="personalDetails">Personal Details</label>
                    <div class="contact-info-section">
                        <div class="fullname-input-container">
                            <input type="text" name="fullname" value="<%= fullName %>" required>
                            <span class="fullname-icon"></span>
                        </div>
                        
                        <div class="contact-input-container">
                            <input type="text" name="phone" value="<%= phone %>" required>
                            <span class="contact-icon"></span>
                            <div id="contact-error-message" style="color: red;font-weight: 500; display: none; margin-top: 5px;">
                                Contact number must be exactly 10 digits.
                            </div>
                        </div>
                        
                        
                        <div class="email-input-container">
                            <input type="email" name="email" value="<%= email %>" required>
                            <span class="email-icon"></span>
                        </div>
                    </div>
                    
                    <!-- Passengers -->
                    <label for="personalDetails">Adult Tickets</label>
                    <div class="quantity-selector">
                        <i class="fas fa-user quantity-icon"></i>
                        <button type="button" class="quantity-btn" onclick="changeQuantity(this, -1, 'adult')">-</button>
                        <input type="text" id="adult-qty" name="adult-qty" class="quantity-input" value="<%= adultQty %>" oninput="validateQuantity(this);" required>
                        <button type="button" class="quantity-btn" onclick="changeQuantity(this, 1, 'adult')">+</button>
                        <span>(Adult Price: LKR <%= adultSeatPrice %>)</span>
                    </div>
                    
                    <label for="personalDetails">Child Tickets</label>
                    <div class="quantity-selector">
                        <i class="fas fa-child quantity-icon"></i>
                        <button type="button" class="quantity-btn" onclick="changeQuantity(this, -1, 'child')">-</button>
                        <input type="text" id="child-qty" name="child-qty" class="quantity-input" value="<%= childQty %>" oninput="validateQuantity(this);">
                        <button type="button" class="quantity-btn" onclick="changeQuantity(this, 1, 'child')">+</button>
                        <span>(Child Price: LKR <%= childSeatPrice %>)</span>
                    </div>
                    
                </div>

                <!-- Right section with trip details -->
                <div class="right">
                    <div class="trip-detail-container">
                        <!-- One-Way Details -->
                        <div class="trip-details-box">
                            <h3>Trip Information</h3>
                            <table>
                                <tr><td>From</td><td><%= destinationFrom %></td></tr>
                                <tr><td>To</td><td><%= destinationTo %></td></tr>
                            </table>
                        </div>
                    </div>

                    <div class="price-detail-container">
                        <!-- Price Details -->
                        <h3>Price</h3>
                        <table>
                            <tr><td>Adult Price</td><td>LKR <%= adultSeatPrice %> x <span id="adult-qty-text"><%= adultQty %></span></td></tr>
                            <tr><td>Child Price</td><td>LKR <%= childSeatPrice %> x <span id="child-qty-text"><%= childQty %></span></td></tr>
                            <tr>
				            	<td>Total Price</td>
					            <td>
					                <span id="total-price">LKR <%= totalPrice %></span>
					                <input type="hidden" id="hidden-total-price" name="total-price" value="0">
					                <input type="hidden" id="total-price-hidden" name="total_price" value="<%= totalPrice %>">
					            </td>
				        	</tr>   
                        </table>
                    </div>
                </div>
            </div>

            <!-- Buttons -->
            <div class="buttons">
                <button type="submit" class="action-button">Update Booking</button>
            </div>
        </form>
        <% } else { %>
            <p>No ticket found with the provided ID.</p>
        <% } %>
    </div>

    <script>
        // Function to change ticket quantity
        function changeQuantity(button, amount, type) {
            let qtyInput = document.getElementById(type + "-qty");
            let currentQty = parseInt(qtyInput.value) || 0;
            let newQty = currentQty + amount;

            if (newQty >= 0) {
                qtyInput.value = newQty;
                updatePrice(); // Update total price whenever quantity changes
            }
        }

        // Function to validate quantity input
        function validateQuantity(input) {
            let qty = parseInt(input.value) || 0;
            if (qty < 0) {
                input.value = 0; // Reset to 0 if negative
            }
            updatePrice(); // Update total price whenever quantity changes
        }

        // Function to update total price
        function updatePrice() {
            let adultQty = parseInt(document.getElementById("adult-qty").value) || 0;
            let childQty = parseInt(document.getElementById("child-qty").value) || 0;
            let adultPrice = <%= adultSeatPrice %>;
            let childPrice = <%= childSeatPrice %>;
            let totalPrice = (adultQty * adultPrice) + (childQty * childPrice);

            // Update the displayed quantities and total price
            document.getElementById("adult-qty-text").textContent = adultQty;
            document.getElementById("child-qty-text").textContent = childQty;
            document.getElementById("total-price").textContent = "LKR " + totalPrice;

            // Update hidden input for total price
            document.getElementById("total-price-hidden").value = totalPrice;
        }
    </script>

</body>
<footer>
    <p>&copy; 2024 Ticket Journey. All rights reserved.</p>
</footer>
</html>
