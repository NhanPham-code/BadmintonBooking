<%-- 
    Document   : HomeStadiumOwner
    Created on : Jun 5, 2024, 9:46:38 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <title>Sport Stadium Booking System</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #ffffff;
                margin: 0;
                padding: 0;
            }
            .content {
                padding: 20px;
            }
            #stadium {
                width: 100vw; /* Chiều rộng bằng chiều rộng của viewport */
                height: 590px; /* Chiều cao bằng chiều cao của viewport */
                background-size: cover; /* Đảm bảo ảnh bao phủ toàn bộ khung */
                background-position: center; /* Ảnh nằm giữa khung */
                background-repeat: no-repeat; /* Đảm bảo ảnh không lặp lại */
                transition: background-image 0.5s ease-in-out; /* Hiệu ứng chuyển đổi hình ảnh */
            }
        </style>
    </head>
    <body>
        <%@ include file="HeaderStadiumOwner.jsp" %>
        <div id="stadium"></div>

        <script>
            document.addEventListener("DOMContentLoaded", function () {
                var imageUrls = ['<%=request.getContextPath()%>/img/background/bg1.jpg', '<%=request.getContextPath()%>/img/background/bg2.jpg'];
                var stadium = document.getElementById('stadium');
                var index = 0;

                function changeImage() {
                    stadium.style.backgroundImage = "url('" + imageUrls[index] + "')";
                    index = (index + 1) % imageUrls.length;
                }

                changeImage(); // Hiển thị ảnh đầu tiên
                setInterval(changeImage, 5000); // Chuyển đổi ảnh sau mỗi 5 giây
            });
        </script>
    </body>
</html>

