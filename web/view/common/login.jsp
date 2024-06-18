<%-- 
    Document   : login
    Created on : Jun 7, 2024, 1:54:42 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Login</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
        <style>
            body {
                font-family: Arial, Helvetica, sans-serif;
                background-image: url('<%=request.getContextPath()%>/img/background/bg2.jpg');
                background-size: cover;
                background-position: center;
                display: flex;
                align-items: center;
                flex-direction: column;
                margin-top: 110px;
                background-repeat: no-repeat;
                background-size: cover;
                background-position: center;
                min-height: 100vh;
            }

            * {
                box-sizing: border-box;
            }

            .container {
                width: 500px;
                padding: 12px 40px;
                background-color: white;
                border-top-left-radius: 8px;
                border-top-right-radius: 8px;
            }

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

            hr {
                border: 1px solid #f1f1f1;
                margin-bottom: 25px;
            }

            .btn {
                display: flex;
                justify-content: space-between;
            }

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
            }

            .registerbtn:hover {
                opacity: 1;
            }

            a {
                color: #022B3A;
                display: flex;
                justify-content: flex-end;
            }

            p {
                font-family: Arial, Helvetica, sans-serif;
            }

            .container-signin {
                width: 500px;
                background-color: #f1f1f1;
                text-align: center;
                padding: 12px 40px;
                border-bottom-left-radius: 8px;
                border-bottom-right-radius: 8px;
            }

            .password-container {
                position: relative;
            }

            .show-password {
                position: absolute;
                top: 50%;
                right: 10px;
                transform: translateY(-50%);
                cursor: pointer;
                color: #ccc;
            }
        </style>
        <script>
            function togglePasswordVisibility() {
                var passwordField = document.getElementById('password');
                var passwordIcon = document.querySelector('.show-password');

                if (passwordField.type === 'password') {
                    passwordField.type = 'text';
                    passwordIcon.classList.remove('fa-eye');
                    passwordIcon.classList.add('fa-eye-slash');
                } else {
                    passwordField.type = 'password';
                    passwordIcon.classList.remove('fa-eye-slash');
                    passwordIcon.classList.add('fa-eye');
                }
            }
        </script>
    </head>
    <body>
        <h3 style="color: red">${requestScope.error}</h3>
     
        <form action="<%=request.getContextPath()%>/login" method="post">
            <div class="container">
                <h1 style="text-align:center">Login</h1>
                <p style="text-align:center">Please fill in this form to login an account.</p>
                <hr>
                <label for="email"><b>Email</b></label> 
                <input type="text" placeholder="Enter Email" name="email" value="${requestScope.email}" required>

                <div class="password-container">
                    <label for="password"><b>Password</b></label>
                    <input type="password" id="password" placeholder="Enter Password" name="password" required>
                    <i class="fa fa-eye show-password" onclick="togglePasswordVisibility()"></i>
                </div>
                <div class="forgot-pass">
                    <a href="<%=request.getContextPath()%>/view/common/FillEmailVerify.jsp">Forgot Password?</a>
                </div>
                <hr>
                <div class="btn">
                    <input class="registerbtn" type="submit" value="LOGIN">
                    <button type="button" class="registerbtn" onclick="redirectToPage('<%=request.getContextPath()%>/view/common/register.jsp')">REGISTER</button>
                </div>
            </div>               
        </form>
        <script>
            function redirectToPage(url) {
                window.location.href = url;
            }
        </script>
    </body>
</html>
