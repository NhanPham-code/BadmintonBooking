<%-- 
    Document   : DeleteStadium
    Created on : Jun 19, 2024, 7:49:16 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Delete Product</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f4f4f4;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }
            .background-image {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-image: url('<%=request.getContextPath()%>/img/background/bg3.jpg');
                background-size: cover;
                background-position: center;
                filter: blur(5px);
                z-index: -1;
            }

            .overlay {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: rgba(255, 255, 255, 0.2);
                z-index: -1;
            }
            .container {
                text-align: center;
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }
            .confirm-message {
                margin-bottom: 20px;
            }

            .product-item {
                margin: 10px;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 8px;
                background-color: #fff;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                width: calc(100% - 45px);
                display: flex;
                flex-direction: column;
                align-items: center;
                text-align: center;
            }

            .product-item img {
                width: 100%;
                height: 300px;
            }

            .product-item p {
                margin-top: 10px;
            }
            .btn-group {
                margin-top: 20px;
                display: flex;
                justify-content: center;
            }
            .btn {
                background-color: #022B3A;
                color: #fff;
                padding: 10px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                margin: 0 5px;
            }
            .btn:hover {
                background-color: #555;
            }
        </style>
    </head>
    <body>
        <div class="background-image"></div>
        <div class="overlay"></div>
        <div class="container">
            <c:set var="st" value="${requestScope.stadium}"></c:set>
                <div class="product-item">
                    <img src="${st.stadium_image}" >
                <p>Stadium name:${st.stadium_name}</p>
                <p>Stadium address:${st.stadium_address}</p>
                <p>Stadium phone:${st.stadium_phone}</p>
            </div>
            <h2 class="confirm-message">Are you sure you want to delete this item?</h2>
            <div class="btn-group">
                <form action="deleteStadium" method="post">
                    <input type="hidden" name="id" value="${st.stadium_ID}">
                    <button type="submit" class="btn">Yes</button>
                </form>
                <form action="stadiumList" method="get">
                    <button type="submit" class="btn">No</button>
                </form>
            </div>
        </div>
    </body>
</html>

