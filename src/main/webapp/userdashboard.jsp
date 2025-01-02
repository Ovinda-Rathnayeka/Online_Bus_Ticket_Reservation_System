<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile Dashboard</title>
    <!-- Google Fonts and Font Awesome for modern look and icons -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

    <style>
        /* General body styling with background image */
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            background: url('./images/StockCake-Evening\ Tram\ Approaching_1723874834.jpg') no-repeat center center fixed;
            background-size: cover;
            color: #333;
        }

        .dashboard-container {
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.3); /* Increased transparency */
            border-radius: 10px;
            max-width: 800px;
            margin: 40px auto;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
        }

        .profile-card {
            border-radius: 10px;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.6); /* Increased transparency */
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .profile-header h1 {
            font-size: 28px;
            color: #001f3f;
            margin-bottom: 20px;
        }

        .profile-info {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
        }

        .profile-info div {
            display: flex;
            align-items: center;
            font-size: 18px;
            margin: 10px 0;
            padding: 10px;
            width: 100%;
            border-bottom: 1px solid #ddd;
            color: #333;
        }

        .profile-info div i {
            color: #335577;
            margin-right: 10px;
            font-size: 20px;
        }

        .profile-info div strong {
            margin-right: 10px;
            color: #000;
        }

        .btn-home {
            display: inline-block;
            padding: 12px 25px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            font-size: 18px;
            transition: background-color 0.3s ease;
            margin-top: 20px;
        }

        .btn-home:hover {
            background-color: #0056b3;
        }

        @media (max-width: 768px) {
            .dashboard-container {
                width: 90%;
            }

            .profile-header h1 {
                font-size: 24px;
            }

            .profile-info div {
                font-size: 16px;
            }
        }
    </style>
</head>
<body>
    <div class="dashboard-container">
        <!-- Display user profile if usDetails is not empty -->
        <c:if test="${not empty usDetails}">
            <div class="profile-card">
                <div class="profile-header">
                    <h1>User Profile</h1>
                </div>
                <div class="profile-info">
                    <!-- Loop through each user in usDetails -->
                    <c:forEach var="us" items="${usDetails}">
                        <div><i class="fas fa-id-card"></i><strong>ID:</strong> ${us.id}</div>
                        <div><i class="fas fa-user"></i><strong>First Name:</strong> ${us.firstname}</div>
                        <div><i class="fas fa-user"></i><strong>Last Name:</strong> ${us.lastname}</div>
                        <div><i class="fas fa-address-card"></i><strong>NIC:</strong> ${us.nic}</div>
                        <div><i class="fas fa-birthday-cake"></i><strong>Birthday:</strong> ${us.birthday}</div>
                        <div><i class="fas fa-home"></i><strong>Address:</strong> ${us.address}</div>
                        <div><i class="fas fa-phone"></i><strong>Phone:</strong> ${us.phone}</div>
                        <div><i class="fas fa-envelope"></i><strong>Email:</strong> ${us.email}</div>
                        <div><i class="fas fa-lock"></i><strong>Password:</strong> *********</div>
                    </c:forEach>
                </div>
                <a href="sign-in.jsp" class="btn-home">HOME PAGE</a>
            </div>
        </c:if>

        <!-- Show error page if usDetails is empty -->
        <c:if test="${empty usDetails}">
            <div class="error-page">
                <div class="error-icon">:(</div>
                <h1>Details Not Found</h1>
                <p>The details you are looking for are not available. They might have been removed, or something went wrong.</p>
                <a href="sign-in.jsp" class="btn-home">HOME PAGE</a>
            </div>
        </c:if>
    </div>
</body>
</html>
