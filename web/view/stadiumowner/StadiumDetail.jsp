<%-- 
    Document   : BookingDetail
    Created on : Jun 7, 2024, 9:45:00 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Badminton Stadium Booking System</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #bfdbf7;
                margin: 0;
                padding: 0;
                background-image: url('<%=request.getContextPath()%>/img/background/bg3.jpg');
                background-repeat: no-repeat;
                background-size: cover;
                background-position: center;
            }
            .container {
                display: flex;
                justify-content: center;
                flex-direction: column;
                max-width: 1300px;
                background-color: #f5f5f5;
                color: black;
                border-radius: 5px;
                margin-top: 20px;
                margin-bottom: 20px;
                margin-left: 60px;
            }
            .top-container {
                text-align: center;
                background-color: #f5f5f5;
                color: black;
                border-radius: 5px;
            }
            .top-container img {
                margin-top: 20px;
                width: 80%;
                height:300px;
                border-radius: 5px;
            }
            .flex-container {
                display: flex;
                justify-content: space-between;
                padding: 0px 20px;
                background-color: #f5f5f5;
                color: black;
                border-radius: 5px;
                margin-top: 20px;
            }
            .left-container, .right-container {
                flex: 1;
                margin-right: 20px;
            }
            .right-container {
                margin-right: 0;
            }
            .table-container{
                background-color: #022B3A;
                padding: 20px;
                border-radius: 5px;
                margin-bottom: 20px;
                height: 530px;
            }

            .feedback-container {
                height: 550px; /* Set a max height for scrollbar to appear */
                /* Enable vertical scrollbar */
                border: 1px solid #ccc;
                padding: 10px;
                border-radius: 5px;
                background-color: #022B3A;
                display: block;
            }
            .table-container table {
                width: 100%;
                border-collapse: collapse;
                max-height: 200px;
                border-radius: 5px;
            }
            .table-container th{
                border: 2px solid #000;
                padding: 8px;
                text-align: center;
                background-color: #1F7A8C;
            }
            .table-container td {
                border: 2px solid #000;
                padding: 8px;
                text-align: center;
                background-color: #ffffff;
            }
            .stadium-info{
                display:flex;
            }
            .stadium-info img{
                margin-right: 40px;
                margin-left: 40px;
                width: 200px;
                height: 200px;
                background-color: #ccc;
                display: block;
                margin-bottom: 20px;
            }
            .feedback-item {
                border: 1px solid #ccc;
                padding: 10px;
                margin: 20px 10px;
                cursor: pointer;
                display: flex;
                align-items: center;
                background: #fff;
                border-radius: 5px;
            }
            .feedback-item i {
                font-size: 50px;
                margin-right: 10px;
            }
            .feedback-item.selected {
                background-color: #b5eaff;
            }
            .feedback-content {
                flex-grow: 2;
            }
            .feedback-rating {
                font-size: 14px;
            }
            .feedback-name {
                font-size: 16px;
                font-weight: bold;
                margin-bottom: 5px;
            }
            .feedback-description {
                margin-bottom: 5px;
            }
            .feedback-list{
                overflow-y: scroll;
                height:450px;
                background-color: #0d4b64;
                margin:0px 15px;

            }
            .filter-container {
                display: flex;
                align-items: center;
                margin-left: 55%;
            }
            .filter-button {
                padding: 5px 10px;
                font-size: 14px;
                border: 1px solid #ccc;
                border-radius: 5px;
                cursor: pointer;
                background-color: #f0f0f0;
                outline: none;
                margin-left: 10px;
            }
            .filter-dropdown select {
                padding: 5px;
                font-size: 14px;
                border: 1px solid #ccc;
                border-radius: 5px;
                cursor: pointer;
                margin-left: 5px;
            }
            .delete-button {
                padding: 5px 10px;
                font-size: 14px;
                border: 1px solid #ccc;
                border-radius: 5px;
                cursor: pointer;
                background-color: #f0f0f0;
                outline: none;
                margin-left: 20px;
                margin-top:10px;
            }
            .booking-btn {
                display: block;
                width: 200px;
                padding: 10px;
                background-color: #1F7A8C;
                color: white;
                text-align: center;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                margin: 20px auto;
            }
            .booking-btn:hover {
                background-color: #145569;
            }
            .rating {
                display: flex;
                align-items: center;
            }
            .rating .fa-star {
                font-size: 20px;
                color: gold;
                margin-left: 5px;
            }
            .footer {
                background: #022B3A;
                color: white;
                display: flex;
                justify-content: center;
                align-items: center;
                padding: 10px;
                box-sizing: border-box;
            }
        </style>
    </head>
    <body>
        <jsp:include page="HeaderStadiumOwner.jsp" flush="true" />
        <div class="container">
            <div class="top-container">
                <c:set var="st" value="${requestScope.stadium}"></c:set>
                <img src="${st.stadium_image}" alt="Picture">
            </div>
            <div class="flex-container">
                <div class="left-container">
                    <div class="table-container">
                        <h1 style="text-align: center;color: white;">${st.stadium_name}</h1>
                        <div class="stadium-info">
                            <img src="${st.QRcode}" alt="Stadium Background">
                            <div>
                                <p style="margin-top: 60px; color: white;">Address: ${st.stadium_address}</p>
                                <p style="color: white;">Phone Number: ${st.stadium_phone}</p>
                                <p style="color: white;">Price per hour: ${st.pricePerHour}</p>
                            </div>
                        </div>
                        <h2 style="color: white;margin-top: 30px;">Court List</h2>
                        <table>
                            <thead>
                                <tr>
                                    <th style="color: white;">Court Number</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="c" items="${requestScope.courtList}">
                                    <tr>
                                        <td>${c.number}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="right-container">
                    <div class="feedback-container">
                        <div style="display: flex; justify-content: space-between;">
                            <h2 style="color: white;">Feedback</h2>
                            <form class="filter-container" action="feedbackFilter" method="GET">
                                <div class="filter-dropdown">
                                    <select id="rating-filter" name="rating">
                                        <option value="all">All</option>
                                        <option value="5">5 stars</option>
                                        <option value="4">4 stars</option>
                                        <option value="3">3 stars</option>
                                        <option value="2">2 stars</option>
                                        <option value="1">1 star</option>
                                    </select>
                                </div>
                                <input type="hidden" id="stadiumID" name="stadiumID" value="${st.stadium_ID}">
                                <button id="filter-button" type="submit" class="filter-button">Filter</button>
                            </form>
                        </div>
                        <form id="deleteFeedbackForm" action="deleteFeedback" method="POST">
                            <div class="feedback-list">
                                <c:forEach var="fb" items="${requestScope.feedbackList}">
                                    <div class="feedback-item" data-feedback-id="${fb.customer.customer_ID}" data-rating="${fb.ratingScore}">
                                        <i class="fas fa-user-circle"></i>
                                        <div class="feedback-content">
                                            <p class="feedback-name">${fb.customer.customer_Name}</p>
                                            <p class="feedback-description">${fb.description}</p>
                                            <div class="rating">
                                                <p class="feedback-rating">Rating Score: ${fb.ratingScore}</p>
                                                <i class="fas fa-star"></i>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </form>

                        <script>
                            function deleteSelectedFeedback() {
                                var selectedFeedbackIds = [];
                                document.querySelectorAll('.feedback-item.selected').forEach(function (item) {
                                    selectedFeedbackIds.push(item.getAttribute('data-feedback-id'));
                                });

                                if (selectedFeedbackIds.length === 0) {
                                    alert('Please select at least one feedback item to delete.');
                                    return;
                                }

                                if (confirm('Are you sure you want to delete the selected feedback?')) {
                                    var selectedFeedbackString = selectedFeedbackIds.join('_');
                                    document.getElementById('selectedFeedback').value = selectedFeedbackString;
                                    document.getElementById('deleteFeedbackForm').submit();
                                }
                            }

                            document.querySelectorAll('.feedback-item').forEach(function (item) {
                                item.addEventListener('click', function () {
                                    this.classList.toggle('selected');
                                });
                            });
                        </script>
                    </div>
                </div>
            </div>
            <button class="booking-btn">Delete Stadium</button>
        </div>
        <div class="footer">
            <p>&copy; 2024 Badminton Stadium Booking System. All rights reserved.</p>
        </div>
    </body>
</html>


