<%-- 
    Document   : StadiumHistory
    Created on : Jun 7, 2024, 8:19:07 AM
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
            body {
                font-family: Arial, sans-serif;
                background-color: #e1e5f2;
                margin: 0;
                padding: 0;
            }

            .content {
                padding: 20px;
            }

            .booking-history {
                display: flex;
                align-items: center;
                justify-content: space-between;
                background-color: #BFDBF7;
                padding: 10px;
                font-size: 14px;
            }

            .booking-history > * {
                flex: 1;
                margin-right: 10px; /* Để tạo khoảng cách giữa các phần tử, nếu cần */
            }
            .task{
                display:column;
                background-color: #BFDBF7;
                padding-top: 1%;
            }
            .booking-history button {
                padding: 10px;
                cursor: pointer;
                background-color: #D3E4F5;
                color: #000000;
                border: none;
                font-size: 16px;
                transition: background-color 0.3s, color 0.3s;
                outline: none;
            }

            .booking-history button:hover {
                background: #57A1BA;
                border-radius: 4px;
            }

            .datePickerContainer {
                display: flex;
                align-items: center;
                width: 100%;
                flex-wrap: wrap;
            }

            .datePickerContainer input[type="number"],
            .datePickerContainer button {
                flex-grow: 1; /* Chia sẻ không gian một cách tự động */
                padding: 8px 12px;
                border: 1px solid #ccc;
                border-radius: 4px;
                font-size: 16px;
                margin-right: 10px; /* Khoảng cách giữa các phần tử */
                margin-bottom: 10px;
            }

            .datePickerContainer button {
                background-color: #D3E4F5;
                color: #000000;
                border: none;
                cursor: pointer;
                transition: background-color 0.3s, color 0.3s;
                outline: none;
            }

            .datePickerContainer input[type="number"]:hover {
                border-color: #999;
            }

            .datePickerContainer input[type="number"]:focus {
                outline: none;
                border-color: #007bff;
                box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
            }

            table {
                width: 90%;
                border-collapse: collapse;
                margin-top: 20px;
                margin-left: auto;
                margin-right: auto;
            }

            th, td {
                border: 1px solid #ddd;
                padding: 8px;
                text-align: center;
            }

            th {
                background-color: #f2f2f2; /* color of header */
                color: black; /* color of background */
            }

            tr:nth-child(even) {
                background-color: #f2f2f2; /* Set background to even line */
            }

            tr:nth-child(odd) {
                background-color: #ffffff; /* Set background to odd line */
            }

            .action-buttons a {
                text-decoration: none;
                padding: 5px 10px;
                background-color: #4CAF50;
                color: white;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                outline: none;
                display: flex;
                justify-content: center;
            }

            .action-buttons a:hover {
                opacity: 0.8;
            }

            .column-name {
                width: 20%;
                text-align: center;
            }

            .column-phone {
                width: 15%;
                text-align: center;
            }

            .column-date {
                width: 15%;
                text-align: center;
            }

            .column-time {
                width: 15%;
                text-align: center;
            }

            .column-status {
                width: 15%;
                text-align: center;
            }

            .column-action {
                width: 20%;
                text-align: center;
            }

            .menu {
                display: flex;
                background-color: #BFDBF7;
                border-radius: 5px;
                overflow: hidden;
            }

            .menu-item {
                padding: 10px 20px;
                color: #000000;
                text-decoration: none;
                transition: background-color 0.3s;
            }

            .menu-item:hover, .menu-item.active {
                background-color: #57A1BA;
                color: white;
            }

            @media (max-width: 768px) {
                .booking-history {
                    flex-direction: column;
                    align-items: flex-start;
                }

                .menu {
                    align-self: flex-start;
                    margin-bottom: 10px;
                }

                .datePickerContainer input[type="number"] {
                    width: 31%;
                    margin-right: 2%;
                    margin-bottom: 10px;
                }

                .datePickerContainer button {
                    width: 96%;
                    margin-right: 0;
                }

                .datePickerContainer input[type="number"]:nth-child(3) {
                    margin-right: 0;
                }

                table {
                    width: 100%;
                }

                th:nth-child(1), /* BookingID */
                th:nth-child(3), /* Phone Number */
                td:nth-child(1), /* BookingID values */
                td:nth-child(3) /* Phone Number values */ {
                    display: none;
                }
            }

            @media (max-width: 480px) {
                .datePickerContainer input[type="number"],
                .datePickerContainer button {
                    width: 100%;
                    margin-right: 0;
                }

                th:nth-child(1), /* BookingID */
                th:nth-child(3), /* Phone Number */
                td:nth-child(1), /* BookingID values */
                td:nth-child(3), /* Phone Number values */
                th:nth-child(6), /* Status */
                td:nth-child(6) /* Status value */ {
                    display: none;
                }

                .column-name,
                .column-date,
                .column-time,
                .column-action {
                    width: auto;
                    text-align: center;
                }
            }

            @media (max-width: 320px) {
                .datePickerContainer input[type="number"],
                .datePickerContainer button {
                    width: 100%;
                    margin-right: 0;
                }

                th:nth-child(1), /* BookingID */
                th:nth-child(3), /* Phone Number */
                td:nth-child(1), /* BookingID values */
                td:nth-child(3), /* Phone Number values */
                th:nth-child(6), /* Status */
                td:nth-child(6), /* Status value */
                th:nth-child(5), /* Time */
                td:nth-child(5) /* Time values */ {
                    display: none;
                }

                .column-name,
                .column-date,
                .column-action {
                    width: auto;
                    text-align: center;
                }
            }
            .exit-button {
                margin-bottom: 1%;
                background-color: #BFDBF7;
                margin-left: 10px;
            }

            .exit-button a {
                font-family: cursive;
                font-size: 120%;
                color: blue;
                text-decoration: none;
                font-weight: bold;
                transition: background-color 0.3s ease;
                position: relative;
                padding-top: 10px;
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

        <div class="task">

            <div class="exit-button">
                <a href="bookingManage?stadiumID=${requestScope.stadiumID}&stadiumName=${requestScope.stadiumName}">Return to menu</a>

            </div>


            <div class="booking-history">  
                <div class="menu">
                    <a href="#" class="menu-item active" onclick="showBookings('accepted')">Accepted</a>
                    <a href="#" class="menu-item" onclick="showBookings('notAccepted')">Not Accepted</a>
                </div>
                <div class="datePickerContainer">
                    <input type="number" id="selectedDay" min="1" max="31" placeholder="Day">
                    <input type="number" id="selectedMonth" min="1" max="12" placeholder="Month">
                    <input type="number" id="selectedYear" min="2023" max="2050" placeholder="Year">
                    <button onclick="filterBookings()">Filter</button>
                    <div id="error-message" style="color: red; margin-top: 10px;"></div>
                </div>
            </div>

        </div>


        <div style="height: 5px;"></div>



        <table id="acceptedBookings">
            <thead>
                <tr>
                    <th>BookingID</th>
                    <th class="column-name">Customer Name</th>
                    <th class="column-phone">Phone Number</th>
                    <th class="column-date">Date</th>
                    <th class="column-time">Time</th>
                    <th class="column-status">Status</th>
                    <th class="column-action">Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${acceptedBookings}" var="booking">
                    <tr class="booking-row" data-date="${booking.date}" data-total="${booking.total}">
                        <td>${booking.booking_ID}</td>
                        <td>${booking.customer.customer_Name}</td>
                        <td>${booking.customer.customer_Phone}</td>
                        <td>${booking.date}</td>
                        <td>${booking.startTime}-${booking.endTime}</td>
                        <td style="color: green; font-weight: bold">${booking.bookingAccepted}</td>
                        <td class="action-buttons">
                            <a href="detail?bookingID=${booking.booking_ID}&stadiumID=${requestScope.stadiumID}&stadiumName=${requestScope.stadiumName}" class="detail">
                                Detail
                            </a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <table id="notAcceptedBookings" style="display: none;">
            <thead>
                <tr>
                    <th>BookingID</th>
                    <th class="column-name">Customer Name</th>
                    <th class="column-phone">Phone Number</th>
                    <th class="column-date">Date</th>
                    <th class="column-time">Time</th>
                    <th class="column-status">Status</th>
                    <th class="column-action">Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${rejectedBookings}" var="booking">
                    <tr class="booking-row" data-date="${booking.date}">
                        <td>${booking.booking_ID}</td>
                        <td>${booking.customer.customer_Name}</td>
                        <td>${booking.customer.customer_Phone}</td>
                        <td>${booking.date}</td>
                        <td>${booking.startTime}-${booking.endTime}</td>
                        <td style="color:red; font-weight: bold">${booking.bookingAccepted}</td>
                        <td class="action-buttons">
                            <a href="detail?bookingID=${booking.booking_ID}&stadiumID=${requestScope.stadiumID}&stadiumName=${requestScope.stadiumName}" class="detail">
                                Detail
                            </a>
                        </td>
                    </tr>                    
                </c:forEach>
            </tbody>
        </table>

        <div id="totalResult" style="text-align: center; margin-top: 10px; font-weight: bold; color: red; font-size: 30px">Revenue: </div>

        <script>

            //Calculate total price - PhuocDH
            function calculateTotal() {
                var acceptedTable = document.getElementById("acceptedBookings");
                var totalResultElement = document.getElementById('totalResult');

                if (acceptedTable.style.display !== "none") {
                    var totalSum = 0;
                    //get all value is in screen
                    var rows = acceptedTable.querySelectorAll('tbody tr:not([style="display: none;"])');

                    rows.forEach(function (row) {
                        var total = parseFloat(row.getAttribute('data-total'));


                        totalSum += total * 1000;

                    });
                    var formattedTotal = totalSum.toLocaleString('vi-VN');
                    totalResultElement.textContent = 'Total: ' + formattedTotal + ' VND';

//                    totalResultElement.textContent = 'Total: ' + totalSum + ' VND';

                    totalResultElement.style.display = "block";
                    calculateTotalBtn.style.display = "inline-block";

                } else {
                    totalResultElement.style.display = "none";
                    calculateTotalBtn.style.display = "none";
                }
            }

            //PhuocDH
            function showBookings(type) {
                var acceptedTable = document.getElementById("acceptedBookings");
                var notAcceptedTable = document.getElementById("notAcceptedBookings");
                var menuItems = document.querySelectorAll(".menu-item");

                if (type === 'accepted') {
                    acceptedTable.style.display = "table";
                    notAcceptedTable.style.display = "none";
                } else if (type === 'notAccepted') {
                    acceptedTable.style.display = "none";
                    notAcceptedTable.style.display = "table";
                } else {
                    console.error("Invalid type: " + type);
                }

                menuItems.forEach(function (item) {
                    item.classList.remove('active');
                    if ((type === 'accepted' && item.textContent === 'Accepted') ||
                            (type === 'notAccepted' && item.textContent === 'Not Accepted')) {
                        item.classList.add('active');
                    }
                });

                calculateTotal();
            }

            //DangVH
            function filterBookings() {
                var selectedDay = document.getElementById("selectedDay").value;
                var selectedMonth = document.getElementById("selectedMonth").value;
                var selectedYear = document.getElementById("selectedYear").value;

                var day = selectedDay ? parseInt(selectedDay, 10) : null;
                var month = selectedMonth ? parseInt(selectedMonth, 10) : null;
                var year = selectedYear ? parseInt(selectedYear, 10) : null;

                // Check leap year - PhuocDH
                function isLeapYear(year) {
                    return (year % 4 === 0 && year % 100 !== 0) || (year % 400 === 0);
                }

                // Check valid day - PhuocDH
                function isValidDay(day, month, year) {
                    if (month < 1 || month > 12) {
                        return false;
                    }
                    var maxDays = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
                    if (isLeapYear(year) || (year === null && month === 2)) {
                        maxDays[1] = 29; //set day in leaps year
                    }
                    return day >= 1 && day <= maxDays[month - 1];
                }

                // Check valid date - DangVH
                function isValidDate(day, month, year) {
                    if (year && (year < 2023 || year > 2026)) {
                        return false;
                    }
                    if (day !== null && month !== null && year !== null) {
                        return isValidDay(day, month, year);
                    }
                    if (day !== null && month !== null) {
                        return isValidDay(day, month, year);
                    }
                    if (month !== null && (month < 1 || month > 12)) {
                        return false;
                    }
                    if (day !== null && (day < 1 || day > 31)) {
                        return false;
                    }
                    return true;
                }

                // show error mesage
                var errorMessageElement = document.getElementById('error-message');

                // check valid day month year
                if (!isValidDate(day, month, year)) {
                    errorMessageElement.textContent = 'Invalid date! Please enter a valid date.';
                    return;
                } else {
                    errorMessageElement.textContent = ''; // show non when no error
                }

                // Get date
                var bookingRows = document.querySelectorAll(".booking-row");

                //get booking by selected - DangVH
                bookingRows.forEach(function (row) {
                    var bookingDate = row.getAttribute("data-date");
                    var [bookingYear, bookingMonth, bookingDay] = bookingDate.split("-");

                    var showRow = true;

                    if (selectedDay && selectedDay.padStart(2, '0') !== bookingDay) {
                        showRow = false;
                    }
                    if (selectedMonth && selectedMonth.padStart(2, '0') !== bookingMonth) {
                        showRow = false;
                    }
                    if (selectedYear && selectedYear !== bookingYear) {
                        showRow = false;
                    }

                    // If all fields are empty, show all rows
                    if (!selectedDay && !selectedMonth && !selectedYear) {
                        showRow = true;
                    }

                    if (showRow) {
                        row.style.display = "";
                    } else {
                        row.style.display = "none";
                    }
                });

                calculateTotal();
            }

            document.addEventListener('DOMContentLoaded', function () {
                calculateTotal();
            });

        </script>
    </body>
</html>
