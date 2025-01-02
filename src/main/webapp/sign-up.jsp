<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="sign-up.css">
    <link rel="stylesheet" type="text/css" href="../../homepage/css/font.css">
    
    <title>Sign Up</title>
    
    <style>
        .error {
            color: red;
            font-size: 14px;
            margin-top: 5px;
        }
    </style>
    
</head>

<body>
    <div class="container" id="container">
        <div class="form-container sign-in">
            <form action="UserInsert" method="POST" onsubmit="return validateForm()">
                <h1>User Sign Up</h1>
                <span>Please fill the form to sign up as an Applicant</span>
                
                <input type="text" id="firstname" name="firstname" placeholder="First Name" required oninput="validateFirstName()">
                <span id="firstnameError" class="error"></span>
                
                <input type="text" id="lastname" name="lastname" placeholder="Last Name" required oninput="validateLastName()">
                <span id="lastnameError" class="error"></span>
                
                <input type="text" id="nic" name="nic" placeholder="NIC" required oninput="validateNIC()">
                <span id="nicError" class="error"></span>
                
                <input type="email" id="email" name="email" placeholder="Email" required oninput="validateEmail()">
                <span id="emailError" class="error"></span>
                
                <input type="password" id="password" name="password" placeholder="Password" required oninput="validatePassword()">
                <span id="passwordError" class="error"></span>
                
                <button type="submit" name="submit">Sign Up</button>
            </form>
        </div>
        <div class="toggle-container">
            <div class="toggle">
                <div class="toggle-panel toggle-right">
                    <h1>Hello!</h1>
                    <p>Welcome to "Bus Journey" Online Bus Ticket Reservation.<br>Book your ticket, embrace the adventure!</p>
                </div>
            </div>
        </div>
    </div>

    <script src="sign-up.js"></script>
    <script>
        function validateFirstName() {
            const firstName = document.getElementById('firstname').value;
            const errorElement = document.getElementById('firstnameError');
            errorElement.innerHTML = '';

            if (firstName.trim() === '') {
                errorElement.innerHTML = "First Name is required.";
            }
        }

        function validateLastName() {
            const lastName = document.getElementById('lastname').value;
            const errorElement = document.getElementById('lastnameError');
            errorElement.innerHTML = '';

            if (lastName.trim() === '') {
                errorElement.innerHTML = "Last Name is required.";
            }
        }

        function validateNIC() {
            const nic = document.getElementById('nic').value;
            const errorElement = document.getElementById('nicError');
            errorElement.innerHTML = '';

            const nicRegex = /^(?:\d{9}[vV]|\d{12})$/;
            if (!nicRegex.test(nic)) {
                errorElement.innerHTML = "NIC must be 9 digits followed by 'V' or 'v', or 12 digits.";
            }
        }

        function validateEmail() {
            const email = document.getElementById('email').value;
            const errorElement = document.getElementById('emailError');
            errorElement.innerHTML = '';

            const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
            if (!emailRegex.test(email)) {
                errorElement.innerHTML = "Email can only contain letters, numbers, '@', and '.'";
            }
        }

        function validatePassword() {
            const password = document.getElementById('password').value;
            const errorElement = document.getElementById('passwordError');
            errorElement.innerHTML = '';

            if (/\s/.test(password)) {
                errorElement.innerHTML = "Password cannot contain spaces.";
            }
        }

        function validateForm() {
            validateFirstName();
            validateLastName();
            validateNIC();
            validateEmail();
            validatePassword();

            // Check if there are any errors
            const errorElements = document.getElementsByClassName('error');
            for (let i = 0; i < errorElements.length; i++) {
                if (errorElements[i].innerHTML !== '') {
                    return false; // Prevent form submission if there are errors
                }
            }
            return true; // Allow form submission if no errors
        }
    </script>
</body>


</html>
