<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="com.addbus.bus" %>
<%@ page import="com.addbus.DBUtil" %>

<%
    // Declare session variable at the beginning with a different name
    HttpSession userSession = request.getSession();

    // Retrieve the busId from the request (GET parameter)
    String busIdParam = request.getParameter("busId");
    bus selectedBus = null;

    if (busIdParam != null) {
        int busId = Integer.parseInt(busIdParam); // Parse the bus ID from the string
        try {
            // Fetch the bus details using the getBusById method
            selectedBus = DBUtil.getBusById(busId);
        } catch (SQLException e) {
            out.println("<p>Error retrieving bus details: " + e.getMessage() + "</p>");
        }
    }

    // If bus data is successfully retrieved, store in variables for reuse
    int busId = 0; // Declare busId variable
    String busName = "";
    String busNumber = "";
    int seatCount = 0;
    String destinationFrom = "";
    String destinationTo = "";
    String departureTime = "";
    String departureDate = "";
    double adultSeatPrice = 0.0;
    double childSeatPrice = 0.0;
    String note = "";
    byte[] busImage = null;

    if (selectedBus != null) {
        busId = selectedBus.getBusId();
        busName = selectedBus.getBusName();
        busNumber = selectedBus.getBusNumber();
        seatCount = selectedBus.getSeatCount();
        destinationFrom = selectedBus.getDestinationFrom();
        destinationTo = selectedBus.getDestinationTo();
        departureTime = selectedBus.getDepartureTime();
        departureDate = selectedBus.getDepartureDate();
        adultSeatPrice = selectedBus.getAdultSeatPrice();
        childSeatPrice = selectedBus.getChildSeatPrice();
        note = selectedBus.getNote();
        busImage = selectedBus.getImage();
        
        // Store the busId in the session
        userSession.setAttribute("busId", busId);
    }

    // Calculate return time and date
    String returnTime = "";
    String returnDate = "";
    if (departureDate != null && departureTime != null) {
        try {
            // Combine date and time to a single string
            String dateTimeStr = departureDate + " " + departureTime;
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(sdf.parse(dateTimeStr));
            
            // Add 7 hours for return time
            calendar.add(Calendar.HOUR_OF_DAY, 7);
            returnTime = sdf.format(calendar.getTime());
            
            // Add 1 day for return date
            calendar.add(Calendar.DAY_OF_MONTH, 1);
            returnDate = new SimpleDateFormat("yyyy-MM-dd").format(calendar.getTime());
        } catch (Exception e) {
            returnTime = "Error";
            returnDate = "Error";
        }
    }
%>




<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="utf-8">
    <title>Booking Round Trip</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/after-login.css">
    <link rel="stylesheet" href="content.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" 
    integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body>

    <div class="container">
        <h3 class="getquotetext">Book Your Journey</h3>

        <form id="one-way-form" action="InsertTicket" method="post">
            <div class="blocks">
                <!-- Left section with form fields -->
                <div class="left">
                    <div class="triptype">
                     <input type="hidden"  name="triptype" value="Round-Trip">
                       
                    </div>

                    <!-- Personal Details -->
                   <label for="personalDetails">Personal Details</label>
                    <div class="contact-info-section">
                        <div class="fullname-input-container">
                            <input type="text" placeholder="Full Name" name="fullname" required>
                            <span class="fullname-icon"></span>
                        </div>
                        
                        <div class="contact-input-container">
		                    <input type="text" id="contact-number" placeholder="Contact Number" name="phone" required oninput="validateContactNumber()">
		                    <span class="contact-icon"></span>
		                    <div id="contact-error-message" style="color: red; display: none; margin-top: 5px;">
		                       
		                    </div>
		                </div>
                        
                        
                        <div class="email-input-container">
                            <input type="email" placeholder="Email Address"  name  = "email" required>
                            <span class="email-icon"></span>
                        </div>
                    </div>
                    <!-- From & To -->
                    <div class="select-field">
                        <label for="from">From</label>
                        <div class="select">
                            <input type="text" id="from" name="from" value='<%= destinationFrom %>'  required>
                            <i class="fas fa-map-marker-alt select-icon"></i>
                        </div>
                    </div>
                    
                    <div class="select-field">
                        <label for="to">To</label>
                        <div class="select">
                            <input type="text" id="to" name="to" value='<%= destinationTo %>' required>
                            <i class="fas fa-map-marker-alt select-icon"></i>
                        </div>
                    </div>
                    
                    <div style="color: red; font-weight: bold;">
					    Round Trip Selected
					</div>
                    

                    <!-- Dates -->
                    <label for="departure-date">Departure Date</label>
                    <div class="date-input-container">
                        <input type="date" id="departure-date" name="departure-date" value="<%= departureDate %>" required>
                        <i class="fas fa-calendar-alt date-icon"></i>
                    </div>

                    <!-- Passengers -->
                    <div class="quantity-selector">
                        <i class="fas fa-user quantity-icon"></i>
                        <button type="button" class="quantity-btn" onclick="changeQuantity(this, -1, 'adult')">-</button>
                        <input type="text" name="adult-qty" id="adult-qty" class="quantity-input" value="0" oninput="validateQuantity(this, 'adult');" required>
                        <button type="button" class="quantity-btn" onclick="changeQuantity(this, 1, 'adult')">+</button>
                        <label for="adult-qty">Adult Price: LKR <%= adultSeatPrice %></label>
                    </div>
                    
                    <div class="quantity-selector">
                        <i class="fas fa-child quantity-icon"></i>
                        <button type="button" class="quantity-btn" onclick="changeQuantity(this, -1, 'child')">-</button>
                        <input type="text" name="child-qty" id="child-qty" class="quantity-input" value="0" oninput="validateQuantity(this, 'child');">
                        <button type="button" class="quantity-btn" onclick="changeQuantity(this, 1, 'child')">+</button>
                        <label for="child-qty">Child Price: LKR <%= childSeatPrice %></label>
                    </div>

                </div>

                <!-- Right section with trip details -->
                <div class="right">
                    <div class="trip-detail-container">
                        <!-- One-Way Details -->
                        <div class="trip-details-box">
                            <h3>One-Way</h3>
                            <table>
                                <tr><td>From</td><td><strong><%= destinationFrom %></strong></td></tr>
                                <tr><td>To</td><td><strong><%= destinationTo %></strong></td></tr>
                                <tr><td>Date</td><td><strong><%= departureDate %></strong></td></tr>
                                <tr><td>Time</td><td><strong><%= departureTime %></strong></td></tr>
                            </table>
                        </div>
                        
                        <div class="trip-details two-way-container">
						    <h3>Round-Trip</h3>
						    <table>
						        <tr><td>From</td><td><strong><%= destinationTo %></strong></td></tr>
						        <tr><td>To</td><td><strong><%= destinationFrom %></strong></td></tr>
						        <tr><td>Departure</td><td><strong><%= departureDate %> <%= departureTime %></strong></td></tr>
						        <tr><td>Return</td><td><strong><%= returnDate %> <%= returnTime %></strong></td></tr>
						    </table>
						</div>
					</div>
						
		            <div class="price-detail-container">
				    <!-- Price Details -->
						<h3>Price</h3>
						<table>
							<tr>
						    	<td>Adult Price (60% Added for return)</td>
						        <td>LKR <%= adultSeatPrice %> x <span id="adult-qty-text">0</span></td>
						    </tr>
						    <tr>
						        <td>Child Price (60% Added for return)</td>
						        <td>LKR <%= childSeatPrice %> x <span id="child-qty-text">0</span></td>
						    </tr>
						    <tr>
					            <td>Total Price</td>
					            <td id="total-price">LKR 0</td>
					        </tr>
					    </table>
						<!-- Hidden Input Fields -->
						<input type="hidden" id="adult-price" name="adult_price" value="<%= adultSeatPrice %>">
						<input type="hidden" id="child-price" name="child_price" value="<%= childSeatPrice %>">
						<input type="hidden" id="hidden-total-price" name="total_price" value="0"> <!-- Ensure this matches the JavaScript -->
					</div>
				</div>
			</div>
			<!-- Buttons -->
			<div class="buttons">
			    <button type="submit" class="action-button">Book Tickets</button>
			</div>

		</form>
	</div>
	
	<script>
		function validateContactNumber() {
		    const contactNumber = document.getElementById('contact-number').value;
		    const contactErrorMessage = document.getElementById('contact-error-message');
		    
		    // Check if the contact number is exactly 10 digits
		    const contactRegex = /^[0-9]{10}$/;
		
		    if (!contactRegex.test(contactNumber)) {
		        // Display error message
		        contactErrorMessage.style.display = 'block';
		        contactErrorMessage.innerHTML = "Contact number must be exactly 10 digits.";
		    } else {
		        // Hide error message if valid
		        contactErrorMessage.style.display = 'none';
		    }
		}
	</script>

<script>
    // Function to toggle the dropdown menu
    function toggleDropdown() {
        document.getElementById("dropdown-menu").classList.toggle("show");
    }

    // Function to navigate to a specific page
    function navigateToPage(page) {
        window.location.href = page;
    }

    // Function to change quantity
    function changeQuantity(button, amount, type) {
        let qtyInput = document.getElementById(type + "-qty");
        let currentQty = parseInt(qtyInput.value) || 0; // Use 0 if the value is NaN
        let newQty = currentQty + amount;

        if (newQty >= 0) {
            qtyInput.value = newQty;
            updatePrice(); // Update total price whenever quantity changes
        }
    }

    // Function to validate quantity input
    function validateQuantity(input, type) {
        let qty = parseInt(input.value) || 0; // Use 0 if the value is NaN
        if (qty < 0) {
            input.value = 0; // Reset to 0 if negative
        }
        updatePrice(); // Update total price whenever quantity changes
    }

    // Function to update total price based on quantities
    function updatePrice() {
        let adultQty = parseInt(document.getElementById("adult-qty").value) || 0; // Ensure this ID matches your input field ID
        let childQty = parseInt(document.getElementById("child-qty").value) || 0; // Ensure this ID matches your input field ID

        // Ensure these values are integers (assumed to be retrieved from JSP as integers)
        let adultPrice = <%= (int) adultSeatPrice %>; // Use direct integer value from JSP
        let childPrice = <%= (int) childSeatPrice %>; // Use direct integer value from JSP
        
        // Calculate total price using integers and double it
        let totalPrice = (adultQty * adultPrice + childQty * childPrice) * 2; // Double the total price
        let discount = Math.floor(totalPrice * 0.20); // 20% discount (ensure it's an integer)
        let finalPrice = totalPrice - discount; // Apply discount to total price

        // Update the display of quantities and total price
        document.getElementById("adult-qty-text").textContent = adultQty;
        document.getElementById("child-qty-text").textContent = childQty;
        document.getElementById("total-price").textContent = "LKR " + finalPrice.toFixed(0); // Display final price without decimal

        // Set the hidden input value to the final price
        document.getElementById("hidden-total-price").value = finalPrice.toFixed(0); // Ensure this ID matches
    }
</script>

</body>

<footer>
    <p>&copy; 2024 Bus Journey. All rights reserved.</p>
</footer>

</html>