<%-- 
    Document   : BookingDetail
    Created on : Jun 7, 2024, 9:45:00 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Badminton Stadium Booking System</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #bfdbf7;
                margin: 0;
                padding: 0;
            }

            .content {
                padding: 20px;
            }

            .container {
                display: flex;
                flex-direction: row;
                justify-content: space-between;
                padding: 40px;
                max-width: 1300px;
                margin: auto;
                background-color: #f5f5f5;
                color: black;
                border-radius: 5px;
                margin-top: 20px;
                margin-bottom: 20px;
            }

            .left {
                flex: 1;
                margin-right: 20px;
            }

            .right {
                flex: 2;
                text-align: center;
            }

            .left img {
                width: 60%;
                height: 200px;
                background-color: #ccc;
                display: block;
                margin-bottom: 20px;
                
            }

            .right img {
                width: 100%;
                height: 300px;
                background-color: #ccc;
                display: block;
                margin-bottom: 20px;
            }

            .table-container {
                height: 200px;
                max-height: 200px;
                /* Đặt chiều cao tối đa cho bảng */
                overflow-y: scroll;
                border: 1px solid #ccc;
                /* Thêm viền cho bảng */
                padding: 10px;
                /* Thêm padding để tạo khoảng cách */
            }

            .table-container table {
                width: 100%;
                border-collapse: collapse;
            }

            .table-container th,
            .table-container td {
                border: 2px solid #000000;
                padding: 8px;
                text-align: center;
            }

            .table-container th {
                background-color: #f2f2f2;
            }

            .table-container button {
                padding: 5px 10px;
                background-color: #4CAF50;
                color: white;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                outline: none;

            }

            .table-container button.delete {
                text-decoration: none; /* Remove underline */

                justify-content: center;
                display: inline-block;
                margin: 0 auto;
            }

            .table-container button:hover {
                opacity: 0.8;
            }

            .table-container .new-court-btn {
                position: absolute;
                top: 50%;
                transform: translateY(-50%);
            }

            .table-container th:nth-child(4),
            .table-container td:nth-child(4) {
                border: none;
            }


            .new-court-btn {
                margin-bottom: 10px;
                margin-top: 48px;
                margin-left: 670px;
                padding: 10px 10px;
                /* Thêm padding để tạo kích thước cho nút */
                background-color: #4CAF50;
                /* Màu nền ban đầu */
                color: white;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                transition: background-color 0.3s;
                /* Tạo hiệu ứng chuyển đổi màu mượt mà */
                outline: none;
            }

            .new-court-btn:hover {
                background-color: #45a049;
                /* Màu nền khi hover */
            }

            .new-court-btn:active {
                background-color: #367e3a;
                /* Màu nền khi active (khi nhấn vào nút) */
                outline: none;
            }

            .feedback-container {
                width: 400px;
                height: 200px;
                overflow-y: scroll;
                border: 1px solid #ccc;
                padding: 10px;
            }

            .feedback-item {
                display: flex;
                margin-bottom: 20px;
                align-items: center;
                /* Canh chỉnh dọc các phần tử */
            }

            .feedback-item-image {
                width: 50px !important;
                height: 50px !important;
                border: 1px solid #ccc;
                margin-right: 10px;
                border-radius: 50%;
                /* Chuyển hình ảnh thành hình tròn */
            }



            .feedback-content {
                flex-grow: 1;
            }

            .feedback-rating {
                font-weight: bold;
            }

            .feedback-name {
                font-size: 14px;
                font-weight: bold;
                margin-bottom: 5px;
            }

            .feedback-description {
                margin-bottom: 5px;
            }

            .filter-container {
                display: flex;
                align-items: center;
                margin-bottom: 10px;


            }

            
            .filter-label {
                margin-right: 10px;

            }

            .filter-button {
                padding: 5px 10px;
                font-size: 14px;
                border: 1px solid #ccc;
                border-radius: 5px;
                cursor: pointer;
                background-color: #f0f0f0;
                outline: none;
            }

            .title {
                text-align: center;
                /* Canh giữa nội dung */
                margin-top: 20px;
                /* Khoảng cách trên cùng */
            }

            /* Change background color and text color when button is active (clicked) */
            .filter-button:active {
                background-color: #ccc;
                color: #000;
                /* Change text color to black */
                outline: none;
            }

            .filter-button:focus {
                outline: none;
            }

            .update-btn {
                display: block;
                width: 100px;
                padding: 10px;
                background-color: #004d40;
                color: white;
                text-align: center;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                margin: 0 auto;
                margin-left: 150px;
                margin-top: 50px;
            }
        </style>

    </head>

    <body>
        <%@ include file="HeaderStadiumOwner.jsp" %>
        <div class="container">

            <div class="left">
                <img src="<%=request.getContextPath()%>\img\QRCode\qr.png" alt="Stadium Background">
                <p>Name Badminton Stadium: Sân Đại Á</p>
                <p>Address: 298 Mậu Thân, An Hòa, Ninh Kiều, Cần Thơ</p>
                <p>Phone Number: 0893129217</p>
                <p>Price per hours</p>
                <div class="filter-container">
                    <button id="filter-button" class="filter-button">Filter</button>
                    <div class="filter-dropdown">
                        <select id="rating-filter">
                            <option value="all">All</option>
                            <option value="5">5 stars</option>
                            <option value="4">4 stars</option>
                            <option value="3">3 stars</option>
                            <option value="2">2 stars</option>
                            <option value="1">1 star</option>
                        </select>
                    </div>
                </div>

                <div class="feedback-container">
                    <div class="feedback-item" data-rating="5">
                        <img src="path_to_image1.jpg" alt="Image 1" class="feedback-image feedback-item-image">

                        <div class="feedback-content">
                            <p class="feedback-name">John Doe</p>
                            <p class="feedback-description">Description for Feedback 1</p>
                            <p class="feedback-rating">Rating: 5 stars</p>
                        </div>
                    </div>

                    <!-- Thêm các phản hồi khác nếu cần -->
                </div>
            </div>

            <div class="right">
                <img src="<%=request.getContextPath()%>\img\court\c2.jpg" alt="Picture">
                <button class="new-court-btn">Add New Court</button>
                <div class="table-container">
                    <table>
                        <thead>
                            <tr>
                                
                                <th>Number</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                
                                <td></td>
                                <td><button class="delete">Delete</button></td>
                            </tr>
                            <!-- Add more rows as needed -->
                        </tbody>
                    </table>
                </div>

                <button class="update-btn">UPDATE</button>
            </div>
    </body>

</html>