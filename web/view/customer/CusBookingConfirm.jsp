<%-- 
    Document   : ConfirmBooking
    Created on : Jun 10, 2024, 12:16:35 PM
    Author     : PC
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

            /* Modal Styles */
            .modal {
                display: none; /* Hidden by default */
                position: fixed; /* Stay in place */
                z-index: 1; /* Sit on top */
                left: 0;
                top: 0;
                width: 100%; /* Full width */
                height: 100%; /* Full height */
                overflow: auto; /* Enable scroll if needed */
                background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
            }

            /* Modal Content Box */
            .modal-content {
                background-color: #fefefe;
                margin: 15% auto; /* 15% from the top and centered */
                padding: 20px;
                border: 1px solid #888;
                width: 60%; /* Could be more or less, depending on screen size */
                max-width: 500px;
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
                border-radius: 10px;
                animation: fadeIn 0.3s;
            }

            /* Close Button */
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

            /* Heading */
            .modal-content h2 {
                margin-top: 0;
                font-family: Arial, sans-serif;
            }

            /* QR Code Container */
            .qr-code img {
                display: block;
                margin: 0 auto;
                max-width: 200px;
                height: auto;
                border: 1px solid #ccc;
                border-radius: 10px;
            }

            /* File Upload Container */
            .file-upload-container {
                text-align: center;
                margin: 20px 0;
            }

            /* File Upload Label */
            .file-upload-label {
                display: inline-block;
                background-color: #4CAF50;
                color: white;
                padding: 10px 20px;
                font-size: 16px;
                border-radius: 5px;
                cursor: pointer;
            }

            .file-upload-label:hover {
                background-color: #0056b3;

            }

            /* File Upload Input */
            .file-upload-input {
                display: none;
            }

            /* File Name Display */
            .file-upload-filename {
                display: block;
                margin-top: 10px;
                font-size: 14px;
            }

            /* Confirm Button */
            .confirm-button {
                display: block;
                width: 100%;
                padding: 10px;
                background-color: #022B3A;
                color: white;
                border: none;
                border-radius: 5px;
                font-size: 16px;
                cursor: pointer;
            }

            .confirm-button:hover {
                background-color: #0056b3;
                transform: scale(1.05);
                opacity: 0.9;
            }

            /* Keyframes for Modal Animation */
            @keyframes fadeIn {
                from {
                    opacity: 0;
                }
                to {
                    opacity: 1;
                }
            }




        </style>
    </head>
    <body>
        <c:set var="st" value="${requestScope.st}"></c:set>
        <c:set var="cus" value="${requestScope.cus}"></c:set>
            <div class="confirmation-container">
                <h1>Confirm Booking</h1>
                <form action="bookingConfirm" method="post" enctype="multipart/form-data">
                    <div class="details">

                        <input type="hidden" name="customerID" value="${cus.customer_ID}"> <!-- comment -->

                    <input type="hidden" name="customerName" value="${cus.customer_Name}">
                    <p><span>Customer Name:</span> ${cus.customer_Name}</p>

                    <input type="hidden" name="phoneNumber" value="${cus.customer_Phone}">
                    <p><span>Phone Number:</span> ${cus.customer_Phone}</p>

                    <input type="hidden" name="stadiumID" value="${st.stadium_ID}">  <!-- comment -->

                    <input type="hidden" name="stadiumName" value="${st.stadium_name}">
                    <p><span>Stadium Name:</span> ${st.stadium_name}</p>

                    <input type="hidden" name="stadiumPhoneNumber" value="${st.stadium_phone}">
                    <p><span>Stadium Phone Number:</span> ${st.stadium_phone}</p>

                    <input type="hidden" name="pricePerHour" value="${st.pricePerHour}">
                    <p><span>Price Per Hour Of Court:</span> ${st.pricePerHour}.000 VND</p>

                    <c:forEach var="court" items="${requestScope.courtList}">
                        <input type="hidden" name="court_ID" value="${court.court_ID}"> <!-- comment -->
                        <p><span>Court Number:</span> ${court.number}</p>
                    </c:forEach>

                    <input type="hidden" name="bookingTime" value="${requestScope.startTime}-${requestScope.endTime}"> <!-- comment -->
                    <p><span>Booking Time:</span> ${requestScope.startTime} - ${requestScope.endTime}</p>

                    <input type="hidden" name="bookingDate" value="${requestScope.date}"> <!-- comment -->
                    <p><span>Booking Date:</span> ${requestScope.date}</p>
                </div>
                <div class="total">
                    <input type="hidden" name="total" value="${requestScope.total}"> <!-- comment -->
                    <p><span>TOTAL:</span> ${requestScope.total}.000 VND</p>
                </div>
                <button type="button" class="confirm-button" onclick="openModal()">Confirm</button>

                <div id="myModal" class="modal">
                    <div class="modal-content">
                        <span class="close" onclick="closeModal()">&times;</span>
                        <h2>Payment Information</h2>
                        <p>Please transfer the amount to the following account:</p>
                        <div class="qr-code">
                            <img src="<%=request.getContextPath()%>/${st.QRcode}" alt="QR Code" />
                        </div>
                        <div class="file-upload-container">
                            <label for="bankingImage" class="file-upload-label">Upload Banking Image</label>
                            <input type="file" id="bankingImage" name="bankingImage" class="file-upload-input" accept="image/*" required>
                            <span id="file-name" class="file-upload-filename"></span>
                        </div>
                        <br>
                        <button type="submit" class="confirm-button">DONE</button>
                    </div>
                </div>

            </form>
        </div>

        <script>
            function openModal() {
                document.getElementById("myModal").style.display = "block";
            }

            function closeModal() {
                document.getElementById("myModal").style.display = "none";
            }

            document.getElementById('bankingImage').addEventListener('change', function () {
                var fileName = this.files[0].name;
                document.getElementById('file-name').textContent = fileName;
            });


        </script>

    </body>
</html>
