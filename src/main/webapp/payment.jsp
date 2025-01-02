<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.payment.DBUtil, com.payment.CardDetails" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Complete Your Payment</title>
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
            transition: filter 0.3s ease-in-out;
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

        .payment-option label {
            font-weight: bold;
            display: block;
            margin-bottom: 10px;
            font-size: 16px;
        }

        .payment-option select {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 5px;
            font-size: 16px;
            border: 1px solid #ccc;
        }

        /* Popup Styles */
        #paymentPopup {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.7);
            z-index: 1000;
            justify-content: center;
            align-items: center;
        }

        #popupContent {
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            width: 300px;
            text-align: center;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
        }

        .popup-button {
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            margin: 10px;
            transition: transform 0.2s;
        }

        .confirm-btn {
            background-color: blue;
            color: white;
            border: none;
        }

        .confirm-btn:hover {
            background-color: #0046d1;
            transform: scale(1.05);
        }

        .cancel-btn {
            background-color: red;
            color: white;
            border: none;
        }

        .cancel-btn:hover {
            background-color: #c30000;
            transform: scale(1.05);
        }

        .blurred {
            filter: blur(5px);
        }
    </style>
</head>
<body>

    <div class="container" id="mainContent">
        <h2>Complete Your Payment</h2>

        <div class="payment-option">
            <label for="paymentMethod">Select Payment Method:</label>
            <select id="paymentMethod" onchange="displayPaymentDetails()">
                <option value="">--Select--</option>
                <option value="bankTransfer">Bank Transfer</option>
                <option value="onlinePayment">Online Payment</option>
            </select>
        </div>

        <!-- Bank Transfer Form -->
        <form id="bankForm" style="display:none;">
            <h3>Bank Transfer Details</h3>
            <div class="bank-details">
                <div><strong>Bank:</strong> ABC Bank</div>
                <div><strong>Branch:</strong> XYZ Branch</div>
                <div><strong>Account Number:</strong> 1234567890</div>
                <div><strong>Account Holder Name:</strong> John Doe</div>
                <div><strong>Reference Number:</strong> <span id="referenceNumber"></span></div>
            </div>
            <label for="receipt">Upload Payment Receipt:</label>
            <input type="file" id="receipt" name="receipt" accept=".jpg" required>
            <button type="submit" class="btn-submit" onclick="showConfirmPopup(event)">Submit Bank Transfer</button>
        </form>

        <!-- Online Payment Form -->
        <form id="cardForm" action="CardInsertServlet" method="POST" style="display:none;" onsubmit="return validateForm()">
            <h3>Online Payment Details</h3>

            <!-- Hidden Fields for ticketId and userId -->
            <input type="hidden" name="ticketId" value="12">
            <input type="hidden" name="userId" value="<%= session.getAttribute("userid") %>">

            <label for="cardNumber">Card Number:</label>
            <div class="card-input-container">
                <input type="text" id="cardNumber" name="cardNumber" placeholder="XXXX XXXX XXXX XXXX" maxlength="19" required oninput="formatCardNumber()">
                <i class="fa" id="cardIcon"></i>
            </div>
            <span class="error-message" id="cardNumberError"></span>

            <label for="expiryDate">Expiry Date:</label>
            <input type="text" id="expiryDate" name="expiryDate" placeholder="MM/YY" maxlength="5" required>
            <span class="error-message" id="expiryDateError"></span>

            <label for="cvc">CVC:</label>
            <input type="text" id="cvc" name="cvc" placeholder="Enter CVC" maxlength="3" required>
            <span class="error-message" id="cvcError"></span>

            <label for="cardName">Card Holder Name:</label>
            <input type="text" id="cardName" name="cardName" placeholder="Enter your name" required>

            <button type="submit" class="btn-submit" onclick="showConfirmPopup(event)">Submit Online Payment</button>
        </form>
    </div>

    <!-- Confirmation Popup -->
    <div id="paymentPopup">
        <div id="popupContent">
            <h3>Confirm Payment</h3>
            <p>Are you sure you want to proceed with the payment?</p>
            <button type="button" class="popup-button confirm-btn" onclick="confirmPayment()">Confirm</button>
            <button type="button" class="popup-button cancel-btn" onclick="closePopup()">Cancel</button>
        </div>
    </div>

    <script>
        function displayPaymentDetails() {
            const paymentMethod = document.getElementById('paymentMethod').value;
            document.getElementById('bankForm').style.display = paymentMethod === 'bankTransfer' ? 'block' : 'none';
            document.getElementById('cardForm').style.display = paymentMethod === 'onlinePayment' ? 'block' : 'none';
        }

        function formatCardNumber() {
            const cardNumberInput = document.getElementById('cardNumber');
            let value = cardNumberInput.value.replace(/\D/g, '').match(/.{1,4}/g);
            cardNumberInput.value = value ? value.join(' ') : '';
            document.getElementById('cardIcon').className = getCardType(cardNumberInput.value) || '';
        }

        function getCardType(cardNumber) {
            const cardTypes = {
                visa: /^4[0-9]{12}(?:[0-9]{3})?$/,
                mastercard: /^5[1-5][0-9]{14}$/,
                amex: /^3[47][0-9]{13}$/,
                discover: /^6(?:011|5[0-9]{2})[0-9]{12}$/,
                jcb: /^(?:2131|1800|35\d{3})\d{11}$/
            };

            for (const [key, regex] of Object.entries(cardTypes)) {
                if (regex.test(cardNumber)) {
                    return key === 'visa' ? 'fa fa-cc-visa' : `fa fa-cc-${key}`;
                }
            }
            return '';
        }

        function showConfirmPopup(event) {
            event.preventDefault(); // Prevent the form from submitting immediately
            const mainContent = document.getElementById('mainContent');
            mainContent.classList.add('blurred'); // Apply blur effect to the background
            document.getElementById('paymentPopup').style.display = 'flex'; // Show popup
        }

        function closePopup() {
            document.getElementById('paymentPopup').style.display = 'none'; // Hide popup
            const mainContent = document.getElementById('mainContent');
            mainContent.classList.remove('blurred'); // Remove blur effect from the background
        }

        function confirmPayment() {
            const bankForm = document.getElementById('bankForm');
            const cardForm = document.getElementById('cardForm');

            if (bankForm.style.display === 'block') {
                bankForm.submit(); // Submit bank transfer form
            } else if (cardForm.style.display === 'block') {
                cardForm.submit(); // Submit online payment form
            }
        }

        function validateForm() {
            // Form validation logic here
            return true; // Change this based on your validation
        }
    </script>

</body>
</html>









