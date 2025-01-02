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
            padding: 20px;
        }
        .container {
            background: #fff;
            width: 100%;
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            border-radius: 8px;
        }
        fieldset {
            border: 2px solid #007BFF;
            padding: 10px;
            margin-top: 20px;
        }
        legend {
            padding: 0 10px;
            color: #fff;
            background-color: #007BFF;
            border-radius: 4px;
        }
        .form-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
        }
        .form-group {
            flex: 1;
            padding: 0 10px;
        }
        label {
            display: block;
            margin-bottom: 5px;
        }
        input[type="text"], input[type="email"], input[type="date"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .button-group {
            text-align: right;
            padding-top: 10px;
        }
        button {
		    padding: 8px 16px;
		    border: none;
		    background-color: #007BFF;
		    color: white;
		    cursor: pointer;
		    border-radius: 4px;
		    margin-left: 8px;
		    display: inline-block; /* Ensure it is displayed as a block */
		}
        button:hover {
            background-color: #0056b3;
        }

        /* Error message style */
        .error-page {
            text-align: center;
            margin-top: 100px;
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

    <!-- Using JSP comment instead of HTML comment -->
    <%-- If user details are not available --%>
    <c:choose>
        <c:when test="${empty usDetails}">
            <div class="error-page">
                <div class="error-icon">:(</div>
                <h1>Details Not Found</h1>
                <p>The details you are looking for are not available. They might have been removed, or something went wrong.</p>
                <a href="sign-in.jsp" class="btn-home">VSITI LOGIN</a>
            </div>
        </c:when>

        <%-- If user details are available --%>
        <c:otherwise>
            <c:forEach var="us" items="${usDetails}">
                <div class="container">
                    <h1>Update User Profile</h1>
                    <form action="UpdateUserServlet" method="POST">
                        <input type="hidden" name="id" value="${us.id}"/>
                        <!-- Personal information section -->
                        <fieldset>
                            <legend>Personal Information</legend>
                            <label for="firstname">First Name</label>
                            <input type="text" id="firstname" name="firstname" value="${us.firstname}" >
                            <label for="lastname">Last Name</label>
                            <input type="text" id="lastname" name="lastname" value="${us.lastname}">
                            <label for="nic">NIC</label>
                            <input type="text" id="nic" name="nic" value="${us.nic}" >
                            <label for="birthday">Birthday</label>
                            <input type="date" id="birthday" name="birthday" value="${us.birthday}" >
                            <label for="email">Email</label>
                            <input type="email" id="email" name="email" value="${us.email}">
                        </fieldset>
                        <!-- Contact information section -->
                        <fieldset>
                            <legend>Contact Information</legend>
                            <label for="phone">Phone</label>
                            <input type="text" id="phone" name="phone" value="${us.phone}" >
                            <label for="address">Address</label>
                            <input type="text" id="address" name="address" value="${us.address}" >
                        </fieldset>
                        <div class="button-group">
						    <button type="submit">Update</button>
						</div>
                  </form>
                  <form action="UserdeleteServlet" method="POST">
    				<button type="submit">Delete</button>
				</form>
            </c:forEach>
        </c:otherwise>
    </c:choose>
    <script>
		    function confirmDelete() {
		        if (confirm('Are you sure you want to delete this profile?')) {
		            
		            window.location.href = 'UserdeleteServlet'; 
		        }
		    }	
	</script>

   
</body>
</html>
