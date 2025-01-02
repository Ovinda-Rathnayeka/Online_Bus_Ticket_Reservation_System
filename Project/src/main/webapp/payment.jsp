<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <style>
	    * {
		    box-sizing: border-box; /* Apply border-box to all elements */
		}
	    
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
        }

        body {
            font-family: system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
        }
        .container {
            width: 50%;
            margin: 50px auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 10px;
            flex-grow: 1; /* Ensures this container grows to take available space */
        }
        .payment-option {
		    margin-bottom: 20px;
		    font-family: Arial, sans-serif;
		}
		
		.payment-option label {
		    font-weight: bold;
		    margin-bottom: 10px;
		    display: block;
		    color: #333; /* Darker text color for better visibility */
		}
		
		.custom-select {
		    position: relative;
		    width: 100%;
		    border-radius: 5px;
		    overflow: hidden;
		}
		
		.custom-select select {
		    width: 100%;
		    padding: 10px;
		    border: 1px solid #ccc; /* Light border */
		    border-radius: 5px; /* Rounded corners */
		    appearance: none; /* Remove default arrow */
		    background-color: #f9f9f9; /* Light background */
		    font-size: 16px; /* Font size */
		    color: #333; /* Text color */
		    transition: border 0.3s, box-shadow 0.3s; /* Smooth transition */
		}
		
		.custom-select select:focus {
		    border-color: #0082e6; /* Change border color on focus */
		    outline: none; /* Remove default outline */
		    box-shadow: 0 0 5px rgba(0, 130, 230, 0.5); /* Add glow effect */
		}
		
		.custom-select::after {
		    content: "▼"; /* Arrow down */
		    position: absolute;
		    right: 15px; /* Positioning the arrow */
		    top: 50%; /* Center vertically */
		    transform: translateY(-50%);
		    pointer-events: none; /* Prevent the arrow from blocking clicks */
		    color: #0082e6; /* Arrow color */
		}
		
		.bank-details {
		    display: flex;
		    flex-direction: column; /* Stack items vertically */
		}
		
		.detail-item {
		    display: flex; /* Use flexbox for alignment */
		    justify-content: space-between; /* Space out items */
		    padding: 5px 0; /* Add some padding */
		}
		
		strong {
		    text-align: left; /* Align the strong items to the left */
		    flex-basis: 40%; /* Give the label some width */
		}
		
		span {
		    text-align: right; /* Align the details to the right */
		    flex-basis: 60%; /* Allow the details to take up remaining space */
		}
				
        .payment-details, .upload-section {
            display: none;
            margin-top: 20px;
        }
        label {
            display: block;
            margin-bottom: 10px;
        }
        input[type="text"], input[type="number"], input[type="file"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 5px;
            border: 1px solid #ccc;
            outline: none; /* Removes the default outline */
        }

        input[type="text"]:focus, 
        input[type="number"]:focus, 
        input[type="file"]:focus {
            border: 1px solid #0082e6; /* Adds a blue border on focus */
            box-shadow: 0 0 3px rgba(0, 130, 230, 0.8); /* Blue glow effect */
            outline: none; /* Removes any default outline */
        }


        input[type="file"] {
            padding: 5px;
        }
        .note {
            font-size: 0.9em;
            color: red;
        }
        .btn-submit {
            padding: 10px 20px;
            background-color: #0082e6;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: transform 0.3s ease, background-color 0.3s ease;
        }

        .btn-submit:hover {
            transform: scale(1.05); /* Slightly increase size on hover */
            background-color: #006dc0; /* Optional: Change background color on hover */
        }

    </style>
</head>
<body>
    <div class="container">
        <h2>Complete Your Payment</h2>

        <div class="payment-option">
            <label for="paymentMethod">Select Payment Method:</label>
            <div class="custom-select">
                <select id="paymentMethod" onchange="displayPaymentDetails()" required>
                    <option value="">--Select--</option>
                    <option value="bankTransfer">Bank Transfer</option>
                    <option value="onlinePayment">Online Payment</option>
                </select>
            </div>
        </div>

        <!-- Bank Transfer Form -->
        <form id="bankForm" action="#" method="post" enctype="multipart/form-data" class="payment-details">
            <h3>Bank Transfer Details</h3>
            <div class="bank-details">
                <div class="detail-item">
                    <strong>Bank:</strong>
                    <span>ABC Bank</span>
                </div>
                <div class="detail-item">
                    <strong>Branch:</strong>
                    <span>XYZ Branch</span>
                </div>
                <div class="detail-item">
                    <strong>Account Number:</strong>
                    <span>1234567890</span>
                </div>
                <div class="detail-item">
                    <strong>Account Holder Name:</strong>
                    <span>Bus Journey</span>
                </div>
                <div class="detail-item">
                    <strong>Reference Number:</strong>
                    <span id="referenceNumber"></span>
                </div>
            </div>

            <div class="upload-section">
                <label for="receipt">Upload Payment Receipt :</label>
                <p class="note">*Only JPG format is allowed for the receipt.</p>
                <input type="file" id="receipt" name="receipt" accept=".jpg" required>
            </div>

            <button type="submit" class="btn-submit">Submit Bank Transfer</button>
        </form>

        <!-- Online Payment Form -->
        <form id="cardForm" action="#" method="post" class="payment-details" onsubmit="return validateForm()">
		    <h3>Online Payment Details</h3>
		
		    <label for="cardNumber">Card Number:</label>
		    <input type="text" id="cardNumber" name="cardNumber" placeholder="XXXX XXXX XXXX XXXX" required>
		    <span class="error-message" id="cardNumberError" style="color: red; display: none;"></span>

		
		    <label for="expiryDate">Expiry Date:</label>
		    <input type="text" id="expiryDate" name="expiryDate" placeholder="MM/YY" required>
		    <span class="error-message" id="expiryDateError" style="color: red; display: none;"></span>
		
		    <label for="cvc">CVC:</label>
		    <input type="text" id="cvc" name="cvc" placeholder="Enter CVC" required>
		    <span class="error-message" id="cvcError" style="color: red; display: none;"></span>
		
		    <label for="cardName">Card Holder Name:</label>
		    <input type="text" id="cardName" name="cardName" placeholder="Enter your name" required>
		
		    <button type="submit" class="btn-submit">Submit Online Payment</button>
		</form>

    </div>

    <script>
        function displayPaymentDetails() {
            const paymentMethod = document.getElementById('paymentMethod').value;
            const bankForm = document.getElementById('bankForm');
            const cardForm = document.getElementById('cardForm');
            const uploadSection = document.querySelector('.upload-section');
            const referenceNumberSpan = document.getElementById('referenceNumber');

            // Hide both forms by default
            bankForm.style.display = 'none';
            cardForm.style.display = 'none';

            if (paymentMethod === 'bankTransfer') {
                bankForm.style.display = 'block';  // Show bank transfer form
                uploadSection.style.display = 'block';  // Show upload receipt section

                // Generate a random reference number for the payment
                const referenceNumber = Math.floor(100000 + Math.random() * 900000);
                referenceNumberSpan.textContent = referenceNumber;
            } else if (paymentMethod === 'onlinePayment') {
                cardForm.style.display = 'block';  // Show card form
            }
        }
    </script>
    
    <!-- JavaScript for Validations -->
	<script>
	    function validateForm() {
	        // Clear previous error messages
	        const errors = document.querySelectorAll('.error-message');
	        errors.forEach(error => error.style.display = 'none');
	
	        let isValid = true;
	
	        // Validate Card Number
	        const cardNumberInput = document.getElementById('cardNumber').value.replace(/\s/g, ''); // Remove spaces for validation
	        const cardNumberPattern = /^\d{16}$/; // Exactly 16 digits
	        if (!cardNumberPattern.test(cardNumberInput)) {
	            document.getElementById('cardNumberError').textContent = 'Card number must be exactly 16 digits without any separators.';
	            document.getElementById('cardNumberError').style.display = 'block';
	            isValid = false;
	        } else {
	            // Format the card number into 4 sets of 4 digits
	            const formattedCardNumber = cardNumberInput.replace(/(\d{4})(?=\d)/g, '$1 ');
	            document.getElementById('cardNumber').value = formattedCardNumber; // Update the input field with formatted number
	        }
	
	        // Validate Expiry Date
	        const expiryDate = document.getElementById('expiryDate').value;
	        const currentYear = new Date().getFullYear() % 100; // Get last two digits of the current year
	        const expiryPattern = /^(0[1-9]|1[0-2])\/([0-9]{2})$/; // Format: MM/YY
	        const [month, year] = expiryDate.split('/');
	        if (!expiryPattern.test(expiryDate) || (parseInt(year) < currentYear)) {
	            document.getElementById('expiryDateError').textContent = 'Expiry date must be in MM/YY format and year must not be less than the current year.';
	            document.getElementById('expiryDateError').style.display = 'block';
	            isValid = false;
	        }
	
	        // Validate CVC
	        const cvc = document.getElementById('cvc').value;
	        const cvcPattern = /^\d{3}$/; // CVC must be 3 digits
	        if (!cvcPattern.test(cvc)) {
	            document.getElementById('cvcError').textContent = 'CVC must be exactly 3 digits.';
	            document.getElementById('cvcError').style.display = 'block';
	            isValid = false;
	        }
	
	        return isValid; // Return true if all validations pass, false otherwise
	    }
	
	    // Real-time validation
	    document.getElementById('cardNumber').addEventListener('input', function () {
	        const cardNumberInput = this.value.replace(/\s/g, ''); // Remove spaces for validation
	        const cardNumberPattern = /^\d{16}$/; // Exactly 16 digits
	        const errorMessage = document.getElementById('cardNumberError');
	
	        if (cardNumberPattern.test(cardNumberInput)) {
	            errorMessage.style.display = 'none'; // Hide error message if valid
	        } else {
	            errorMessage.style.display = 'block'; // Show error message if invalid
	            errorMessage.textContent = 'Card number must be exactly 16 digits without any separators.';
	        }
	    });
	
	    document.getElementById('expiryDate').addEventListener('input', function () {
	        const expiryDate = this.value;
	        const currentYear = new Date().getFullYear() % 100;
	        const expiryPattern = /^(0[1-9]|1[0-2])\/([0-9]{2})$/; // Format: MM/YY
	        const errorMessage = document.getElementById('expiryDateError');
	
	        if (expiryPattern.test(expiryDate) && parseInt(expiryDate.split('/')[1]) >= currentYear) {
	            errorMessage.style.display = 'none'; // Hide error message if valid
	        } else {
	            errorMessage.style.display = 'block'; // Show error message if invalid
	            errorMessage.textContent = 'Expiry date must be in MM/YY format and year must not be less than the current year.';
	        }
	    });
	
	    document.getElementById('cvc').addEventListener('input', function () {
	        const cvc = this.value;
	        const cvcPattern = /^\d{3}$/; // CVC must be 3 digits
	        const errorMessage = document.getElementById('cvcError');
	
	        if (cvcPattern.test(cvc)) {
	            errorMessage.style.display = 'none'; // Hide error message if valid
	        } else {
	            errorMessage.style.display = 'block'; // Show error message if invalid
	            errorMessage.textContent = 'CVC must be exactly 3 digits.';
	        }
	    });
	</script>
    
</body>
</html>
