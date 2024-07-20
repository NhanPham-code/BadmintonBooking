<%-- 
    Document   : CusProfile
    Created on : Jun 7, 2024, 3:44:25 PM
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
            />
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
            />
        <style>
            body {
                margin: 0;
                font-family: "Inter", serif;
                background: white;
                display: flex;
                flex-direction: column;
                min-height: 100vh;
            }
            .cus-profile {
                width: 100%;
                background: url('<%=request.getContextPath()%>/img/background/bg3.jpg') no-repeat center center;
                background-size: cover;
                min-height: 100vh;
                padding: 55px 0;
                display: flex;
                justify-content: center;
                align-items: center;
                flex-direction: column;
                gap: 20px;
            }

            .cus-inf {
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                background: rgba(255, 255, 255, 0.9);
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                width: 400px;
                padding: 20px;
                text-align: center;
            }

            .avatar {
                font-size: 5rem;
                color: #1f7a8c;
                margin-bottom: 20px;
            }

            .avatar i {
                font-size: 100px;
                width: 100px;
                height: 100px;
                border-radius: 50%;
            }

            .cus-details {
                margin-top: 20px;
                font-size: 16px;
            }

            .cus-details div {
                margin: 10px 0;
            }

            .cus-actions {
                margin-top: 20px;
                display: flex;
                gap: 20px;
            }

            .cus-actions a {
                background: #145569;
                color: white;
                padding: 10px 20px;
                border-radius: 4px;
                text-decoration: none;
                text-align: center;
                display: inline-block;
                transition: background 0.3s;
                width: 150px;
            }

            .cus-actions a:hover {
                background: #1f7a8c;
            }

            .phone {
                display: flex;
                align-items: center;
                justify-content: center;
            }

            .phone i {
                margin-right: 5px;
                color: #1f7a8c;
            }

            h2 {
                font-size: 24px;
                color: #333;
                margin-bottom: 20px;
            }

            .footer {
                background: #022B3A;
                color: white;
                display: flex;
                justify-content: center;
                align-items: center;
                padding: 10px;
                box-sizing: border-box;
                margin-top: auto;
                width: 100%;
            }
        </style>
    </head>
    <body>
        <jsp:include page="CusHeaderNoSearch.jsp" flush="true" />

        <div class="cus-account">
            <div class="cus-profile">
                <div class="cus-inf">
                    <div class="avatar">
                        <i class="fas fa-user-circle"></i>
                    </div>
                    <h2>${requestScope.name}'s Profile</h2>
                    <div class="cus-details">
                        <c:set var="customer" value="${requestScope.customer}"></c:set>
                        <c:set var="account" value="${requestScope.account}"></c:set>
                        <div>Your ID: ${customer.customer_ID}</div>
                        <div>Your Name: ${customer.customer_Name}</div>
                        <div class="phone">
                            <i class="fas fa-phone"></i>
                            Phone: ${customer.customer_Phone}
                        </div>
                        <div>Email: ${account.email}</div>
                    </div>
                    <div class="cus-actions">
                        <a href="editProfile">Edit Profile</a>
                        <a href="changePassword">Change Password</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer">
            <p>&copy; 2024 Badminton Stadium Booking System. All rights reserved.</p>
        </div>
    </body>
</html>
