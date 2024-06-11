<%-- 
    Document   : ConfirmBooking
    Created on : Jun 10, 2024, 12:16:35 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirm Booking</title>
        <style>
            body {
                font-family: "Inter", sans-serif;
                background-color: #f4f4f9;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                margin: 0;
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
                background-image: url('<%=request.getContextPath()%>/img/background/bg3.jpg');
                background-repeat: no-repeat;
                background-size: cover;
                background-position: center;
                align-items: center;
            }

            .confirmation-container {
                background: rgba(255, 255, 255, 0.9);
                padding: 40px;
                border-radius: 10px;
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
                width: 80%;
                max-width: 800px;
                text-align: center;
            }

            .confirmation-container h1 {
                font-size: 32px;
                color: #022B3A;
                margin-bottom: 20px;
            }

            .details {
                text-align: left;
                margin-bottom: 20px;
            }

            .details p {
                margin: 10px 0;
                font-size: 18px;
            }

            .details p span {
                font-weight: bold;
            }

            .total {
                font-size: 24px;
                font-weight: bold;
                margin: 20px 0;
            }

            .confirm-button {
                border-radius: 6px;
                background-color: #022B3A;
                color: white;
                padding: 13px 20px;
                border: none;
                cursor: pointer;
                width: 150px;
                text-align: center;
                font-size: 16px;
                font-weight: bold;
                transition: background-color 0.3s ease, transform 0.2s ease;
            }

            .confirm-button:hover {
                background-color: #0056b3;
                transform: scale(1.05);
                opacity: 0.9;
            }

            .confirm-button:active {
                background-color: #004494;
                transform: scale(1.02);
            }

            .confirm-button:focus {
                outline: none;
                box-shadow: 0 0 0 3px rgba(0, 86, 179, 0.4);
            }

            .modal {
                display: none;
                position: fixed;
                z-index: 1;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                overflow: auto;
                background-color: rgba(0, 0, 0, 0.4);
                border-radius: 5%;
            }

            .modal-content a {
                display: inline-block;
                margin-top: 20px;
                padding: 10px 20px;
                background-color: #022B3A;
                color: white;
                text-decoration: none;
                font-size: 16px;
                font-weight: bold;
                border-radius: 6px;
                transition: background-color 0.3s ease, transform 0.2s ease;
            }

            .modal-content a:hover {
                background-color: #0056b3;
                transform: scale(1.05);
                opacity: 0.9;
            }

            .modal-content a:active {
                background-color: #004494;
                transform: scale(1.02);
            }

            .modal-content a:focus {
                outline: none;
                box-shadow: 0 0 0 3px rgba(0, 86, 179, 0.4);
            }

            .modal-content {
                background-color: #fefefe;
                color: #004494;
                margin: 15% auto;
                padding: 20px;
                border: 1px solid #888;
                width: 80%;
                max-width: 600px;
                text-align: center;
                border-radius: 5%;
            }

            .close {
                color: #aaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
            }

            .close:hover,
            .close:focus {
                color: black;
                text-decoration: none;
                cursor: pointer;
            }

            .qr-code {
                margin-top: 20px;
            }

            .qr-code img{
                width: 80%;
            }
        </style>
    </head>
    <body>



        <div class="confirmation-container">
            <h1>Confirm Booking</h1>
            <div class="details">
                <p><span>Customer Name:</span> John Doe</p>
                <p><span>Phone Number:</span> 123-456-7890</p>
                <p><span>Stadium Name:</span> Central Tennis Court</p>
                <p><span>Stadium Phone Number:</span> 098-765-4321</p>
                <p><span>Price:</span> $100</p>
                <p><span>Booking Date:</span> 2024-06-15</p>
                <p><span>Booking Time:</span> 10:00 AM - 11:00 AM</p>
                <p><span>Court Number:</span> 1 </p>
            </div>
            <div class="total">
                Total: $100
            </div>
            <button class="confirm-button" onclick="openModal()">Confirm</button>
        </div>

        <div id="myModal" class="modal">
            <div class="modal-content">
                <span class="close" onclick="closeModal()">&times;</span>
                <h2>Payment Information</h2>
                <p>Please transfer the amount to the following account:</p>
                <p>Account Name: Central Badminton Club</p>
                <p>Account Number: 123456789</p>
                <div class="qr-code">
                    <img src="<%=request.getContextPath()%>/img/QRCode/qr.png" alt="QR Code" />
                </div>
                <a href="waitAcceptPage.jsp">DONE</a>
            </div>
        </div>

        <script>
            function openModal() {
                document.getElementById("myModal").style.display = "block";
            }

            function closeModal() {
                document.getElementById("myModal").style.display = "none";
            }
        </script>
    </body>
</html>
