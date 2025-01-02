<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: white;
            margin: 0;
            padding: 0;
            color: #000;
        }

        .dashboard-container {
            padding: 20px;
            width: 100%;
        }

        .profile-card {
            border: 2px solid #007BFF;
            border-radius: 10px;
            padding: 20px;
            background-color: white;
            max-width: 600px;
            margin: 0 auto;
        }

        .profile-header {
            margin-bottom: 20px;
            text-align: left;
        }

        .profile-header h1 {
            font-size: 24px;
            color: #007BFF;
        }

        .profile-info p {
            font-size: 18px;
            margin: 10px 0;
            padding: 10px;
            border-bottom: 1px solid #007BFF;
            text-align: left;
            color: #000;
        }

        .profile-info strong {
            color: #007BFF;
        }

        /* Error message style */
        .error-page {
            text-align: center;
            margin-top: 100px;
            padding: 20px;
            border: 2px solid #00bfff;
            border-radius: 10px;
            background-color: #f0f0f0;
            max-width: 600px;
            margin: 20px auto;
        }

        .error-page .error-icon {
            font-size: 100px;
            color: #00bfff;
        }

        .error-page h1 {
            font-size: 48px;
            color: #333;
            margin: 20px 0;
        }

        .error-page p {
            font-size: 18px;
            color: #666;
            margin-bottom: 30px;
        }

        .error-page .btn-home {
            padding: 10px 20px;
            font-size: 18px;
            background-color: #00bfff;
            color: white;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            cursor: pointer;
        }

        .error-page .btn-home:hover {
            background-color: #008ccc;
        }
    </style>
</head>
<body>
	 <script>
	    fetch('nav/nav.html')
	        .then(response => response.text())
	        .then(data => {
	        document.getElementById('navbar').innerHTML = data;
	        });
	 </script>
    <div class="dashboard-container">
        <!-- Loop through cusDetails and display customer information dynamically -->
        <c:if test="${not empty usDetails}">
            <div class="profile-card">
                <div class="profile-header">
                    <h1>User Profile</h1>
                </div>
                <c:forEach var="us" items="${usDetails}">
                    <div class="profile-info">
                        <p><strong>ID:</strong> ${us.id}</p>
                        <p><strong>First Name:</strong> ${us.firstname}</p>
                        <p><strong>Last Name:</strong> ${us.lastname}</p>
                        <p><strong>NIC:</strong> ${us.nic}</p>
                        <p><strong>Birthday:</strong> ${us.birthday}</p>
                        <p><strong>Address:</strong> ${us.address}</p>
                        <p><strong>Phone:</strong> ${us.phone}</p>
                        <p><strong>Email:</strong> ${us.email}</p>
                        <p><strong>Password:</strong> *********</p>
                    </div>
                </c:forEach>
            </div>
        </c:if>

        <!-- Error message if no user details are available -->
        <c:if test="${empty usDetails}">
		    <div class="error-page">
		        <div class="error-icon">:(</div>
		        <h1>Details Not Found</h1>
		        <p>The details you are looking for are not available. They might have been removed, or something went wrong.</p>
		        <a href="sign-ins.jsp" class="btn-home">HOME PAGE</a>
		    </div>
		</c:if>	
    </div>    
</body>
</html>
