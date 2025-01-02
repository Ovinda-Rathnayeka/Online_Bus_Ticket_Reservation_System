<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/after-login.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    
 </head>
 <body>
 	<nav>
        <input type="checkbox" id="check">
        <label for="check" class="checkbtn">&#9776;</label>
        <label class="logo">Bus Journey</label>
        <ul class="links">
            <li><a class="active"  href="busindex-after-login.jsp">Home</a></li>
            <li><a href="AddBus.jsp">Add Bus</a></li>
            <li><a href="DisplayBusesServlet">Manage Bus</a></li>
            <li><a href="about.jsp">About Us</a></li>
            <li><a href="contact.jsp">Contact Us</a></li>
            <li><a href="feedback.jsp">Feedback</a></li>
        </ul>
        
        <div class="profile-container">
            <a href="index.jsp" class="profile">
                <i class="fas fa-sign-out-alt" aria-hidden="true"></i>
            </a>
        </div>
        
    </nav>
 
 </body>