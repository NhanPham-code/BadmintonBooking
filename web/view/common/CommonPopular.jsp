<%-- 
    Document   : CommonPopular
    Created on : Jul 1, 2024, 10:25:54 AM
    Author     : NhiTCU
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Popular Stadium</title>
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
            />
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
            />
        <style>
            body {
                font-family: 'Inter', sans-serif;
                margin: 0;
                padding: 0;

            }

            .header {
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

            .Pop-bg {
                display: grid;
                grid-template-columns: 32.5% 32.5% 32.5%;
                padding: 10px;
                align-items: center;
                justify-items: center;
                width: 100%;
                padding: 20px;
                box-sizing: border-box;
                flex-direction: column;
                gap: 20px;
                flex-grow: 1;
                background-image: url('<%=request.getContextPath()%>/img/background/bg3.jpg');
                background-repeat: no-repeat;
                background-size: cover;
                background-position: center;
                min-height: 80vh;
            }
            .SO-profile {
                border: 1px solid;
                border-radius: 8px;
                width: 60%;
                background: #ffffff;
                padding: 55px 20px;
                box-sizing: border-box;
                height: 80%;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                cursor: pointer;

            }

            .cus-inf img {
                width:210px;
                height: 150px;
                border-radius: 8px;
                object-fit: cover;
            }

            .rating i {
                color: gold;
            }

            .owner-detail {
                display: flex;
                padding-bottom: 15px;
                padding-top: 15px;
                justify-content: center;
            }

            button{
                background: #1f7a8c;
                border: none;
                color: white;
                padding: 5px 10px;
                border-radius: 4px;
                cursor: pointer;
                display: flex;
                align-items: center;
                justify-content: center;
            }
            button:hover {
                background: #145569;
            }
            .footer {
                width: 100%;
                background: #022B3A;
                color: white;
                align-items: center;
                padding: 10px 20px;
                box-sizing: border-box;
                justify-content: space-around;
                display: flex;
                padding: 10px;
                margin-top: auto;
            }
            .footer div {
                margin: 5px 0;
            }
        </style>
    </head>
    <body>
        <div class="header">
            <div class="logo">
                <img src="<%=request.getContextPath()%>/img/logo/logo.png" alt="Logo" width="40px" height="40px">
                <span>Badminton Stadium Popular</span>
            </div>
            <div class="auth-links">
                <a href="<%=request.getContextPath()%>/view/common/login.jsp">Login</a>
                <a href="<%=request.getContextPath()%>/view/common/SendEmailRegis.jsp">Register</a>
            </div>
        </div>

        <div class="nav">
            <a href="stadiumList">STADIUM LIST</a>
            <a href="<%=request.getContextPath()%>/Popular">POPULAR</a>
        </div>
        <div class="Pop-bg">
            <c:forEach var="stadium" items="${requestScope.stadium}">
                <div class="SO-profile">
                    <div class="cus-inf" onclick="window.location.href = 'stadiumDetail?stadiumID=${stadium.stadium_ID}';">
                        <img src="${stadium.stadium_image}" alt="Stadium" style="padding: 30px;">
                        <div style="text-align: center; font-size: 17px;  padding: 0 8%; margin-bottom: 10px"><b>${stadium.stadium_name}</b></div>
                        <div class="owner-info" style="padding: 0 15%;">
                            <div>
                                <i class="fas fa-map-marker-alt"></i>
                                ${stadium.stadium_address}</div>
                            <div class="phone">
                                <i class="fas fa-phone"></i>
                                ${stadium.stadium_phone}
                            </div>
                            <div class="rating">
                                Rating: ${stadium.avg_ratingScore}/5
                                <i class="fas fa-star"></i>
                            </div>
                        </div>
                        <div class="owner-detail" style="padding: 30px;">
                            <button onclick="window.location.href = 'stadiumDetail?stadiumID=${stadium.stadium_ID}';">Detail</button>
                            <!-- Replace 'bookingPage.jsp' with the actual booking page URL -->
                        </div>
                        <!-- Details button removed, click on item for details -->
                    </div>
                    <!-- Repeat the above stadium-item div for each stadium entry -->
                </div>

            </c:forEach>
        </div>
        <div class="footer">
            <div>CONTACT US: 0778289817</div>
            <div>EMAIL: bookingsystem3105@gmail.com</div>
        </div>
    </body>
</html>
