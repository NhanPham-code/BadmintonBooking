<%-- 
    Document   : BookingDetail
    Created on : Jun 7, 2024, 9:45:00 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Badminton Stadium Booking System</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            body {
                font-family: 'Inter', sans-serif;
                background-color: #bfdbf7;
                margin: 0;
                padding: 0;
                background-image: url('<%=request.getContextPath()%>/img/background/bg3.jpg');

            }

            .header, .footer {
                width: 100%;
                background: #022B3A;
                color: white;
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 10px 20px;
                box-sizing: border-box;
            }

            .header .logo {
                display: flex;
                align-items: center;
            }

            .header .logo img {
                margin-right: 10px;
            }

            .header .auth-links {
                display: flex;
                gap: 10px;
            }

            .header .auth-links a {
                background: none;
                border: none;
                color: white;
                padding: 10px 20px;
                border-radius: 4px;
                text-decoration: none;
                cursor: pointer;
            }

            .header .auth-links a:hover {
                background: #145569;
            }

            .nav {
                width: 100%;
                background: #1F7A8C;
                display: flex;
                justify-content: space-around;
                align-items: center;
                color: white;
                padding: 10px 0;
            }

            .nav a {
                background: transparent;
                border: none;
                color: white;
                font-size: 18px;
                text-decoration: none;
                cursor: pointer;
                padding: 10px 20px;
            }

            .nav a:hover {
                background: #145569;
                border-radius: 4px;
            }

            .container {
                display: flex;
                flex-direction: column;
                max-width: 1300px;
                margin: auto;
                background-color: #f5f5f5;
                color: black;
                border-radius: 5px;
                margin-top: 20px;
                margin-bottom: 20px;

            }

            .top-container {
                text-align: center;
                background-color: #f5f5f5;
                color: black;
                border-radius: 5px;

            }

            .top-container img {
                margin-top: 20px;
                width: 80%;
                height:300px;
                border-radius: 5px;
            }

            .flex-container {
                display: flex;
                justify-content: space-between;
                padding: 0px 20px;
                background-color: #f5f5f5;
                color: black;
                border-radius: 5px;
                margin-top: 20px;
            }

            .left-container, .right-container {
                flex: 1;
                margin-right: 20px;

            }

            .right-container {
                margin-right: 0;
            }

            .table-container{
                background-color: #022B3A;
                padding: 20px;
                border-radius: 5px;
                margin-bottom: 20px;
                height: 530px;
            }

            .feedback-form {

                padding: 20px;
                border-radius: 5px;
                margin-bottom: 20px;
                background-color:#022B3A;
            }

            .feedback-container {
                height: 205px; /* Set a max height for scrollbar to appear */
                overflow-y: auto; /* Enable vertical scrollbar */
                border: 1px solid #ccc;
                padding: 10px;
                border-radius: 5px;
                background-color: #022B3A;
                overflow-y: scroll;
                display: block;
            }
            .table-container table {
                width: 100%;
                border-collapse: collapse;
                max-height: 200px;
                border-radius: 5px;
            }

            .table-container th{
                border: 2px solid #000;
                padding: 8px;
                text-align: center;
                background-color: #1F7A8C;
            }
            .table-container td {
                border: 2px solid #000;
                padding: 8px;
                text-align: center;
                background-color: #ffffff;
            }

            .stadium-info{
                display:flex;
            }
            .stadium-info img{
                margin-right: 40px;
                margin-left: 40px;
                width: 200px;
                height: 200px;
                background-color: #ccc;
                display: block;
                margin-bottom: 20px;
            }


            .feedback-item {
                display: flex;
                align-items: center;
                background: #fff;
                margin-bottom: 10px;
                padding: 10px;
                border-radius: 5px;
            }

            .feedback-item i {
                font-size: 50px;
                margin-right: 10px;
            }

            .feedback-content {
                flex-grow: 2;
            }

            .feedback-rating {
                font-size: 14px;
            }

            .feedback-name {
                font-size: 16px;
                font-weight: bold;
                margin-bottom: 5px;
            }

            .feedback-description {
                margin-bottom: 5px;
            }

            .feedback-form {
                padding: 20px;
                background-color: #f9f9f9;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            .feedback-form .form-group {
                margin-bottom: 15px;
            }

            .feedback-form label {
                display: block;
                font-weight: bold;
                margin-bottom: 5px;
            }

            .feedback-form textarea, .feedback-form select {
                width: 94%;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }

            .feedback-form button {
                display: block;
                width: 100%;
                padding: 10px;
                background-color: #1F7A8C;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                margin-top: 10px;
            }

            .feedback-form button:hover {
                background-color: #145569;
            }

            .filter-container {
                display: flex;
                align-items: center;
                margin-left: 55%;
            }

            .filter-button {
                padding: 5px 10px;
                font-size: 14px;
                border: 1px solid #ccc;
                border-radius: 5px;
                cursor: pointer;
                background-color: #f0f0f0;
                outline: none;
                margin-left: 10px;
            }

            .filter-dropdown select {
                padding: 5px;
                font-size: 14px;
                border: 1px solid #ccc;
                border-radius: 5px;
                cursor: pointer;
                margin-left: 5px;
            }

            .booking-btn {
                display: block;
                width: 200px;
                padding: 10px;
                background-color: #1F7A8C;
                color: white;
                text-align: center;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                margin: 20px auto;
            }

            .booking-btn:hover {
                background-color: #145569;
            }
            .rating {
                display: flex;
                align-items: center;
            }
            .rating .fa-star {
                font-size: 20px;
                color: gold;
                margin-left: 5px;

            }
            .footer {
                background: #022B3A;
                color: white;
                display: flex;
                justify-content: center;
                align-items: center;
                padding: 10px;
                box-sizing: border-box;
            }
        </style>
    </head>
    <body>
        <div class="header">
            <div class="logo">
                <img src="<%=request.getContextPath()%>/img/logo/logo.png" alt="Logo" width="40px" height="40px">
                <span>Badminton Stadium Booking</span>
            </div>
            <div class="auth-links">
                <a href="<%=request.getContextPath()%>/view/common/login.jsp">Login</a>
                <a href="<%=request.getContextPath()%>/view/common/register.jsp">Register</a>
            </div>
        </div>

        <div class="nav">
            <a href="stadiumList">STADIUM LIST</a>
            <a href="<%=request.getContextPath()%>/Popular">POPULAR</a>
        </div>

        <div class="container">
            <div class="top-container">
                <c:set var="st" value="${requestScope.stadium}"></c:set>

                    <img src="${st.stadium_image}" alt="Picture">

            </div>
            <div class="flex-container">
                <div class="left-container">

                    <div class="table-container">
                        <h1 style="text-align: center;color: white;">${st.stadium_name}</h1>

                        <div class="stadium-info"> 
                            <img src="${st.QRcode}" alt="Stadium Background">
                            <div>
                                <p style="margin-top: 60px; color: white;">Address: ${st.stadium_address}</p>
                                <p style="color: white;">Phone Number: ${st.stadium_phone}</p>
                                <p style="color: white;">Price per hour: ${st.pricePerHour}</p>
                            </div>
                        </div>
                        <h2 style="color: white;margin-top: 30px;">Court List</h2>
                        <table>

                            <thead>
                                <tr>
                                    <th style="color: white;">Court Number</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="c" items="${requestScope.courtList}">
                                    <tr>
                                        <td>${c.number}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="right-container">
                    <div class="feedback-container">
                        <div style="display: flex;">
                            <h2 style="color: white;">Feedback</h2>
                            <form class="filter-container" action="feedbackFilter" method="GET">

                                <div class="filter-dropdown">
                                    <select id="rating-filter" name = "rating">
                                        <option value="all">All</option>
                                        <option value="5">5 stars</option>
                                        <option value="4">4 stars</option>
                                        <option value="3">3 stars</option>
                                        <option value="2">2 stars</option>
                                        <option value="1">1 star</option>
                                    </select>
                                </div>
                                <input type="hidden" id="stadiumID" name="stadiumID" value=${st.stadium_ID}>
                                <button id="filter-button" type="submit" class="filter-button">Filter</button>
                            </form>
                        </div>
                        <div class="feedback-list">
                            <c:forEach var="fb" items="${requestScope.feedbackList}">
                                <div class="feedback-item" data-rating="${fb.ratingScore}">
                                    <i class="fas fa-user-circle"></i>
                                    <div class="feedback-content">
                                        <p class="feedback-name">${fb.customer.customer_Name}</p>
                                        <p class="feedback-description">${fb.description}</p>
                                        <div class="rating">                        
                                            <p class="feedback-rating">Rating Score: ${fb.ratingScore}</p>
                                            <i class="fas fa-star"></i>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>

                    <div class="feedback-form">
                        <h2>Leave Feedback</h2>
                        <form id="feedback-form" action="feedback" method="post">
                            <div class="form-group">
                                <label for="feedback-description">Description:</label>
                                <textarea id="feedback-description" name="feedback-description" rows="4" required></textarea>
                            </div>
                            <div class="form-group">
                                <label for="rating">Rating:</label>
                                <select id="rating" name="rating" required>
                                    <option value="">Choose a rating</option>
                                    <option value="1">1 - Very Poor</option>
                                    <option value="2">2 - Poor</option>
                                    <option value="3">3 - Average</option>
                                    <option value="4">4 - Good</option>
                                    <option value="5">5 - Excellent</option>
                                </select>
                            </div>
                            <button type="submit">Submit Feedback</button>
                        </form>
                    </div>


                </div>

            </div>
            <a class="booking-btn" href="<%=request.getContextPath()%>/view/common/login.jsp">Book Now</a>
        </div>

        <div class="footer">
            <p>&copy; 2024 Badminton Stadium Booking System. All rights reserved.</p>
        </div>
    </body>
</html>

