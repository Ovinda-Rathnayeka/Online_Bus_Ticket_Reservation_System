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
        

    </head>
    <body>

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

    </body>
</html>
