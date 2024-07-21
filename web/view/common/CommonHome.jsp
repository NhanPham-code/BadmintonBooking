<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HomePage</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <style>
            html, body {
                height: 100%;
                margin: 0;
                font-family: 'Inter', sans-serif;
                display: flex;
                flex-direction: column;
                background: white;
            }
            .header, .footer {
                width: 100%;
                background: #022B3A;
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
                background: #D9D9D9;
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
                background: #1F7A8C;
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
            .header .auth-links {
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
            .nav {
                width: 100%;
                background: #1F7A8C;
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
    </head>      
    <body>
        <div class="header">
            <div class="logo">
                <img src="<%=request.getContextPath()%>/img/logo/logo.png" alt="Logo" width="40px" height="40px">
                <span>Badminton Stadium Booking</span>
            </div>

            <div class="auth-links">
                <a href="<%=request.getContextPath()%>/view/common/login.jsp">Login</a>
                <a href="<%=request.getContextPath()%>/view/common/SendEmailRegis.jsp">Register</a>
            </div>
        </div>

        <div class="nav">
            <a href="stadiumList">STADIUM LIST</a>
            <a href="<%=request.getContextPath()%>/Popular">POPULAR</a>
        </div>

        <div class="banner" id="banner">
            <!-- N?i dung banner -->
        </div>

        <div class="footer">
            <div>CONTACT US: 0778289817</div>
            <div>EMAIL: bookingsystem3105@gmail.com</div>
        </div>
    </body>
</html>
