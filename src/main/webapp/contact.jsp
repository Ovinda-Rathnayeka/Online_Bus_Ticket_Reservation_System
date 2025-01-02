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
			html, body {
			    height: 100%;
			    margin: 0;
			    display: flex;
			    flex-direction: column;
			}
			
			section {
			    flex-grow: 1; /* This makes sure the content section takes the available space */
			}
			
			footer {
			    text-align: center;
			    padding: 20px;
			    background: #0d4875;
			    color: #fff;
			    width: 100%;
			    margin-top: auto; /* Ensures the footer sticks to the bottom */
			}

        </style>

    </head>
    <body>

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
       

       
    </body>
</html>