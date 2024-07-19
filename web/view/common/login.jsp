<%-- 
    Document   : login
    Created on : Jun 7, 2024, 1:54:42 PM
    Author     : NhanNQT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Login</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
        <link rel="stylesheet" href="https://unpkg.com/bootstrap@5.3.2/dist/css/bootstrap.min.css">
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
                padding: 30px 40px;
                background-color: white;
                border-top-left-radius: 8px;
                border-top-right-radius: 8px;
                border-bottom-left-radius: 8px;
                border-bottom-right-radius: 8px;
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

            .btnregis {
                display: flex;
                justify-content: center;
            }

            .registerbtn {
                border-radius: 6px;
                background-color: #022B3A;
                color: white;
                padding: 12px 20px;
                margin: 8px 0;
                border: none;
                cursor: pointer;
                width: 75%;
                opacity: 0.9;
            }

            .registerbtn:hover {
                opacity: 1;
            }

            a {
                color: #022B3A;
                display: flex;
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
                <div class="form-check" style="display: flex; justify-content: space-between;">
                    <div>
                        <input class="form-check-input" type="checkbox" value="true" name="remember_me" id="remember_me">
                        <label class="form-check-label text-secondary" for="remember_me">
                            Remember me
                        </label>
                    </div>
                    <a style="justify-content: flex-end" href="<%=request.getContextPath()%>/view/common/FillEmailVerify.jsp">Forgot Password?</a>
                </div>
                <hr>
                <div class="btnregis">
                    <input class="registerbtn" type="submit" value="LOGIN">
                </div>
                <div class="text-center" style="text-align: center;">
                    <a style="width: 75%;" href="https://accounts.google.com/o/oauth2/auth?scope=email profile openid&redirect_uri=http://localhost:8080/BadmintonBooking/login&response_type=code&client_id=80485541113-2nusvinbkchbmp80i16vi5curt1695s2.apps.googleusercontent.com&approval_prompt=force" class="btn btn-lg btn-danger">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-google" viewBox="0 0 16 16">
                        <path d="M15.545 6.558a9.42 9.42 0 0 1 .139 1.626c0 2.434-.87 4.492-2.384 5.885h.002C11.978 15.292 10.158 16 8 16A8 8 0 1 1 8 0a7.689 7.689 0 0 1 5.352 2.082l-2.284 2.284A4.347 4.347 0 0 0 8 3.166c-2.087 0-3.86 1.408-4.492 3.304a4.792 4.792 0 0 0 0 3.063h.003c.635 1.893 2.405 3.301 4.492 3.301 1.078 0 2.004-.276 2.722-.764h-.003a3.702 3.702 0 0 0 1.599-2.431H8v-3.08h7.545z" />
                        </svg>
                        <span class="ms-2 fs-6">Sign in with Google</span>
                    </a>
                </div>
                <hr>
                <div style="display: flex; justify-content: center;">
                    <p class="text-center m-0">Don't have an account?</p>
                    <a href="<%=request.getContextPath()%>/view/common/SendEmailRegis.jsp">Sign up</a>
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