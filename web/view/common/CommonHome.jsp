<%-- 
    Document   : CommonHome
    Created on : Jun 11, 2024, 11:04:46 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer HomePage</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <style>
            body {
                margin: 0;
                font-family: 'Inter', sans-serif;
                background: white;
                display: flex;
                flex-direction: column;
                min-height: 100vh;
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
            .header .search-bar {
                flex-grow: 1;
                margin: 0 20px;
                display: flex;
                align-items: center;
                background: #D9D9D9;
                border-radius: 4px;
                padding: 5px 10px;
            }
            .header .search-bar input {
                border: none;
                background: transparent;
                flex-grow: 1;
                padding: 5px;
            }
            .header .search-bar button {
                background: #1F7A8C;
                border: none;
                color: white;
                padding: 5px 10px;
                border-radius: 4px;
                cursor: pointer;
                display: flex;
                align-items: center;
                justify-content: center;
            }
            .header .search-bar button:hover {
                background: #145569;
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
            .banner {
                width: 100%;
                height: 149px;
                background: url('<%=request.getContextPath()%>/img/background/bg1.jpg') no-repeat center center;
                background-size: cover;
                display: flex;
                justify-content: center;
                align-items: center;
                color: black;
                font-size: 32px;
                font-weight: 700;
                border-bottom: 1px solid black;
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
            .stadium-list {
                width: 100%;
                background: #E3E6ED;
                padding: 20px;
                box-sizing: border-box;
                display: flex;
                flex-direction: column;
                gap: 20px;
                flex-grow: 1; /* Make the stadium list take the available space */
                background-image: url('<%=request.getContextPath()%>/img/background/bg3.jpg');
                background-repeat: no-repeat;
                background-size: cover;
                background-position: center;
            }
            .stadium-item {
                display: flex;
                justify-content: space-between;
                align-items: center;
                background: #FFFFFF;
                padding: 20px; /* Increase padding for larger appearance */
                border: 1px solid black;
                box-shadow: 0 4px 4px rgba(0, 0, 0, 0.25);
                font-size: 18px; /* Increase font size */
                position: relative; /* Position for the overlay effect */
                cursor: pointer;
                transition: transform 0.3s ease; /* Smooth transform transition */
            }
            .stadium-item:hover {
                transform: scale(1.05); /* Slightly enlarge the stadium item */
            }
            .stadium-item img {
                width: 80px; /* Increase image size */
                height: 80px; /* Increase image size */
                border-radius: 50%;
            }
            .stadium-details {
                flex-grow: 1;
                margin-left: 20px;
            }
            .stadium-details div {
                margin: 5px 0;
            }
            .stadium-actions {
                display: flex;
                flex-direction: column;
                align-items: flex-end;
                gap: 5px;
            }
            .stadium-actions a {
                background: #1F7A8C;
                color: white;
                padding: 5px 10px;
                border-radius: 4px;
                text-decoration: none;
                cursor: pointer;
            }
            .stadium-actions a:hover {
                background: #145569;
            }
            .footer {
                justify-content: space-around;
                display: flex;
                align-items: center;
                padding: 10px; /* Reduce padding to make footer smaller */
                margin-top: auto; /* Push the footer to the bottom */
            }
            .footer div {
                margin: 5px 0;
            }
            .rating {
                display: flex;
                align-items: center;
            }
            .rating .fa-star {
                color: gold;
                margin-left: 5px;
            }
        </style>
    </head>
    <body>
        <div class="header">
            <div class="logo">
                <img src="<%=request.getContextPath()%>/img/logo/logo.png" alt="Logo" width="40px" height="40px">
                <span>Badminton Stadium Booking</span>
            </div>
            <form class="search-bar" action="searchResults.jsp" method="get">
                <input type="text" name="query" placeholder="Search">
                <button type="submit">
                    <i class="fas fa-search"></i>
                </button>
            </form>
            <div class="auth-links">
                <a href="#">Login</a>
                <a href="#">Register</a>
            </div>
        </div>

        <div class="nav">
            <a href="stadiumList">STADIUM LIST</a>
            <a href="#">POPULAR</a>
            <a href="#">BOOKING HISTORY</a>
        </div>

        <div class="stadium-list">
            <div class="stadium-item" onclick="window.location.href = '#';">
                <img src="<%=request.getContextPath()%>/img/court/c8.jpg" alt="Stadium">
                <div class="stadium-details">
                    <div>Sân vận động TAINTAY</div>
                    <div>222/66 Nguyễn Văn Cừ, An Hòa, Ninh Kiều, CT</div>
                    <div class="rating">
                        Rating: 4/5
                        <i class="fas fa-star"></i>
                    </div>
                </div>
                <div class="stadium-actions">
                    <a href="bookingPage.jsp">Booking</a> <!-- Replace 'bookingPage.jsp' with the actual booking page URL -->
                </div>
                <!-- Details button removed, click on item for details -->
            </div>
            <!-- Repeat the above stadium-item div for each stadium entry -->
        </div>

        <div class="footer">
            <div>CONTACT US: 0778289817</div>
            <div>EMAIL: group1@gmail.com</div>
        </div>
    </body>
</html>
