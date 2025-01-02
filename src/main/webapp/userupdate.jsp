<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update User Profile</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
        }

        /* Transparent Form Container */
        .container {
            background: rgba(255, 255, 255, 0.6); /* Transparent white background */
            width: 100%;
            max-width: 800px;
            margin: 40px auto;
            padding: 30px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            border-radius: 12px;
            backdrop-filter: blur(15px); /* Frosted glass effect */
        }

        h1 {
            color: #007BFF;
            text-align: center;
            margin-bottom: 20px;
        }

        fieldset {
            border: none;
            margin-bottom: 20px;
            padding: 0;
        }

        legend {
		    font-size: 18px;
		    color: #fff;
		    background: linear-gradient(45deg, #007BFF, #0056b3); /* Gradient effect */
		    padding: 10px 20px;
		    border-radius: 12px;
		    display: inline-block;
		    margin-bottom: 15px;
		    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1); /* Soft shadow */
		    text-transform: uppercase; /* Makes text uppercase */
		    letter-spacing: 1px; /* Slight space between letters */
		    font-weight: bold; /* Bolder text */
		}


        .form-group {
            margin-bottom: 15px;
        }

        label {
            display: block;
            font-size: 14px;
            margin-bottom: 5px;
        }

        input[type="text"], input[type="email"], input[type="date"] {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 16px;
            transition: border-color 0.3s ease;
        }

        input[type="text"]:focus, input[type="email"]:focus, input[type="date"]:focus {
            border-color: #007BFF;
            outline: none;
        }

        /* Button Styles */
       .button-group {
		    display: flex;
		    justify-content: space-between; /* Distribute buttons to left and right */
		    align-items: center; /* Vertically center the buttons */
		    gap: 10px; /* Add spacing between buttons */
		}
		
		button {
		    padding: 12px 24px;
		    font-size: 16px;
		    font-weight: 600;
		    color: white;
		    border: none;
		    border-radius: 8px;
		    cursor: pointer;
		    transition: all 0.3s ease;
		}
		.error-page h1, .error-page p {
		    color: white; /* Set font color to white */
		}
		.button-group {
		    display: flex;
		    justify-content: space-between; /* Adjust to space buttons evenly */
		    align-items: center; /* Center buttons vertically */
		    gap: 10px; /* Space between buttons */
		}

		
		/* Update Button (left-aligned) */
		.update-btn {
		    background: linear-gradient(45deg, #007BFF, #00BFFF); /* Gradient background */
		    box-shadow: 0 4px 10px rgba(0, 123, 255, 0.4);
		    margin-right: auto; /* Align button to the left */
		}
		
		.update-btn:hover {
		    background: linear-gradient(45deg, #0056b3, #008ccc);
		}
		
		/* Delete Button (right-aligned) */
		.delete-btn {
		    background-color: #ff4d4d;
		    box-shadow: 0 4px 10px rgba(255, 77, 77, 0.4);
		    margin-left: auto; /* Align button to the right */
		}
		
		.delete-btn:hover {
		    background-color: #d93636;
		}

        /* Responsive design for mobile */
        @media (max-width: 768px) {
            .container {
                padding: 20px;
            }
            .button-group {
                flex-direction: column; /* Stack buttons vertically on mobile */
            }
            .update-btn, .delete-btn {
                margin: 0;
                width: 100%; /* Full width for buttons on mobile */
            }
        }
    </style>

   
    
</head>
<body>

    <c:choose>
        <c:when test="${empty usDetails}">
            <div class="error-page">
                <div class="error-icon">:(</div>
                <h1>Details Not Found</h1>
                <p>The details you are looking for are not available. They might have been removed, or something went wrong.</p>
                <a href="sign-in.jsp" class="btn-home">VISIT LOGIN</a>
            </div>
        </c:when>

        <c:otherwise>
            <c:forEach var="us" items="${usDetails}">
                <div class="container">
                    <h1>Update User Profile</h1>
                    <!-- Update Form -->
                    <form action="UpdateUserServlet" method="POST">
                        <input type="hidden" name="id" value="${us.id}"/>
                        
                        <!-- Personal information section -->
                        <fieldset>
                            <legend>Personal Information</legend>
							<div class="form-group">
							    <label for="firstname">First Name</label>
							    <input type="text" id="firstname" name="firstname" value="${us.firstname}" required onchange="validateName('firstname', 'firstnameError')">
							    <span id="firstnameError" style="color: red;"></span>
							</div>
							
							<div class="form-group">
							    <label for="lastname">Last Name</label>
							    <input type="text" id="lastname" name="lastname" value="${us.lastname}" required onchange="validateName('lastname', 'lastnameError')">
							    <span id="lastnameError" style="color: red;"></span>
							</div>
							<div class="form-group">
							    <label for="nic">NIC</label>
							    <input type="text" id="nic" name="nic" value="${us.nic}" required readonly>
							</div>

                            <div class="form-group">
                                <label for="birthday">Birthday</label>
                                <input type="date" id="birthday" name="birthday" value="${us.birthday}" required>
                            </div>
                            
                        </fieldset>

                        <!-- Contact information section -->
                        <fieldset>
                            <legend>Contact Information</legend>
                            <div class="form-group">
                                <label for="email">Email</label>
                                <input type="email" id="email" name="email" value="${us.email}" required>
                            </div>
                            <div class="form-group">
							    <label for="phone">Phone</label>
							    <input type="text" id="phone" name="phone" maxlength="10" value="${us.phone}" required>
							    <span id="phoneError" style="color: red;"></span>
							</div>
                            <div class="form-group">
                                <label for="address">Address</label>
                                <input type="text" id="address" name="address" value="${us.address}" required>
                            </div>
                        </fieldset>

						<!-- Button Group for Update and Delete -->
						<div class="button-group" style="display: flex; justify-content: space-between; margin-top: 20px;">
						    <form action="UpdateUserServlet" method="POST" style="margin-right: 10px;"> <!-- Optional margin for spacing -->
						        <input type="hidden" name="id" value="${us.id}"/>
						        <button type="submit" class="update-btn">Update</button>
						    </form>
						
						    <form action="UserdeleteServlet" method="POST" onsubmit="return confirmDelete()">
						        <input type="hidden" name="id" value="${us.id}">
						        <button type="submit" class="delete-btn">Delete</button>
						    </form>
						</div>

                </div>
            </c:forEach>
        </c:otherwise>
    </c:choose>
    
<script>
        // Phone number validation
        var phoneInput = document.getElementById("phone");
        var phoneError = document.getElementById("phoneError");

        phoneInput.addEventListener("input", function() {
            var phone = this.value;

            // Allow only digits and enforce max length of 10
            if (phone.length > 10) {
                this.value = phone.slice(0, 10); // Limit to 10 digits
            }

            // Check if the input is valid
            if (!/^\d{0,10}$/.test(this.value)) {
                phoneError.textContent = "Phone number must contain only digits.";
            } else if (this.value.length === 10) {
                phoneError.textContent = ""; // Clear error if valid
            } else {
                phoneError.textContent = ""; // Clear error if empty
            }
        });

        // Confirmation dialog for deletion
        document.querySelector("form[action='UserdeleteServlet']").onsubmit = function() {
            return confirm('Are you sure you want to delete this profile? This action cannot be undone.');
        };
    });
</script>

   
</body>
</html>
