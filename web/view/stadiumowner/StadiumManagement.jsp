<%-- 
    Document   : StadiumMangement
    Created on : Jun 7, 2024, 12:12:06 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer HomePage</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <style>
            body {
                margin: 0;
                font-family: 'Inter', sans-serif;
                background: white;
                display: flex;
                flex-direction: column;
                min-height: 100vh;
            }

            .add {
                background: #E3E6ED;

            }

            .stadium-list {
                width: 100%;
                background: #E3E6ED;
                padding: 20px;
                box-sizing: border-box;
                display: flex;
                flex-direction: column;
                gap: 20px;
                flex-grow: 1;
                /* Make the stadium list take the available space */
            }

            .stadium-item {
                display: flex;
                justify-content: space-between;
                align-items: center;
                background: #FFFFFF;
                padding: 20px;
                /* Increase padding for larger appearance */
                border: 1px solid black;
                box-shadow: 0 4px 4px rgba(0, 0, 0, 0.25);
                font-size: 18px;
                /* Increase font size */
                position: relative;
                /* Position for the overlay effect */
                cursor: pointer;
                transition: transform 0.3s ease;
                /* Smooth transform transition */
            }

            .stadium-item:hover {
                transform: scale(1.005);
                /* Slightly enlarge the stadium item */
            }

            .stadium-item img {
                width: 80px;
                /* Increase image size */
                height: 80px;
                /* Increase image size */
                border-radius: 50%;
            }

            .stadium-details {
                flex-grow: 1;
                margin-left: 20px;
            }

            .stadium-details div {
                margin: 5px 0;
            }

            .stadium-actions {
                display: flex;
                flex-direction: column;
                align-items: flex-end;
                gap: 5px;
            }

            .stadium-actions a {
                text-decoration: none; /* Remove underline */
                padding: 5px 10px;
                margin-left: 10px;
                background-color: #4CAF50;
                color: white;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                outline: none;
                display: flex;
                justify-content: center
            }

            .stadium-actions a:hover {
                opacity: 0.8;
            }

            .footer {
                justify-content: space-around;
                display: flex;
                align-items: center;
                padding: 10px;
                /* Reduce padding to make footer smaller */
                margin-top: auto;
                /* Push the footer to the bottom */
            }

            .footer div {
                margin: 5px 0;
            }

            .rating {
                display: flex;
                align-items: center;
            }

            .rating .fa-star {
                color: gold;
                margin-left: 5px;
            }

            #add-new-btn {
                background-color: #5f88e6;
                color: #E3E6ED;
                border: none;

                width: 150px;
                /* Chiều rộng */
                height: 30px;
                /* Chiều cao */
                font-size: 18px;
                /* Kích thước chữ */
                cursor: pointer;
                margin-left: 1340px;
                transition: background-color 0.3s;
                /* Hiệu ứng hover */
                margin-top: 10px;
            }

            #add-new-btn:hover {
                opacity: 0.8;
            }
        </style>
    </head>

    <body>
        <%@ include file="HeaderStadiumOwner.jsp" %>      
        <div class="add">
            <button id="add-new-btn">New Stadium</button>
        </div>

        <div class="stadium-list">
            <div class="stadium-item" onclick="window.location.href = '#';">
                <img src="<%=request.getContextPath()%>/img/court/c8.jpg" alt="Stadium">
                <div class="stadium-details">
                    <div>Sân vận động TAINTAY</div>
                    <div>222/66 Nguyễn Văn Cừ, An Hòa, Ninh Kiều, CT</div>
                    <div class="rating">
                        Rating: 4/5
                        <i class="fas fa-star"></i>
                    </div>
                </div>
                <div class="stadium-actions">
                    <a href="">Delete</a>
                    <!-- Replace 'bookingPage.jsp' with the actual booking page URL -->
                </div>

                <div class="stadium-actions">
                    <a href="">Details</a>
                    <!-- Replace 'bookingPage.jsp' with the actual booking page URL -->
                </div>
                <!-- Details button removed, click on item for details -->
            </div>
            <!-- Repeat the above stadium-item div for each stadium entry -->
        </div>


    </body>

</html>