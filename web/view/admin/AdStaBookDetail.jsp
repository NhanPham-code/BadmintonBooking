<%-- 
    Document   : AdStaBookDetail
    Created on : Jul 2, 2024, 2:35:03 AM
    Author     : NhanNQT
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
                transition: background-color 0.3s, color 0.3s;
                outline: none;
            }
            .booking-history a:hover {
                background: #1f7a8c;
                border-radius: 4px;
            }
            .datePickerContainer {
                position: relative;
                display: inline-block;
                display: flex;
                align-items: center;
            }

            .datePickerContainer input[type="date"] {
                padding: 0px 12px;
                border: 1px solid #ccc;
                border-radius: 4px;
                font-size: 16px;
            }

            .datePickerContainer input[type="date"]:hover {
                border-color: #999;
            }

            .datePickerContainer input[type="date"]:focus {
                outline: none;
                border-color: #007bff;
                box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
            }

            #selectedDate1, #selectedDate2 {
                width: 150px;
            }
            .table{
                display: flex;
                padding: 3%;
                box-sizing: border-box;
                gap: 20px;
                flex-wrap: wrap;
            }
            .action-buttons a {
                text-decoration: none;
                padding: 5px 10px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                outline: none;
                justify-content: center;
                display: inline-block;
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
                max-height: 600px;
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
                background-color: #BFDBF7;
            }

            .booking-detail {
                overflow-y: auto;
                padding: 10px;
            }

            .booking-detail a {
                text-decoration: none;
                color: black;
            }

            .booking-inf {
                display: flex;
                align-items: center;
                background: #fff;
                border: 1px solid #000;
                border-bottom: none;
                padding: 10px;
                margin-bottom: 10px;
            }

            .booking-inf img {
                width: 60px;
                height: 60px;
                border-radius: 50%;
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
                margin-left: 20px;
                color: green;
            }
            .court-list-container {
                display: flex;
                flex-wrap: wrap;
                margin-bottom: -15px;
            }
            .court-number {
                margin-left: 7px;
            }
            .waiting {
                color: blue;
            }

            .rejected {
                color: red;
            }

            @media (max-width: 768px) {
                .cus-book-his {
                    flex-direction: column;
                }
                .cus-book {
                    min-height: 200px;
                }
            }
        </style>
    </head>
    <body>
        <jsp:include page="AdHeader.jsp" flush="true" />
        <div class="cus-book-his">
            <div class="table">
                <!-- Pending Bookings -->
                <div class="cus-book" id="pendingBooking">
                    <div class="head"><b>PENDING BOOKINGS</b></div>
                    <div class="booking-detail">
                        <c:forEach items="${waitingBookings}" var="booking">
                            <a href="bookingDetail?bookingID=${booking.booking_ID}">
                                <div class="booking-inf">
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
                                    <div class="${booking.bookingAccepted == 'rejected' ? 'rejected' : 'waiting'}">
                                        ${booking.bookingAccepted}
                                    </div>
                                </div>
                            </a>
                        </c:forEach>
                    </div>
                </div>

                <!-- Accepted Bookings -->
                <div class="cus-book" id="acceptedBooking">
                    <div style="padding: 12px 0" class="head">
                        <b>ACCEPTED BOOKING ON DAY</b>
                        <div class="datePickerContainer">
                            <input type="date" id="selectedDate1" name="selectedDate" value="${requestScope.date}" required>
                            <button type="button" onclick="filterAcceptedBookings()">Filter</button>
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
                                    <div style="color: green" class="stadium-status">
                                        ${booking.bookingAccepted}
                                    </div>
                                </div>  
                            </a>
                        </c:forEach>
                    </div>
                </div>
            </div>
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
