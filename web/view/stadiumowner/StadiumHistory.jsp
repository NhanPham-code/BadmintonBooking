<%-- 
    Document   : StadiumHistory
    Created on : Jun 7, 2024, 8:19:07 AM
    Author     : ADMIN
--%>

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
                background-color: #BFDBF7; /* Màu nền */
                padding: 10px;
                font-size: 14px;
            }
            .booking-history button {
                padding: 10px;
                cursor: pointer;
                background-color: #D3E4F5; /* Lighter background color */
                color: #000000;
                border: none;
                font-size: 16px;
                transition: background-color 0.3s, color 0.3s; /* Smooth transition */
                outline: none;
            }
            .booking-history button:hover {
                background: #57A1BA; /* Even lighter hover color */
                border-radius: 4px; /* Change text color */
            }
            .datePickerContainer {
                position: relative;
                display: inline-block;
                display: flex;
                align-items: center;
                margin-left: 1310px;
            }

            .datePickerContainer input[type="date"] {
                padding: 8px 12px; /* Thay đổi padding nếu cần */
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

            table {
                width: 90%;
                border-collapse: collapse;
                margin-top: 20px;
                margin-left: auto;
                margin-right: auto;

            }
            th, td {
                border: 2px solid #000000;
                padding: 8px;
                text-align: left;
                background-color: #ffffff;
            }
            th {
                background-color: #BFDBF7; /* Background color same as Booking History */
            }
            .action-buttons a {
                text-decoration: none; /* Remove underline */
                padding: 5px 10px;
                background-color: #4CAF50;
                color: white;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                outline: none;
                display: flex;
                justify-content: center
            }
            .action-buttons a:hover {
                opacity: 0.8;
            }
            .column-name {
                width: 480px;
                text-align: center;
            }
            .column-phone {
                width: 220px;
                text-align: center;
            }
            .column-date{
                width: 200px;
                text-align: center;
            }
            .column-time {
                width: 200px;
                text-align: center;
            }
            .column-action {
                width: 237px;
                text-align: center;
            }

        </style>
    </head>

    <body>
        <%@ include file="HeaderStadiumOwner.jsp" %>
        <div class="booking-history">
            <button>Booking history</button>
        </div>
        <div style="height: 5px;"></div>

        <div class="datePickerContainer">
            <input type="date" id="selectedDate1">

        </div>

        <table>
            <thead>
                <tr>
                    <th>BookingID</th>
                    <th class="column-name">Customer Name</th>
                    <th class="column-phone">Phone Number</th>
                    <th class="column-date">Date</th>
                    <th class="column-time">Time</th>
                    <th class="column-action">Action</th>

                </tr>
            </thead>
            <tbody>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td class="action-buttons">
                        <a href="#" class="detail">Detail</a>
                    </td>
                </tr>

            </tbody>
        </table>
        <div class="totalRow">
            <div id="totalRow" style="display: none;">Total: <span id="totalAmount"></span></div>
        </div>

        <script>
            var totalRowVisible = false;

            document.getElementById("selectedDate1").addEventListener("change", function () {
                var totalRow = document.getElementById("totalRow");
                if (totalRowVisible) {
                    totalRow.style.display = "none";
                    totalRowVisible = false;
                } else {
                    totalRow.style.display = "block";
                    totalRowVisible = true;
                }
            });
        </script>



    </body>
</html>
