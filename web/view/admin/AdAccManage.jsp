<%-- 
    Document   : AdAccManage
    Created on : Jun 5, 2024, 8:39:26 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Account Management</title>
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
            />
        <style>
            .stadium-function{
                font-size: 18px;
            }
            .stadium-list {
                width: 100%;
                background: #e3e6ed;
                padding: 20px;
                box-sizing: border-box;
                display: flex;
                flex-direction: column;
                gap: 20px;
                flex-grow: 1; /* Make the stadium list take the available space */
            }
            .stadium-filter {
                display: flex;
                background: white;
                width: 120px;
                height: 42px;
                position: relative;
            }
            .role {
                padding: 10px;
                color: #000000;
                text-align: left;
                font-family: "Inter-Medium", sans-serif;
                font-size: 16px;
                font-weight: 500;
                position: relative;
                display: flex;
                align-items: center;
                justify-content: left;
            }
            .dropdown {
                position: relative;
                display: inline-block;
                margin: 10px 20px;
            }
            .dropdown-content {
                display: none;
                position: absolute;
                background-color: #f1f1f1;
                min-width: 160px;
                box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
                z-index: 1;
            }

            .dropdown-content a {
                color: black;
                padding: 12px 16px;
                text-decoration: none;
                display: block;
            }
            .dropdown:hover .dropdown-content {
                display: block;
            }
            .stadium-item {
                display: flex;
                justify-content: space-between;
                align-items: center;
                background: #ffffff;
                padding: 20px; /* Increase padding for larger appearance */
                border: 1px solid black;
                box-shadow: 0 4px 4px rgba(0, 0, 0, 0.25);
                font-size: 18px; /* Increase font size */
                position: relative; /* Position for the overlay effect */
                cursor: pointer;
                transition: transform 0.3s ease; /* Smooth transform transition */
            }
            .stadium-item:hover {
                transform: scale(1.05); /* Slightly enlarge the stadium item */
            }
            .stadium-item i {
                margin: 7px 0px;
                font-size: 60px;
                width: 80px;
                height: 80px;
                border-radius: 50%;
            }
            .avatar {
                text-align: center;
                background: #d9d9d9;
                border-radius: 50%;
                border-style: solid;
                border-color: #000000;
                border-width: 1px;
                width: 80px; /* Increase image size */
                height: 80px; /* Increase image size */
                position: relative;
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
                background: #1f7a8c;
                color: white;
                padding: 5px 10px;
                border-radius: 4px;
                text-decoration: none;
                cursor: pointer;
            }
            .stadium-actions a:hover {
                background: #145569;
            }

        </style>
    </head>
    <body>
        <jsp:include page = "AdHeader.jsp" flush = "true" />

        <div class="stadium-list">
            <div class="stadium-filter">
                <div class="role">Role</div>
                <div class="dropdown">
                    <button class="dropbt">
                        <i class="fa fa-caret-down"></i>
                    </button>
                    <div class="dropdown-content">
                        <a href="#">Customers</a>
                        <a href="#">Stadium Owners</a>
                    </div>
                </div>
            </div>
            <div class="stadium-item" onclick="window.location.href = 'AdCusAcc.jsp';">
                <div class="avatar">
                    <i class="fas fa-user-circle"></i>
                </div>
            </div>
            <div class="stadium-details">
                <div>Username</div>
                <div>Phone number</div>
            </div>
            <div class="stadium-actions">
                <a href="bookingPage.jsp">Delete</a>
                <!-- Replace 'bookingPage.jsp' with the actual booking page URL -->
            </div>
            <!-- Details button removed, click on item for details -->
        </div>
        <!-- Repeat the above stadium-item div for each stadium entry -->
    </div>
</body>
</html>

