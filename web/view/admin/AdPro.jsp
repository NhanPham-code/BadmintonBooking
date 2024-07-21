<%-- 
    Document   : AdPro
    Created on : Jun 5, 2024, 8:23:28 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>User Account</title>
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
            />
        <style>
            .cus-profile {
                width: 100%;
                background: url('<%=request.getContextPath()%>/img/background/bg3.jpg');
                padding: 55px 55px;
                box-sizing: border-box;
                display: flex;
                justify-content: center;
                align-items: center; /* Center items vertically */
                flex-direction: column;
                gap: 20px;
                flex-grow: 1; /* Make the stadium list take the available space */
                background-repeat: no-repeat;
                background-size: cover;
                background-position: center;
                min-height: 100vh;
            }
            body {                
                margin: 0;
                padding: 0;
                font-family: 'Inter', sans-serif;
                background-image: url('<%=request.getContextPath()%>/img/background/bg3.jpg');
                background-repeat: no-repeat;
                background-size: cover;
                background-position: center;
                min-height: 100vh;
            }
            .cus-inf {
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                background: #ffffff;
                border-radius: 4px;
                border-style: solid;
                border-color: #000000;
                border-width: 1px;
                width: 20%;
                height: 445px;
                padding: 30px 100px;
                position: relative;
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


            .avatar {
                font-size: 5rem;
                color: #1f7a8c;
                text-align: center;
                margin-bottom: 20px;
            }
            .avatar i {
                margin: 16px 0px;
                font-size: 100px;
                width: 90px;
                height: 90px;
                border-radius: 50%;
            }
            .cus-account{
                display: flex;
            }
            .cus-details {
                margin-top: 20px;
            }
            .cus-details div {
                margin: 10px 10px;
            }
            .change-pass {
                margin-top: 60px;
            }
            .change-pass a {
                background: #1f7a8c;
                color: white;
                padding: 5px 10px;
                border-radius: 4px;
                text-decoration: none;
                cursor: pointer;
            }
            .change-pass a:hover {
                background: #145569;
            }
            .cus-actions {
                margin-top: 60px;
                display: flex;
                gap: 30px; /* Add gap to create space between the buttons */
            }

            .cus-actions a {
                background: #145569;
                color: white;
                padding: 5px 10px;
                border-radius: 4px;
                cursor: pointer;
                text-decoration: none;
                text-align: center; /* Center text horizontally */
                display: flex;
                justify-content: center;
                align-items: center; /* Center text vertically */
                width: 100px; /* Set a fixed width */
            }

            .cus-actions a:hover {
                background: #1f7a8c;
            }
            .phone {
                display: flex;
                align-items: center;
            }
            .phone .fa-star {
                color: gold;
                margin-left: 5px;
            }
            h2 {
                text-align: center;
                margin-bottom: 20px;
            }
            
            .footer {
                justify-content: space-around;
                display: flex;
                align-items: center;
                padding: 10px;
                box-sizing: border-box;
            }
            .footer div {
                margin: 5px 0;
            }
        </style>
    </head>
    <body>
        <jsp:include page="AdHeader.jsp" flush="true" />

        <div class="cus-account">
            <div class="cus-profile">
                <div class="cus-inf" onclick="window.location.href = '#';">
                    <div class="avatar">
                        <i class="fas fa-user-circle"></i>
                    </div>
                    <h2> ${requestScope.name}'s Profile</h2>
                    <div class="cus-details">
                        <c:set var="admin" value="${requestScope.admin}"></c:set>
                        <c:set var="account" value="${requestScope.account}"></c:set>
                        <div>Your ID: ${admin.admin_ID}</div>
                        <div>Your Name:${admin.admin_name}</div>

                        <div class="phone">
                            <i class="fas fa-phone"></i>
                            Phone: ${admin.admin_phone}
                        </div>
                        <div>Email: ${account.email}</div>
                    </div>
                    <div class="cus-actions">
                        <a href="editProfile">Edit Profile</a>
                        <a href="changePassword">Change password</a>
                        <!-- Replace 'bookingPage.jsp' with the actual booking page URL -->
                    </div>
                    <!-- Details button removed, click on item for details -->
                </div>
                <!-- Repeat the above stadium-item div for each stadium entry -->
            </div>

        </div>
        <div class="footer">
            <div>CONTACT US: 0778289817</div>
            <div>EMAIL: bookingsystem3105@gmail.com</div>
        </div>
    </body>
</html>


