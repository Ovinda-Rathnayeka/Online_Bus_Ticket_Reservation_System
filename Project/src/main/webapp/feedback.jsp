<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
    <head>
        <meta charset="utf-8">
        <title>Bus-Home</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/after-login.css">
        <link rel="stylesheet" href="css/feedback.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        
        <style>
            footer {
                text-align: center;
                padding: 20px;
                background: #0d4875;
                color: #fff;
                bottom: 0;
                width: 100%;
                margin-top: auto; /* Push footer to the bottom */
            }
        </style>
    </head>
    <body>
        <nav>
            <input type="checkbox" id="check">
            <label for="check" class="checkbtn">&#9776;</label>
            <label class="logo">Bus Journey</label>
            <ul class="links">
                <li><a href="../after-login/index-after-login.html">Home</a></li>
                <li><a href="../BookingForm/booking.html">Book Tickets</a></li>
                <li><a href="about.jsp">About Us</a></li>
                <li><a href="contact.jsp">Contact Us</a></li>
                <li><a class="active" href="feedback.jsp">Feedback</a></li>
            </ul>
            <div class="profile-container">
                <div class="profile" onclick="toggleDropdown()">
                    <i class="fa fa-user-circle" aria-hidden="true"></i>
                </div>
            </div>
        </nav>
        
        <section class="feedback-section">
            <h2>Feedback Form</h2>
            <form action="#" method="post" class="feedback-form">
                <label for="name">Name</label>
                <input type="text" id="name" name="name" placeholder="Your name.." required>

                <label for="email">Email</label>
                <input type="email" id="email" name="email" placeholder="Your email.." required>

                <label for="feedback">Feedback</label>
                <textarea id="feedback" name="feedback" placeholder="Write your feedback here.." required></textarea>

                <input type="submit" value="Submit">
            </form>
        </section>

        <footer>
            <p>&copy; 2024 Bus Journey. All rights reserved.</p>
        </footer>

        <script src="../after-login/after-login.js"></script>
    </body>
</html>
