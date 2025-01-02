<%@ page import="com.addbus.bus" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="javax.servlet.http.HttpServletResponse" %>
<%@ page import="javax.servlet.ServletException" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Bus</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        .form-container {
            max-width: 600px;
            margin: auto;
            background-color: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        input[type="text"], input[type="number"], input[type="date"], input[type="time"], input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        #imagePreview {
            display: block;
            margin: 10px 0;
            max-width: 100%; /* Ensure the image does not exceed the form width */
            height: auto; /* Maintain aspect ratio */
        }
    </style>
</head>
<body>
    <h1>Edit Bus</h1>
    <div class="form-container">
        <form action="UpdateBusServlet" method="POST" enctype="multipart/form-data">
            <input type="hidden" name="busId" value="${bus.busId}" />
            <label for="busName">Bus Name:</label>
            <input type="text" id="busName" name="busName" value="${bus.busName}" required/>

            <label for="busNumber">Bus Number:</label>
            <input type="text" id="busNumber" name="busNumber" value="${bus.busNumber}" required/>

            <label for="seatCount">Seat Count:</label>
            <input type="number" id="seatCount" name="seatCount" value="${bus.seatCount}" required/>

            <label for="destinationFrom">From:</label>
            <input type="text" id="destinationFrom" name="destinationFrom" value="${bus.destinationFrom}" required/>

            <label for="destinationTo">To:</label>
            <input type="text" id="destinationTo" name="destinationTo" value="${bus.destinationTo}" required/>

            <label for="departureTime">Departure Time:</label>
            <input type="time" id="departureTime" name="departureTime" value="${bus.departureTime}" required/>

            <label for="departureDate">Departure Date:</label>
            <input type="date" id="departureDate" name="departureDate" value="${bus.departureDate}" required/>

            <label for="adultSeatPrice">Adult Price:</label>
            <input type="number" id="adultSeatPrice" name="adultSeatPrice" value="${bus.adultSeatPrice}" required step="0.01"/>

            <label for="childSeatPrice">Child Price:</label>
            <input type="number" id="childSeatPrice" name="childSeatPrice" value="${bus.childSeatPrice}" required step="0.01"/>

            <label for="note">Notes:</label>
            <input type="text" id="note" name="note" value="${bus.note}" />

            <label for="image">Image:</label>
            <input type="file" id="image" name="image" onchange="previewImage(event)"/>

            <img id="imagePreview" src="${bus.imageUrl}" alt="Image Preview" style="display: ${bus.imageUrl != null ? 'block' : 'none'};"/>

            <input type="submit" value="Update Bus"/>
        </form>
    </div>

    <script>
        function previewImage(event) {
            const file = event.target.files[0];
            const reader = new FileReader();
            reader.onload = function(e) {
                const imagePreview = document.getElementById('imagePreview');
                imagePreview.src = e.target.result;
                imagePreview.style.display = 'block'; // Show the image
            }
            if (file) {
                reader.readAsDataURL(file);
            } else {
                document.getElementById('imagePreview').style.display = 'none'; // Hide the image if no file selected
            }
        }
    </script>
</body>
</html>
