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
			
			    <input type="text" id="firstname" name="firstname" placeholder="First" required>
			    <div id="firstnameError" class="error"></div>
			
			    <input type="text" id="lastname" name="lastname" placeholder="Last Name" required>
			    <div id="lastnameError" class="error"></div>
			
			    <input type="text" id="nic" name="nic" placeholder="NIC" required>
			    <div id="nicError" class="error"></div>
			
			    <input type="email" id="email" name="email" placeholder="Email" required>
			    <div id="emailError" class="error"></div>
			
			    <input type="password" id="password" name="password" placeholder="Password" required>
			    <div id="passwordError" class="error"></div>
			
			    <button type="submit" name="submit">Sign Up</button>
			</form>
        </div>
        <div class="toggle-container">
            <div class="toggle">
                
                <div class="toggle-panel toggle-right">
                    <h1>Hello!</h1>
                    <p>Welcome to "Bus Journey" Online Bus Ticket Reservation.<br>Book your ticket, embrace the adventure!"</p>
                    
                </div>
            </div>
        </div>
    </div>

    <script src="sign-up.js"></script>
    <script>
		function validateForm() {
		    // Clear previous error messages
		    document.getElementById('nicError').innerHTML = '';
		    document.getElementById('emailError').innerHTML = '';
		    document.getElementById('passwordError').innerHTML = '';
		
		    let isValid = true;
		
		    // Validate NIC (9 digits + v/V OR 12 digits)
		    const nic = document.getElementById('nic').value;
		    const nicRegex = /^(?:\d{9}[vV]|\d{12})$/;
		    if (!nicRegex.test(nic)) {
		        document.getElementById('nicError').innerHTML = "NIC must be 9 digits followed by 'v' or 'V', or 12 digits.";
		        isValid = false;
		    }
		
		    // Validate Email contains '@'
		    const email = document.getElementById('email').value;
		    if (!email.includes('@')) {
		        document.getElementById('emailError').innerHTML = "Email must contain '@'.";
		        isValid = false;
		    }
		
		    // Validate Password (no spaces)
		    const password = document.getElementById('password').value;
		    if (/\s/.test(password)) {
		        document.getElementById('passwordError').innerHTML = "Password cannot contain spaces.";
		        isValid = false;
		    }
		
		    return isValid;
		}
		</script>
</body>

</html>