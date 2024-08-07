<%-- 
    Document   : CusPopular
    Created on : Jun 8, 2024, 11:18:08 AM
    Author     : NhiTCU
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Popular Stadium</title>

        <style>
            body{
                min-height:100vh;
            }
            .Pop-bg {
                display: grid;
                grid-template-columns: 32.5% 32.5% 32.5%;
                padding: 10px;
                align-items: center;
                justify-items: center;
                width: 100%;
                padding: 20px;
                box-sizing: border-box;
                flex-direction: column;
                gap: 20px;
                flex-grow: 1;
                background-image: url('<%=request.getContextPath()%>/img/background/bg3.jpg');
                background-repeat: no-repeat;
                background-size: cover;
                background-position: center;
            }
            .SO-profile {
                border: 1px solid;
                border-radius: 8px;
                width: 60%;
                background: #ffffff;
                padding: 55px 20px;
                box-sizing: border-box;
                height: 80%;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                cursor: pointer;

            }

            .cus-inf img {
                width:210px;
                height: 150px;
                border-radius: 8px;
                object-fit: cover;
            }

            .rating i {
                color: gold;
            }

            .owner-detail {
                display: flex;
                padding-bottom: 15px;
                padding-top: 15px;
                justify-content: center;
            }

            button{
                background: #1f7a8c;
                border: none;
                color: white;
                padding: 5px 10px;
                border-radius: 4px;
                cursor: pointer;
                display: flex;
                align-items: center;
                justify-content: center;
            }
            button:hover {
                background: #145569;
            }
        </style>
    </head>
    <body>
        <jsp:include page = "CusHeader.jsp" flush = "true" />

        <div class="Pop-bg">
            <c:forEach var="stadium" items="${requestScope.stadium}">
                <div class="SO-profile">
                    <div class="cus-inf" onclick="window.location.href = 'stadiumDetail?stadiumID=${stadium.stadium_ID}';">
                        <img src="${stadium.stadium_image}" alt="Stadium" style="padding: 30px;">
                        <div style="text-align: center; font-size: 17px;  padding: 0 8%; margin-bottom: 10px"><b>${stadium.stadium_name}</b></div>
                        <div class="owner-info" style="padding: 0 15%;">
                            <div>
                                <i class="fas fa-map-marker-alt"></i>
                                ${stadium.stadium_address}</div>
                            <div class="phone">
                                <i class="fas fa-phone"></i>
                                ${stadium.stadium_phone}
                            </div>
                            <div class="rating">
                                Rating: ${stadium.avg_ratingScore}/5
                                <i class="fas fa-star"></i>
                            </div>
                        </div>
                        <div class="owner-detail" style="padding: 30px;">
                            <button onclick="window.location.href = 'stadiumDetail?stadiumID=${stadium.stadium_ID}';">Detail</button>
                            <!-- Replace 'bookingPage.jsp' with the actual booking page URL -->
                        </div>
                        <!-- Details button removed, click on item for details -->
                    </div>
                    <!-- Repeat the above stadium-item div for each stadium entry -->
                </div>

            </c:forEach>
        </div>
        <jsp:include page = "CusFooter.jsp" flush = "true" />
    </body>
</html>
