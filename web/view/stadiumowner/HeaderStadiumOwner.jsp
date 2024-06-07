<%-- 
    Document   : HeaderStadiumOwner
    Created on : Jun 5, 2024, 9:42:26 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <style>
        .header {
            background-color: #022B3A;
            color: #fff;
            padding: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: relative;
        }

        .header .logo-container {
            display: flex;
            align-items: center;
            position: absolute;
            left: 20px;
        }

        .header .logo-container img {
            margin-right: 10px;
            height:50px;
            width: 40px;
        }

        .header .title {
            font-size: 24px;
            flex: 1;
            text-align: center;
        }

        .header .user-info {
            font-size: 14px;
            position: absolute;
            right: 20px;
            display: flex;
            gap: 10px;
        }

        .header .user-info button {
            background-color: #022B3A;
            color: #fff;
            border: none;
            cursor: pointer;
            font-size: 14px;
            padding: 5px 10px;
            transition: background-color 0.3s, color 0.3s;
            outline: none;
        }

        .header .user-info button:hover {
            background: #145569;
        }

        .navbar {
            display: flex;
            background-color: #1F7A8C;
            color: #fff;
        }
        .navbar a {
            flex: 1;
            padding: 10px;
            text-align: center;
            cursor: pointer;
            background-color: #1F7A8C;
            color: #fff;
            border: none;
            font-size: 16px;
            transition: background-color 0.3s, color 0.3s; /* Smooth transition */
            outline: none;
        }
        .navbar a:hover {
            background: #145569;
            border-radius: 4px; /* Change text color */
        }
    </style>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <div class="header">
            <div class="logo-container">
                <img src="<%=request.getContextPath()%>/img\logo\logo.png" alt="Logo">
            </div>
            <div class="title">
                Badminton Stadium Booking System
            </div>
            <div class="user-info">
                <button>Logout</button>
                <button>StadiumOwner</button>
            </div>
        </div>
        <div class="navbar">
            <a>Booking Management</a>
            <a>Stadium Management</a>
            
        </div>
    </body>
</html>
