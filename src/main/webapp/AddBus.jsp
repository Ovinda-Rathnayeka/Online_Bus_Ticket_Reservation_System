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

    
    <div class="container" >
        <h1>Add Bus Details</h1>
        <form action="AddBusServlet" method="POST" enctype="multipart/form-data">
            <label for="bus_name">Bus Name:</label>
            <input type="text" id="bus_name" name="bus_name" required>

			<label for="bus_number">Bus Number:</label>
			<input type="text" id="bus_number" name="bus_number" required>
			<span class="error-message" id="bus_number_error"></span>

            <label for="seat_count">Seat Count:</label>
            <input type="number" id="seat_count" name="seat_count" required>
            <span id="seat_count_error"></span>

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
		    <span id="adultPriceError" style="color: red;"></span>
		
		    <label for="child_seat_price">Child Seat Price:</label>
		    <input type="number" id="child_seat_price" name="child_seat_price" step="0.01" required>
		    <span id="childPriceError" style="color: red;"></span>

            <label for="note">Note:</label>
            <textarea id="note" name="note"></textarea>

            <label for="image">Image:</label>
            <input type="file" id="image" name="image" accept="image/*">
            <span id="image_error"></span>

            
            <input type="hidden" id="busopid" name="busopid" value="1">

            <button type="submit">Submit</button>
        </form>
    </div>
   
    
    <style>
    .error-message, #seat_count_error, #image_error {
        font-size: 12px;
        color: red;
    }

</style>
   <script>
   document.getElementById('bus_number').addEventListener('input', function () {
	    const busNumber = this.value;
	    const busNumberError = document.getElementById("bus_number_error");
	    
	    // Define the allowed formats
	    const busNumberRegex1 = /^[A-Z]{2,3}[0-9]{4}$/;  
	    const busNumberRegex2 = /^[0-9]{1,3}SRI[0-9]{4}$/; 
	    const busNumberRegex3 = /^[0-9]{2,3}-[0-9]{4}$/; 
	    
	    
	    if (/sri|Sri/.test(busNumber)) {
	        busNumberError.textContent = "'SRI' must be in uppercase (e.g., 'SRI').";
	        busNumberError.style.color = "red";
	    } 
	    
	    else if (!busNumberRegex1.test(busNumber) && !busNumberRegex2.test(busNumber) && !busNumberRegex3.test(busNumber)) {
	        busNumberError.textContent = "Invalid Bus Number. Format: (AA1234, AAA1234, 1SRI1234, 12SRI1234, 123SRI1234, 12-1234, 123-1234)";
	        busNumberError.style.color = "red";
	    } 
	    
	    else {
	        busNumberError.textContent = "";  
	    }
	});

   
	   document.getElementById('seat_count').addEventListener('input', function () {
	    const seatCount = this.value;
	    const seatCountError = document.getElementById("seat_count_error");
	
	    
	    if (seatCount < 20 || seatCount > 80) {
	        seatCountError.textContent = "Seat count must be between 20 and 80.";
	        seatCountError.style.color = "red";
	    } else {
	        seatCountError.textContent = ""; 
	    }
	});

		document.getElementById('image').addEventListener('change', function () {
	    const imageFile = this.value;
	    const imageError = document.getElementById("image_error");
	    
	   
	    if (imageFile) {
	       
	        const fileExtension = imageFile.split('.').pop().toLowerCase();
	

	        if (fileExtension !== 'jpg') {
	            imageError.textContent = "Only JPG images are allowed.";
	            imageError.style.color = "red";
	        } else {
	            imageError.textContent = ""; 
	        }
	    } else {
	        imageError.textContent = "";  
	    }
	});


	</script>
	
	<script>
		
		document.getElementById("adult_seat_price").addEventListener("input", function() {
		    var adultPrice = this.value;
		    var adultPriceError = document.getElementById("adultPriceError");
		
		    if (adultPrice <= 0) {
		        adultPriceError.textContent = "Adult seat price must be greater than 0.";
		    } else {
		        adultPriceError.textContent = "";
		    }
		});
		
		
		document.getElementById("child_seat_price").addEventListener("input", function() {
		    var childPrice = this.value;
		    var childPriceError = document.getElementById("childPriceError");
		
		    if (childPrice <= 0) {
		        childPriceError.textContent = "Child seat price must be greater than 0.";
		    } else {
		        childPriceError.textContent = ""; 
		    }
		});
		</script>

</body>
</html>
