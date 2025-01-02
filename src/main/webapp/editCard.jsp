<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.payment.DBUtil, com.payment.CardDetails" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Card Details</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <style>
        * {
            box-sizing: border-box;
        }
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f8f8;
        }

        .container {
            width: 40%;
            margin: 50px auto;
            padding: 20px;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
            font-size: 24px;
        }

        label {
            font-weight: bold;
            margin-bottom: 10px;
            display: block;
            font-size: 14px;
            color: #333;
        }

        input[type="text"], input[type="file"], input[type="number"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            transition: border-color 0.3s;
        }

        input[type="text"]:focus, input[type="number"]:focus, input[type="file"]:focus {
            border-color: #0082e6;
            outline: none;
        }

        .card-input-container {
            position: relative;
            width: 100%;
        }

        .card-input-container .fa {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            font-size: 24px;
            color: #0082e6;
        }

        .btn-submit {
            background-color: #0082e6;
            color: white;
            padding: 12px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.3s;
            display: block;
            width: 100%;
        }

        .btn-submit:hover {
            background-color: #006bb3;
            transform: scale(1.05);
        }

        .error-message {
            color: red;
            display: none;
            font-size: 0.9em;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Edit Card Details</h2>

    <% 
        // Retrieve paymentId from the request parameter
        String paymentIdParam = request.getParameter("paymentId");
        
        if (paymentIdParam != null && !paymentIdParam.isEmpty()) {
            int paymentId = Integer.parseInt(paymentIdParam);
            CardDetails card = DBUtil.getCardById(paymentId);

            if (card != null) { // Check if card exists
    %>

    <!-- Edit Card Form -->
    <form action="CardUpdateServlet" method="POST">
        <input type="hidden" name="paymentId" value="<%= paymentId %>">

        <label for="cardNumber">Card Number:</label>
        <div class="card-input-container">
            <input type="text" id="cardNumber" name="cardNumber" value="<%= card.getCardNumber() %>" maxlength="19" required>
            <i class="fa" id="cardIcon"></i>
        </div>

        <label for="expiryDate">Expiry Date (MM/YY):</label>
        <input type="text" id="expiryDate" name="expiryDate" value="<%= card.getExpiryDate() %>" maxlength="5" required>

        <label for="cvc">CVC:</label>
        <input type="text" id="cvc" name="cvc" value="<%= card.getCvc() %>" maxlength="3" required>

        <label for="cardName">Card Holder Name:</label>
        <input type="text" id="cardName" name="cardName" value="<%= card.getCardHolderName() %>" required>

        <button type="submit" class="btn-submit">Update Card</button>
    </form>

    <% 
            } else {
                out.println("<p>Card not found for payment ID: " + paymentId + "</p>");
            }
        } else {
            out.println("<p>Invalid or missing payment ID.</p>");
        }
    %>
</div>

</body>
</html>