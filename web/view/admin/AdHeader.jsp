<%-- 
    Document   : AdHeader
    Created on : Jun 5, 2024, 9:36:26 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Header Admin</title>
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
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
            }
            .header .logo img {
                margin-right: 10px;
            }
            .header .search-bar {
                flex-grow: 1;
                margin: 0 20px;
                display: flex;
                align-items: center;
                background: #d9d9d9;
                border-radius: 4px;
                padding: 5px 10px;
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
            .admin-content{
                display: flex;
                width: 120px;
                height: 42px;
                position: relative;
            }
            .drop {
                position: relative;
                display: inline-block;
                margin: 5px 35px;
            }
            .auth-links{
                display: none;
                position: relative;
                background-color: #1f7a8c;
                min-width: 120px;
                box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
                z-index: 1;
            }
            .auth-links a {
                color: black;
                padding: 12px 16px;
                text-decoration: none;
                display: block;
            }
            .drop i{
                font-size: 33px;
                }
            .drop:hover .auth-links{
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
                    width="40px"
                    height="40px"
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
                    <div class="auth-links">
                        <a href="#">Logout</a>
                        <a href="#">Profile</a>
                    </div>
                </div>
            </div> 
        </div>
        <div class="banner"></div>

        <div class="nav">
            <a href="AdStaManage.jsp">STADIUM MANAGEMENT</a>
            <a href="AdAccManage.jsp">ACCOUNT MANAGEMENT</a>
        </div>
    </body>
</html>
