<%-- 
    Document   : Details
    Created on : Jul 22, 2024, 5:29:14 PM
    Author     : PhuocDH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Booking Detail</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <style>
            .stadium-bg {
                flex-grow: 1;
                width: 100%;
                padding: 40px;
                box-sizing: border-box;
                display: flex;
                justify-content: center;
                align-items: center;
                background: url('<%=request.getContextPath()%>/img/background/bg3.jpg') no-repeat center center; /* Background image */
                background-size: cover; /* Cover the entire background */
            }
            .stadium-board {
                background: rgba(255, 255, 255, 0.9); /* Slightly transparent to show background */
                border-radius: 4px;
                width: 100%;
                max-width: 800px;
                padding: 20px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            .stadium-detail {
                display: flex;
                flex-direction: column;
                gap: 20px;
            }
            .stadium-inf {
                display: flex;
                justify-content: space-between;
                align-items: center;
                border-bottom: 1px solid #ccc;
                padding-bottom: 10px;
                margin-bottom: 10px;
            }
            .stadium-inf h1 {
                font-size: 18px;
                margin: 0;
            }
            .stadium-inf p {
                font-size: 16px;
                margin: 0;
            }
            .court {
                display: flex;
                align-items: center;
                gap: 10px;
            }
            .total {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-top: 20px;
                padding-top: 10px;
                border-top: 2px solid #000;
            }
            .total h1 {
                font-size: 20px;
                margin: 0;
            }

            .exit-button {
                margin-bottom: 2%;
            }

            .exit-button a {
                font-family: cursive;
                font-size: 120%;
                color: blue;
                text-decoration: none;
                font-weight: bold;
                transition: background-color 0.3s ease;
                position: relative;
            }

            .exit-button a::after {
                content: '';
                position: absolute;
                width: 100%;
                height: 2px;
                bottom: 0;
                left: 0;
                background-color: blue;
                transform: scaleX(0);
                transform-origin: bottom right;
                transition: transform 0.3s ease-out;
            }

            .exit-button a:hover::after {
                transform: scaleX(1);
                transform-origin: bottom left;
            }
        </style>
    </head>
    <body>
        <jsp:include page="HeaderStadiumOwner.jsp" flush="true" />
        <div class="stadium-bg">
            <div class="stadium-board">
                <div class="stadium-detail">
                    
                    <div class="exit-button">
                        <a href="bookingHistoryStadiumOwner?StadiumID=${requestScope.stadiumID}&stadiumName=${requestScope.stadiumName}">Return to menu</a>
                    </div>

                    <c:set var="bk" value="${requestScope.booking}"></c:set>
                        <div class="stadium-inf">
                            <h1>Customer name:</h1>
                            <p>${bk.customer.customer_Name}</p>
                    </div>
                    <div class="stadium-inf">
                        <h1>Customer phone:</h1>
                        <p>${bk.customer.customer_Phone}</p>
                    </div>
                    <div class="stadium-inf">
                        <h1>Stadium name:</h1>
                        <p>${bk.stadium.stadium_name}</p>
                    </div>
                    <div class="stadium-inf">
                        <h1>Stadium address:</h1>
                        <p>${bk.stadium.stadium_address}</p>
                    </div>
                    <div class="stadium-inf">
                        <h1>Stadium contact:</h1>
                        <p>${bk.stadium.stadium_phone}</p>
                    </div>
                    <div class="stadium-inf">
                        <h1>Date:</h1>
                        <p>${bk.date}</p>
                    </div>
                    <div class="stadium-inf">
                        <h1>Time Booked:</h1>
                        <p>${bk.startTime} - ${bk.endTime}</p>
                    </div>
                    <div class="stadium-inf">
                        <h1>Court Quantity</h1>
                        <p>${bk.courtQuantity}</p>
                    </div>
                    <div class="stadium-inf">
                        <h1>Chosen court:</h1>
                        <div class="court">
                            <c:forEach var="c" items="${requestScope.chooseCourt}">
                                <p>${c.number}</p>
                                <img src="<%=request.getContextPath()%>/img/icon/icon.png" alt="icon" width="40px" height="40px" />
                            </c:forEach>
                        </div>
                    </div>
                    <div class="stadium-inf">
                        <h1>Price per hour:</h1>
                        <p>${bk.stadium.pricePerHour}</p>
                    </div>
                    <div class="stadium-inf">
                        <h1>Banking Image:</h1>
                        <img src="${bk.bankingImage}" width="300px" height="450px" alt="bankingImage"/>
                    </div>
                    <div class="total">
                        <h1>Total:</h1>
                        <h1>${bk.total}.000 VND</h1>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer">
            <div>CONTACT US: 0778289817</div>
            <div>EMAIL: bookingsystem3105@gmail.com</div>
        </div>
    </body>
</html>
