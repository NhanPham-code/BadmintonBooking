<%-- 
    Document   : CusHeader
    Created on : Jun 7, 2024, 3:27:18 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Header Customer</title>
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
                font-family: "Inter", sans-serif;
                background: white;
                display: flex;
                flex-direction: column;
                min-height: 100vh;
            }
            .header {
                width: 100%;
                background: #022b3a;
                color: white;
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 10px 20px;
                box-sizing: border-box;
            }
            .header .logo {
                display: flex;
                align-items: center;
                flex-shrink: 0; /* Đảm bảo logo không co lại */
            }
            .header .logo img {
                margin-right: 10px;
                width: 50px; /* Tăng kích thước logo */
                height: 50px; /* Tăng kích thước logo */
            }
            .header .search-bar {
                flex-grow: 1;
                margin: 0 20px;
                display: flex;
                align-items: center;
                background: #d9d9d9;
                border-radius: 4px;
                padding: 5px 10px;
                max-width: 500px; /* Giảm chiều rộng của thanh tìm kiếm */
            }
            .header .search-bar input {
                border: none;
                background: transparent;
                flex-grow: 1;
                padding: 5px;
            }
            .header .search-bar button {
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
            .header .search-bar button:hover {
                background: #145569;
            }
            .header .auth-links a {
                background: none;
                border: none;
                color: white;
                padding: 10px 20px;
                border-radius: 4px;
                text-decoration: none;
                cursor: pointer;
            }
            .header .auth-links a:hover {
                background: #145569;
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
            .nav {
                width: 100%;
                background: #1f7a8c;
                display: flex;
                justify-content: space-around;
                align-items: center;
                color: white;
                padding: 10px 0;
            }
            .nav a {
                background: transparent;
                border: none;
                color: white;
                font-size: 18px;
                text-decoration: none;
                cursor: pointer;
                padding: 10px 20px;
            }
            .nav a:hover {
                background: #145569;
                border-radius: 4px;
            }
            .admin-content {
                display: flex;
                align-items: center;
                position: relative;
                flex-shrink: 0; /* Đảm bảo phần hồ sơ không co lại */
            }
            .drop {
                position: relative;
                display: flex;
                align-items: center;
                cursor: pointer;
            }
            .drop p {
                margin: 0px 30px;
            }
            .auth-links {
                display: none;
                position: absolute;
                top: 100%; /* Đảm bảo menu xuất hiện bên dưới */
                left: 50%; /* Canh giữa theo chiều ngang */
                transform: translateX(-50%); /* Dịch chuyển để canh giữa */
                background-color: #1f7a8c;
                min-width: 120px;
                box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
                z-index: 1;
            }
            .auth-links a {
                color: white; /* Thay đổi thành màu trắng */
                padding: 12px 16px;
                text-decoration: none;
                display: block;
            }
            .drop i {
                font-size: 33px;
                margin-right: 5px; /* Thêm khoảng cách giữa icon và tên người dùng */
            }
            .drop:hover .auth-links {
                display: block;
            }
        </style>
    </head>
    <body>
        <div class="header">
            <div class="logo">
                <img
                    src="<%=request.getContextPath()%>/img/logo/logo.png"
                    alt="Logo"
                    />
                <span>Badminton Stadium Booking</span>
            </div>
            
            <div class="admin-content">
                <div class="drop">
                    <i class="far fa-user-circle"></i>
                    <p>Customer</p> <!-- Bạn có thể thay "Admin" bằng biến động của người dùng đăng nhập -->
                    <div class="auth-links">
                        <a href="#">Logout</a>
                        <a href="#">Profile</a>
                    </div>
                </div>
            </div> 
        </div>
        <div class="nav">
            <a href="CusStaList.jsp">STADIUM LIST</a>
            <a href="CusPopular.jsp">POPULAR</a>
            <a href="CusBooking.jsp">BOOKING HISTORY</a>
        </div>
    </body>
</html>
