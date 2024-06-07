<%-- 
    Document   : AdPro
    Created on : Jun 5, 2024, 8:23:28 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Admin Profile</title>
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
            />
        <style>
            .admin-profile {
                width: 100%;
                background-image: url('<%=request.getContextPath()%>/img/background/bg2.jpg'); /* Đường dẫn đến hình ảnh */
                background-size: cover; /* Phủ kín toàn bộ phần nền */
                background-position: center; /* Canh chỉnh vị trí ảnh */
                background-color: rgba(255, 255, 255, 0.1);
                padding: 90px 510px;
                box-sizing: border-box;
                display: flex;
                flex-direction: column;
                gap: 20px;
                flex-grow: 1; /* Make the stadium list take the available space */
            }
            .admin-inf {
                background: #ffffff;
                border-radius: 4px;
                border-style: solid;
                border-color: #000000;
                border-width: 1px;
                height: 365px;
                padding: 70px 100px;
                font-size: 18px;
                position: relative;
            }
            .avatar {
                text-align: center;
            }
            .avatar i {
                margin: 16px 0px;
                font-size: 90px;
                width: 80px;
                height: 80px;
                border-radius: 50%;
            }
            .stadium-item img {
                width: 80px; /* Increase image size */
                height: 80px; /* Increase image size */
                border-radius: 50%;
            }
            .admin-details {
                margin-top: 60px;
                margin-left: 20px;
            }
            .admin-details div {
                margin: 10px 10px;
            }
            .admin-actions {
                margin: 60px;
                display: flex;
                flex-direction: column;
                align-items: center;
                gap: 5px;
            }
            .admin-actions a {
                background: #1f7a8c;
                color: white;
                padding: 5px 10px;
                border-radius: 4px;
                text-decoration: none;
                cursor: pointer;
            }
            .admin-actions a:hover {
                background: #145569;
            }
            .phone{
                display: flex;
                align-items: center;
            }
            .phone .fa-star {
                color: gold;
                margin-left: 5px;
            }
        </style>
    </head>
    <body>
        <jsp:include page = "AdHeader.jsp" flush = "true" />

        <div class="admin-profile">
            <div class="admin-inf" onclick="window.location.href = '#';">
                <div class="avatar">
                    <i class="fas fa-user-circle"></i>
                </div>
                <div class="admin-details">
                    <div>Nguyễn Văn A</div>
                    <div>ID</div>
                    <div class="phone">
                        <i class="fas fa-phone"></i>
                        Phone number      
                    </div>
                </div>
                <div class="admin-actions">
                    <a href="editPro.jsp">Edit Profile</a>

                    <!-- Replace 'bookingPage.jsp' with the actual booking page URL -->
                </div>
                <!-- Details button removed, click on item for details -->
            </div>
            <!-- Repeat the above stadium-item div for each stadium entry -->
        </div>
    </body>
</html>
