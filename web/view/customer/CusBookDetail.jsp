<%-- 
    Document   : CusBookDetail
    Created on : Jun 8, 2024, 10:50:45 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Booking Detail</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
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
            .header {
                display: flex;
                gap: 10px;
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
                margin: 0 30px;
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

            .stadium-bg {
                flex-grow: 1;
                width: 100%;
                padding: 40px;
                box-sizing: border-box;
                display: flex;
                justify-content: center;
                align-items: center;
                background: url('<%=request.getContextPath()%>/img/background/bg3.jpg') no-repeat center center; /* Background image */
                background-size: cover; /* Cover the entire background */
            }
            .stadium-board {
                background: rgba(255, 255, 255, 0.9); /* Slightly transparent to show background */
                border-radius: 4px;
                width: 100%;
                max-width: 800px;
                padding: 20px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            .stadium-detail {
                display: flex;
                flex-direction: column;
                gap: 20px;
            }
            .stadium-inf {
                display: flex;
                justify-content: space-between;
                align-items: center;
                border-bottom: 1px solid #ccc;
                padding-bottom: 10px;
                margin-bottom: 10px;
            }
            .stadium-inf h1 {
                font-size: 18px;
                margin: 0;
            }
            .stadium-inf p {
                font-size: 16px;
                margin: 0;
            }
            .court {
                display: flex;
                align-items: center;
                gap: 10px;
            }
            .total {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-top: 20px;
                padding-top: 10px;
                border-top: 2px solid #000;
            }
            .total h1 {
                font-size: 20px;
                margin: 0;
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
            <form class="search-bar" action="searchResults.jsp" method="get">
                <input type="text" name="query" placeholder="Search" />
                <button type="submit">
                    <i class="fas fa-search"></i>
                </button>
            </form>
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
            <a href="CusProfile.jsp">ACCOUNT</a>
        </div>

        <div class="stadium-bg">
            <div class="stadium-board">
                <div class="stadium-detail">
                    <div class="stadium-inf">
                        <h1>Stadium name:</h1>
                        <p>Name of stadium</p>
                    </div>
                    <div class="stadium-inf">
                        <h1>Stadium address:</h1>
                        <p>Stadium address</p>
                    </div>
                    <div class="stadium-inf">
                        <h1>Stadium contact:</h1>
                        <p>Stadium contact</p>
                    </div>
                    <div class="stadium-inf">
                        <h1>Time Booked:</h1>
                        <p>01</p>
                    </div>
                    <div class="stadium-inf">
                        <h1>Chosen court:</h1>
                        <div class="court">
                            <p>01</p>
                            <img src="<%=request.getContextPath()%>/img/icon/icon.png" alt="icon" width="40px" height="40px" />
                        </div>
                    </div>
                    <div class="stadium-inf">
                        <h1>Price per hour:</h1>
                        <p>50.000</p>
                    </div>
                    <div class="total">
                        <h1>Total:</h1>
                        <h1>50.000</h1>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="CusFooter.jsp" flush="true" />           
    </body>
</html>
