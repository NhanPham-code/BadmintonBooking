<%-- 
    Document   : BookingMangementStadiumOwner
    Created on : Jun 7, 2024, 6:28:37 AM
    Author     : NhiTCU
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Sport Stadium Booking System</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

        <style>
            .booking-history {
                padding-top: 3%;
                padding-left: 3%;
                font-size: 14px;

            }
            .booking-history a {
                padding: 10px;
                cursor: pointer;
                border-radius: 4px;
                color: white;
                background:#022b3a;
                border: 1px solid #ccc;
                font-size: 16px;
                transition: background-color 0.3s, color 0.3s; /* Smooth transition */
                outline: none;
            }
            .booking-history a:hover {
                background: #1f7a8c;  /* Even lighter hover color */
                border-radius: 4px; /* Change text color */
            }
            .datePickerContainer {
                position: relative;
                display: inline-block;
                display: flex;
                align-items: center;
            }

            .datePickerContainer input[type="date"] {
                padding: 0px 12px; /* Thay đổi padding nếu cần */
                border: 1px solid #ccc;
                border-radius: 4px;
                font-size: 16px; /* Thay đổi font size nếu cần */
            }

            /* Tạo hiệu ứng hover */
            .datePickerContainer input[type="date"]:hover {
                border-color: #999;
            }

            /* Tạo hiệu ứng focus */
            .datePickerContainer input[type="date"]:focus {
                outline: none;
                border-color: #007bff; /* Màu border khi focus */
                box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25); /* Hiệu ứng nổi bật khi focus */
            }

            #selectedDate1, #selectedDate2 {
                width: 150px;
            }
            .table{
                display: flex;
                padding: 3%;
                box-sizing: border-box;
                gap: 20px;
                flex-wrap: wrap; /* Allows wrapping on smaller screens */
            }
            .action-buttons a {
                text-decoration: none;  /*Remove underline */
                padding: 5px 10px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                outline: none;
                justify-content: center;
                display: inline-block; /* Ensure buttons display inline */
            }
            .accept{
                background-color: #4CAF50;
            }
            .reject {
                background-color: #E5240A;
            }
            .action-buttons a:hover {
                opacity: 0.8;
            }
            .cus-book-his {
                background-image: url('<%=request.getContextPath()%>/img/background/bg3.jpg');
                width: 100%;
                min-height: 100vh;
                display: flex;
                flex-direction: column;
                background-repeat: no-repeat;
                background-size: cover;
                background-position: center;
            }

            .cus-book {
                background: #044E67;
                border-radius: 4px;
                border: 1px solid #000;
                flex: 1;
                display: flex;
                flex-direction: column;
                height: auto;
                min-height: 400px;
                max-height: 600px; /* Set max height to prevent overflow */
                overflow: hidden;
            }

            .head {
                width: 100%;
                display: flex;
                justify-content: space-around;
                align-items: center;
                color: black;
                font-size: 18px;
                padding: 15px 0;
                background-color: #BFDBF7; /* Added background color for header */
            }

            .booking-detail {
                overflow-y: auto;
                padding: 10px; /* Added padding for better spacing */
            }

            .booking-detail a {
                text-decoration: none;
                color: black
            }

            .booking-inf {
                display: flex;
                align-items: center;
                justify-content: space-between;
                background: #fff;
                border: 1px solid #000;
                border-bottom: none;
                padding: 10px;
                margin-bottom: 10px; /* Added margin for spacing between bookings */
            }

            .booking-inf img {
                width: 60px;
                height: 60px;
                border-radius: 50%;
            }

            .booking-actions {
                display: flex;
                flex-direction: row;
                align-items: flex-end;
            }

            .action-buttons {
                display: flex;
                gap: 5px;
            }

            .stadium-details {
                flex-grow: 1;
                margin-left: 20px;
            }

            .stadium-status {
                display: flex;
                flex-direction: column;
                align-items: flex-end;
                justify-content: center;
                margin-left: 20px; /* Added margin for better spacing */
                color: green; /* Optional: Change text color to green */
            }
            .court-list-container {
                display: flex;
                flex-wrap: wrap;
                margin-bottom: -15px
            }
            .court-number {
                margin-right: 10px; /* Khoảng cách giữa các phần tử */
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

            /* Optional: Add media queries for better responsiveness */
            @media (max-width: 768px) {
                .cus-book-his {
                    flex-direction: column;
                }
                .cus-book {
                    min-height: 200px;
                }
            }
            .filter-button {
                padding: 5px 10px;
                font-size: 14px;
                border: 1px solid #ccc;
                border-radius: 5px;
                cursor: pointer;
                background-color: #1F7A8C;
                color: white;
                outline: none;
                margin-left: 10px;
            }
            .filter-button:hover{
                background-color: #145569;
            }
        </style>
    </head>
    <body>
        <%@ include file="HeaderStadiumOwner.jsp" %>
        <div class="cus-book-his">
            <div class="booking-history">
                <a href="bookingHistoryStadiumOwner?StadiumID=${requestScope.stadiumID}&stadiumName=${requestScope.stadiumName}">Booking History</a>
                <a href="ChartDrawController?StadiumID=${requestScope.stadiumID}&stadiumName=${requestScope.stadiumName}">Revenue Chart</a>
                <a href="OccupancyRateController?StadiumID=${requestScope.stadiumID}&stadiumName=${requestScope.stadiumName}">Occupancy rate Chart</a>
                <a href="OccupancyRateBySlotController?StadiumID=${requestScope.stadiumID}&stadiumName=${requestScope.stadiumName}">Occupancy by Slot Chart</a>
            </div>

            <div class="table">
                <!-- Pending Bookings -->
                <div class="cus-book" id="pendingBooking">
                    <div class="head"><b>PENDING BOOKINGS</b></div>
                    <div class="booking-detail">    
                        <c:forEach items="${waitingBookings}" var="booking">
                            <div class="booking-inf">
                                <a href="bookingDetail?bookingID=${booking.booking_ID}&stadiumID=${requestScope.stadiumID}&stadiumName=${requestScope.stadiumName}">
                                    <div class="stadium-details">
                                        <div>Customer Name: ${booking.customer.customer_Name}</div>
                                        <div class="court-list-container">
                                            <div>Court:</div>
                                            <c:forEach var="c" items="${booking.courtList}">
                                                <p class="court-number">${c.number}</p>
                                            </c:forEach>
                                        </div>
                                        <div>Date: ${booking.date}</div>
                                        <div>Time: ${booking.startTime} - ${booking.endTime}</div>
                                    </div>
                                </a>
                                <div class="booking-actions">
                                    <div class="action-buttons">
                                        <a style="color: white" href="acceptBooking?BookingID=${booking.booking_ID}" class="accept">Accept</a>
                                        <a style="color: white" href="rejectBooking?BookingID=${booking.booking_ID}" class="reject">Reject</a>
                                    </div>
                                    <div class="stadium-status">
                                        ${booking.bookingAccepted}
                                    </div>
                                </div>
                            </div>
                            <!-- Add more pending bookings as needed -->
                        </c:forEach>
                    </div>
                </div>

                <!-- Accepted Bookings -->
                <div class="cus-book" id="acceptedBooking">
                    <div style="padding: 12px 0" class="head">
                        <b>ACCEPTED BOOKING ON DAY</b>
                        <div class="datePickerContainer">
                            <input type="date" id="selectedDate1" name="selectedDate" value="${requestScope.date}" required>
                            <button class="filter-button" type="button" onclick="filterAcceptedBookings()">Filter</button>
                        </div>
                    </div>
                    <div class="booking-detail" id="acceptedBookingsContainer">
                        <c:forEach items="${acceptedBookings}" var="booking">
                            <a href="bookingDetail?bookingID=${booking.booking_ID}">
                                <div class="booking-inf accepted-booking-container" data-date="${booking.date}">
                                    <div class="stadium-details">
                                        <div>Customer Name: ${booking.customer.customer_Name}</div>
                                        <div class="court-list-container">
                                            <div>Court:</div>
                                            <c:forEach var="c" items="${booking.courtList}">
                                                <p class="court-number">${c.number}</p>
                                            </c:forEach>
                                        </div>
                                        <div>Date: ${booking.date}</div>
                                        <div>Time: ${booking.startTime} - ${booking.endTime}</div>
                                    </div>
                                    <div style ="color: green" class="stadium-status">
                                        ${booking.bookingAccepted}
                                    </div>
                                </div>  
                            </a>
                        </c:forEach>
                    </div>
                </div>
            </div>

            <div class="footer">
                <div>CONTACT US: 0778289817</div>
                <div>EMAIL: bookingsystem3105@gmail.com</div>
            </div>
    </body>
    <script>
        function filterAcceptedBookings() {
            var selectedDate = document.getElementById("selectedDate1").value;
            var bookingContainers = document.querySelectorAll(".accepted-booking-container");

            bookingContainers.forEach(function (container) {
                var bookingDate = container.getAttribute("data-date");
                if (selectedDate === "" || selectedDate === bookingDate) {
                    container.style.display = "block";
                } else {
                    container.style.display = "none";
                }
            });
        }
    </script>
</html>
