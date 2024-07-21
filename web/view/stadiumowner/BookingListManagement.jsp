<%-- 
    Document   : StadiumMangement
    Created on : Jun 7, 2024, 12:12:06 PM
    Author     : NhanNQT
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer HomePage</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <style>
            .add {
                background: #E3E6ED;

            }

            .stadium-list {
                width: 100%;
                background: url('<%=request.getContextPath()%>/img/background/bg3.jpg') no-repeat center center;
                background-repeat: no-repeat;
                background-size: cover;
                background-position: center;
                min-height: 75vh;
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
                border: 1px solid #ddd;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                border-radius: 8px;
                transition: transform 0.3s ease, box-shadow 0.3s ease;
                cursor: pointer;
            }

            .stadium-item:hover {
                transform: translateY(-5px);
                box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            }
            .stadium-item img {
                width: 80px;
                height: 80px;
                border-radius: 8px;
                object-fit: cover;
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
                position: absolute;
                bottom: 0;
                justify-content: space-around;
                display: flex;
                align-items: center;
                padding: 10px 20px;
                box-sizing: border-box;
                width: 100%;
                background: #022B3A;
                color: white;
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

        <div class="stadium-list">
            <c:forEach items="${listStd}" var="st">
                <div class="stadium-item" onclick="window.location.href = 'bookingManage?stadiumID=${st.stadium_ID}&stadiumName=${st.stadium_name}';">
                    <img src="${st.stadium_image}" alt="Stadium">
                    <div class="stadium-details">
                        <div>${st.stadium_name}</div>
                        <div>${st.stadium_address}</div>
                        <div class="rating">
                            Rating: ${st.avg_ratingScore}
                            <i class="fas fa-star"></i>
                        </div>
                    </div>
                    <div class="stadium-actions">
                        <a href="bookingManage?stadiumID=${st.stadium_ID}">Booking</a>
                        <!-- Replace 'bookingPage.jsp' with the actual booking page URL -->
                    </div>
                    <!-- Details button removed, click on item for details -->
                </div>
                <!-- Repeat the above stadium-item div for each stadium entry -->
            </c:forEach>
        </div>
        <div class="footer">
            <div>CONTACT US: 0778289817</div>
            <div>EMAIL: bookingsystem3105@gmail.com</div>
        </div>
    </body>

</html>