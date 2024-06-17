<%-- 
    Document   : AdStaManage
    Created on : Jun 6, 2024, 12:21:07 PM
    Author     : ADMIN
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
            .footer {
                width: 100%;
                background: #022B3A;
                color: white;
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 10px 20px;
                box-sizing: border-box;
            }
            
            .banner {
                width: 100%;
                height: 149px;
                background: url('<%=request.getContextPath()%>/img/background/bg1.jpg') no-repeat center center;
                background-size: cover;
                display: flex;
                justify-content: center;
                align-items: center;
                color: black;
                font-size: 32px;
                font-weight: 700;
                border-bottom: 1px solid black;
            }
            
            .stadium-list {
                width: 100%;
                padding: 20px;
                box-sizing: border-box;
                display: flex;
                flex-direction: column;
                gap: 20px;
                flex-grow: 1;
                background-image: url('<%=request.getContextPath()%>/img/background/bg3.jpg');
                background-repeat: no-repeat;
                background-size: cover;
                background-position: center;
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
                background: #1F7A8C;
                color: white;
                padding: 5px 10px;
                border-radius: 4px;
                text-decoration: none;
                cursor: pointer;
            }
            .stadium-actions a:hover {
                background: #145569;
            }
            .footer {
                justify-content: space-around;
                display: flex;
                align-items: center;
                padding: 10px;
                margin-top: auto;
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
            
            .error-message {
                color: brown;
                font-weight: bold;
                margin: 20px 0;
                text-align: center;
            }
        </style>
    </head>
    <body>
       <jsp:include page="AdHeader.jsp" flush="true" />

        <div class="stadium-list">
            
            <div class="error-message"><h1>${requestScope.err}</h1></div>
            
            <c:forEach var="st" items="${requestScope.stList}">
                <div class="stadium-item" onclick="window.location.href = 'stadiumDetail?stadiumID=${st.stadium_ID}';">
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
                        <a href="bookingPage.jsp">Booking</a>
                    </div>
                </div>
            </c:forEach>
        </div>

        <div class="footer">
            <div>CONTACT US: 0778289817</div>
            <div>EMAIL: group1@gmail.com</div>
        </div>
    </body>
</html>
