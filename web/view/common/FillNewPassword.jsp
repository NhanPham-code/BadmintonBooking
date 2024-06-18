<%-- 
    Document   : FillNewPassword
    Created on : Jun 18, 2024, 9:15:58 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Set New Password</title>
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
                min-height: 100vh;
            }

            * {
                box-sizing: border-box;
            }

            .container {
                width: 500px;
                padding: 12px 40px;
                background-color: white;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                text-align: center;
            }

            h1 {
                color: #022B3A;
            }

            label {
                display: block;
                margin-bottom: 8px;
                font-weight: bold;
                color: #333;
                text-align: left;
            }

            input[type=password] {
                border-radius: 6px;
                width: 100%;
                padding: 15px;
                margin: 5px 0 22px 0;
                display: inline-block;
                border: none;
                background: #f1f1f1;
            }

            input[type=password]:focus {
                background-color: #ddd;
                outline: none;
            }

            .password-container {
                position: relative;
                margin-bottom: 22px;
                text-align: left;
            }

            .show-password {
                position: absolute;
                top: 50%;
                right: 15px;
                transform: translateY(-50%);
                cursor: pointer;
                color: #ccc;
                padding: 5px;
            }

            button {
                border-radius: 6px;
                background-color: #022B3A;
                color: white;
                padding: 12px 20px;
                margin: 8px 0;
                border: none;
                cursor: pointer;
                width: 100%;
                opacity: 0.9;
            }

            button:hover {
                opacity: 1;
            }
        </style>
        <script>
            function togglePasswordVisibility(id, iconId) {
                var passwordField = document.getElementById(id);
                var passwordIcon = document.getElementById(iconId);

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
        <div class="container">
            <h1 style="color: red">${requestScope.error}</h1>
            <h1>Set New Password</h1>
            <p>Please enter your new password below.</p>
            <form action="<%=request.getContextPath()%>/SetNewPassword" method="post">
                <input type="hidden" id="email" name="emailFix" value="${requestScope.emailFix}">
                <div class="password-container">
                    <label for="newPassword">New Password</label>
                    <input type="password" id="newPassword" name="newPassword" required>
                    <i class="fa fa-eye show-password" id="toggleNewPassword" onclick="togglePasswordVisibility('newPassword', 'toggleNewPassword')"></i>
                </div>
                <div class="password-container">
                    <label for="confirmPassword">Confirm Password</label>
                    <input type="password" id="confirmPassword" name="confirmPassword" required>
                    <i class="fa fa-eye show-password" id="toggleConfirmPassword" onclick="togglePasswordVisibility('confirmPassword', 'toggleConfirmPassword')"></i>
                </div>
                <button type="submit">Submit</button>
            </form>
        </div>
    </body>
</html>
