<%-- 
    Document   : CusLogin
    Created on : Jun 8, 2024, 8:52:46 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Login</title>
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
            />
        <style>
            body {
                font-family: Arial, Helvetica, sans-serif;
                background-image: url('<%=request.getContextPath()%>/img/background/bg2.jpg'); /* Đường dẫn đến hình ảnh */
                background-size: cover; /* Phủ kín toàn bộ phần nền */
                background-position: center; /* Canh chỉnh vị trí ảnh */
                display: flex;
                align-items: center;
                flex-direction: column;
                margin-top: 110px;
            }

            * {
                box-sizing: border-box;
            }

            /* Add padding to containers */
            .container {
                width: 500px;
                padding: 12px 40px;
                background-color: white;
                border-top-left-radius: 8px; /* Góc trên bên trái cong */
                border-top-right-radius: 8px; /* Góc trên bên phải cong */
            }

            /* Full-width input fields */
            input[type=text], input[type=password] {
                border-radius: 6px;
                width: 100%;
                padding: 15px;
                margin: 5px 0 22px 0;
                display: inline-block;
                border: none;
                background: #f1f1f1;
            }

            input[type=text]:focus, input[type=password]:focus {
                background-color: #ddd;
                outline: none;

            }

            /* Overwrite default styles of hr */
            hr {
                border: 1px solid #f1f1f1;
                margin-bottom: 25px;
            }
            .btn {
                display: flex;
                    justify-content: space-between;
            }
            /* Set a style for the submit button */
            .registerbtn {
                border-radius: 6px;
                background-color: #022B3A;
                color: white;
                padding: 12px 20px;
                margin: 8px 0;
                border: none;
                cursor: pointer;
                width: 30%;
                opacity: 0.9;
/*                font-size: 18px;*/
            }

            .registerbtn:hover {
                opacity: 1;
            }

            /* Add a blue text color to links */
            a {
                color: #022B3A;
                display: flex;
                justify-content: flex-end;
            }
            p{
                font-family: Arial, Helvetica, sans-serif;
            }
            /* Set a grey background color and center the text of the "sign in" section */
            .container-signin {
                width: 500px;
                background-color: #f1f1f1;
                text-align: center;
                padding: 12px 40px;
                border-bottom-left-radius: 8px; /* Góc dưới bên trái cong */
                border-bottom-right-radius: 8px; /* Góc dưới bên phải cong */
            }
            .input[type="radio"]:checked + label:before {
                background-color: #022B3A; /* Màu nền của radio button khi được chọn */
            }
        </style>
    </head>
    <body>
        <form>
            <div class="container">
                <h1 style="text-align:center">Login</h1>
                <p style="text-align:center">Please fill in this form to login an account.</p>
                <hr>
                <label for="email"><b>Email</b></label>
                <input type="text" placeholder="Enter Email" name="email" id="email" required>
                <label for="psw"><b>Password</b></label>
                <input type="password" placeholder="Enter Password" name="psw" id="psw" required>
                <div class="forgot-pass">
                    <a href="CusResetPass.jsp">Forgot Password?</a>
                </div>
                <hr>
                <div class="btn">
                    <button type="submit" class="registerbtn" onclick="redirectToPage('CusStaList.jsp')"><b>LOGIN</b></button>
                    <button type="submit" class="registerbtn" onclick="redirectToPage('CusRegister.jsp')"><b>REGISTER</b></button>
                </div>
            </div>               
        </form>
        <script>
            // Hàm để chuyển hướng trang khi nút được nhấn
            function redirectToPage(url) {
                // Chuyển hướng trang
                window.location.href = url;
            }
        </script>
    </body>
</html>
