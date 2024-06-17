<%-- 
    Document   : HomeStadiumOwner
    Created on : Jun 5, 2024, 9:46:38 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Admin DashBoard</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <style>
           html, body {
                height: 100%;
                margin: 0;
                font-family: 'Inter', sans-serif;
                display: flex;
                flex-direction: column;
                background: white;
            }
            .footer {
                width: 100%;
                background: #022B3A;
                color: white;
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 10px 20px;
                box-sizing: border-box;
            }
            
            
            .banner {
                flex-grow: 1;
                background-size: cover;
                display: flex;
                justify-content: center;
                align-items: center;
                color: black;
                font-size: 32px;
                font-weight: 700;
                border-bottom: 1px solid black;
                transition: background-image 0.5s ease-in-out;
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

        <div class="banner" id="banner">
            <!-- N?i dung banner -->
        </div>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                var imageUrls = ['<%=request.getContextPath()%>/img/background/bg1.jpg', '<%=request.getContextPath()%>/img/background/bg2.jpg'];
                var banner = document.querySelector('.banner');
                var index = 0;

                function changeImage() {
                    banner.style.backgroundImage = "url('" + imageUrls[index] + "')";
                    index = (index + 1) % imageUrls.length;
                }
                changeImage(); // Hi?n th? ?nh ??u tiên
                setInterval(changeImage, 5000); // Chuy?n ??i ?nh sau m?i 5 giây
            });
        </script>
        
        <div class="footer">
            <div>CONTACT US: 0778289817</div>
            <div>EMAIL: group1@gmail.com</div>
        </div>
    </body>
    
    
    
</html>
