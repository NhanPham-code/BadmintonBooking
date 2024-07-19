<%-- 
    Document   : CusBookingHistory
    Created on : Jun 18, 2024, 10:02:19 PM
    Author     : WINDOWS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Booking History</title>
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
            />
        <style>

            .cus-book-his {
                background-image: url('<%=request.getContextPath()%>/img/background/bg3.jpg');
                width: 100%;
                /*                background: #e3e6ed;*/
                padding: 3%;
                height:563px;
                box-sizing: border-box;
                display: flex;
                gap: 20px;
                flex-wrap: wrap; /* Allows wrapping on smaller screens */
                background-repeat: no-repeat;
                background-size: cover;
                background-position: center;
                min-height: 100vh;
            }

            .cus-book {
                background: #022b3a;
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
                justify-content: center;
                align-items: center;
                color: white;
                font-size: 18px;
                padding: 15px 0;
                background-color: #044f67; /* Added background color for header */
            }

            .booking-detail {
                overflow-y: auto;
                padding: 10px; /* Added padding for better spacing */
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

            /* Optional: Add media queries for better responsiveness */
            @media (max-width: 768px) {
                .cus-book-his {
                    flex-direction: column;
                }
                .cus-book {
                    min-height: 200px;
                }

                /*            @media (min-width: 768px) {
                                .cus-book {
                                    min-height: 400px;
                                }
                            }*/

            </style>
        </head>
        <body>
            <jsp:include page="CusHeaderNoSearch.jsp" flush="true" />

            <div class="cus-book-his">
                <div class="cus-book">
                    <div class="head">BOOKING HISTORY</div>
                    <div class="booking-detail">
                        <c:forEach items="${notWaitingBookings}" var="booking">
                            <a href="bookingDetail?bookingID=${booking.booking_ID}">
                                <div class="booking-inf">
                                    <img src="<%=request.getContextPath()%>/${booking.stadium.stadium_image}" alt="Stadium">
                                    <div class="stadium-details">
                                        <div>Stadium: ${booking.stadium.stadium_name}</div>
                                        <div>Court amount: ${booking.courtQuantity}</div>
                                        <div>Date: ${booking.date}</div>
                                        <div>Time: ${booking.startTime} - ${booking.endTime}</div>
                                    </div>
                                    <div class="stadium-status">


                                        <div>${booking.bookingAccepted}</div>


                                    </div>
                                </div>
                            </a>
                        </c:forEach>
                    </div>
                </div>
                <div class="cus-book">
                    <div class="head">BOOKING HISTORY (Waiting)</div>
                    <div class="booking-detail">
                        <c:forEach items="${waitingBookings}" var="booking">
                            <a href="bookingDetail?bookingID=${booking.booking_ID}">
                                <div class="booking-inf">
                                    <img src="<%=request.getContextPath()%>/${booking.stadium.stadium_image}" alt="Stadium">
                                    <div class="stadium-details">
                                        <div>Stadium: ${booking.stadium.stadium_name}</div>
                                        <div>Court amount: ${booking.courtQuantity}</div>
                                        <div>Date: ${booking.date}</div>
                                        <div>Time: ${booking.startTime} - ${booking.endTime}</div>
                                    </div>
                                    <div class="stadium-status">${booking.bookingAccepted}</div>
                                </div>
                            </a>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <jsp:include page="CusFooter.jsp" flush="true" />
        </body>
    </html>
