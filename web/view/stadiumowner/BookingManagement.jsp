<%-- 
    Document   : BookingMangementStadiumOwner
    Created on : Jun 7, 2024, 6:28:37 AM
    Author     : ADMIN
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
                color: white;
            }

            .booking-inf {
                display: flex;
                align-items: center;
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
            }
            .court-number {
                margin-right: 10px; /* Khoảng cách giữa các phần tử */
            }

            /* Optional: Add media queries for better responsiveness */
            @media (max-width: 768px) {
                .cus-book-his {
                    flex-direction: column;
                }
                .cus-book {
                    min-height: 200px;
                }


            </style>
        </head>
        <body>
            <%@ include file="HeaderStadiumOwner.jsp" %>
            <div class="cus-book-his">
                <div class="booking-history">
                    <a href="bookingHistoryStadiumOwner?StadiumID=${requestScope.stadiumID}">Booking History</a>
                </div>
                <div class="table">
                    <!-- Pending Bookings -->
                    <div class="cus-book" id="pendingBooking">
                        <div class="head"><b>PENDING BOOKINGS</b></div>
                        <div class="booking-detail">
                            <c:forEach items="${waitingBookings}" var="booking">
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
                                    <div class="action-buttons">
                                        <a href="acceptBooking?BookingID=${booking.booking_ID}" class="accept">Accept</a>
                                        <a href="rejectBooking?BookingID=${booking.booking_ID}" class="reject">Reject</a>
                                    </div>
                                    <div class="stadium-status">
                                        ${booking.bookingAccepted}
                                    </div>
                                </div>

                                <!-- Add more pending bookings as needed -->
                            </c:forEach>
                        </div>
                    </div>

                    <!-- Accepted Bookings -->
                    <div class="cus-book" id="acceptedBooking">
                        <div class="head">
                            <b>ACCEPTED BOOKING ON DAY</b>
                            <div class="datePickerContainer">
                                <form action="<%=request.getContextPath()%>acceptedBookFilter" method="GET">
                                    <input type="hidden" name="command" value="filter">
                                    <input type="date" id="selectedDate1" name="selectedDate">
                                    <input type="submit" value="Filter">
                                </form>
                            </div>
                        </div>
                        <div class="booking-detail">
                            <c:forEach items="${acceptedBookings}" var="booking">
                                <div class="booking-inf">
                                    <div class="stadium-details">
                                        <div>Customer Name: ${booking.customer.customer_Name}</div>
                                        <div style="display: flex">
                                            Court:
                                            <c:forEach var="c" items="${booking.courtList}">
                                                <p>${c.number}</p>
                                            </c:forEach>
                                        </div>
                                        <div>Date: ${booking.date}</div>
                                        <div>Time: ${booking.startTime} - ${booking.endTime}</div>
                                    </div>
                                    <div class="stadium-status">
                                        ${booking.bookingAccepted}
                                    </div>
                                </div>                           
                                <!-- Add more accepted bookings as needed -->
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </body>
    </html>
