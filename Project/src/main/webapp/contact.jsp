<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
    <head>
        <meta charset="utf-8">
        <title>Bus-Home</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/after-login.css">
        <link rel="stylesheet" href="css/contact.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        
        
        <style>
            footer {
                text-align: center;
                padding: 20px;
                background: #0d4875;
                color: #fff;
                bottom: 0;
                width: 100%;
                }
        </style>

    </head>
    <body>
        <nav>
            <input type="checkbox" id="check">
            <label for="check" class="checkbtn">&#9776;</label>
            <label class="logo">Bus Journey</label>
            <ul class="links">
                <li><a href="busindex-after-login.jsp">Home</a></li>
                <li><a href="AddBus.jsp">Add Bus</a></li>
            	<li><a href="DisplayBusesServlet">Bus Details</a></li>
                <li><a href="about.jsp">About Us</a></li>
                <li><a class="active" href="contact.jsp">Contact Us</a></li>
                <li><a href="feedback.jsp">Feedback</a></li>
            </ul>
            
            <div class="profile-container">
                <div class="profile" onclick="toggleDropdown()">
                    <i class="fa fa-user-circle" aria-hidden="true"></i>
                </div>
            </div>
        </nav>

        <section class="contact">
            <div class="content">
                <h2>Contact Us</h2>
                <p>We'd love to hear from you! Whether you have questions, feedback, or need assistance, feel free to reach out. You can contact us via email or phone, and we’ll do our best to respond promptly. We are committed to providing you with the best support possible. Thank you for connecting with us!</p>
            </div>
            <div class="container">
                <div class="contactInfo">
                    <div class="box">
                        <div class="icon">
                            <i class="fa fa-map-marker" aria-hidden="true"></i>
                        </div>
                        <div class="text">
                            <h3>Address</h3>
                            <p>SE/OOP/2024/S2/MLB/WD/G148</p>
                        </div>
                    </div>
                    <div class="box">
                        <div class="icon">
                            <i class="fa fa-envelope" aria-hidden="true"></i>
                        </div>
                        <div class="text">
                            <h3>Email</h3>
                            <p>SE.OOP.2024.S2.MLB.WD.G148@gmail.com</p>
                        </div>
                    </div>
                    <div class="box">
                        <div class="icon">
                            <i class="fa fa-phone" aria-hidden="true"></i>
                        </div>
                        <div class="text">
                            <h3>Phone</h3>
                            <p>123-456-789</p>
                        </div>
                    </div>
                </div>
                <div class="contactForm">
                    <form action="" method="post">
                        <h2>Send Message</h2>
                        <div class="inputBox">
                            <input type="text" name="fullName" id="fullName" placeholder="Full Name" required>
                        </div>
                        <div class="inputBox">
                            <input type="email" name="email" id="email" placeholder="Email" required>
                        </div>
                        <div class="inputBox">
                            <textarea placeholder="Type your Message..." required></textarea>
                        </div>
                        <div class="inputBox">
                            <input type="submit" name="send" id="send" value="Send">
                        </div>
                    </form>
                </div>
            </div>
        </section>
        <footer>
            <p>&copy; 2024 Bus Journey. All rights reserved.</p>
        </footer>

       
    </body>
</html>