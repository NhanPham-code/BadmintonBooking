<%-- 
    Document   : ChangePassword
    Created on : Jun 17, 2024, 9:47:57 AM
    Author     : ADMIN
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Change Password</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <style>
            body {
                font-family: Arial, Helvetica, sans-serif;
                background-image: url('<%=request.getContextPath()%>/img/background/bg3.jpg');
                background-size: cover;
                background-position: center;
                display: flex;
                align-items: center;
                flex-direction: column;
                margin-top: 30px;
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
            }

            .password-container input {
                padding-right: 40px; /* space for the eye icon */
            }

            .toggle-password {
                position: absolute;
                right: 10px;
                top: 40%;

                cursor: pointer;
            }

            hr {
                border: 1px solid #f1f1f1;
                margin-bottom: 25px;
            }

            .registerbtn {
                border-radius: 6px;
                background-color: #1f7a8c;
                color: white;
                padding: 16px 20px;
                margin: 8px 0;
                border: none;
                cursor: pointer;
                width: 100%;
                opacity: 0.9;
            }

            .registerbtn:hover {
                opacity: 1;
            }

            a {
                color: #022B3A;
            }

            p {
                font-family: Arial, Helvetica, sans-serif;
            }

            .container-signin {
                width: 100%;
                background-color: #f1f1f1;
                text-align: center;
                padding: 5px 20px;
                border-radius: 8px;
                margin-top: 5px;
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

        <form action="changePassword" method="post">
            <div class="container">
                <h1 style="text-align:center">Change Password</h1>
                <p style="text-align:center">Please fill in this form to change your password.</p>
                <hr>
                <h4 style="color: #1f7a8c">${requestScope.done}</h4>
                <h4 style="color: #B22222">${requestScope.error}</h4>
                <label for="currentPassword"><b>Current Password</b></label>
                <div class="password-container">
                    <input type="password" placeholder="Enter Current Password" name="currentPassword" id="currentPassword" required>

                </div>

                <label for="newPassword"><b>New Password</b></label>
                <div class="password-container">
                    <input type="password" placeholder="Enter New Password" name="newPassword" id="newPassword" required>

                </div>

                <label for="confirmPassword"><b>Confirm New Password</b></label>
                <div class="password-container">
                    <input type="password" placeholder="Confirm New Password" name="confirmPassword" id="confirmPassword" required>
                </div>

                <button type="submit" class="registerbtn"><b>Change Password</b></button>
                <div class="container-signin">
                    <p><a href="viewProfile">Back to Account</a>.</p>
                </div>
            </div>


        </form>
    </body>
</html>
