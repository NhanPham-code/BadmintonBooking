<%-- 
    Document   : CusRegister
    Created on : Jun 7, 2024, 5:10:29 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Register</title>
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
            />
        <style>
            body {
                font-family: Arial, Helvetica, sans-serif;
                background-image: url('<%=request.getContextPath()%>/img/background/bg3.jpg'); /* Đường dẫn đến hình ảnh */
                background-size: cover; /* Phủ kín toàn bộ phần nền */
                background-position: center; /* Canh chỉnh vị trí ảnh */
                display: flex;
                align-items: center;
                flex-direction: column;
                margin-top: 30px;
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
            input[type=text], input[type=password], input[type=email] {
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

            /* Set a style for the submit button */
            .registerbtn {
                border-radius: 6px;
                background-color: #022B3A;
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

            /* Add a blue text color to links */
            a {
                color: #022B3A;
            }
            s
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
        <form action="<%=request.getContextPath()%>/register" method="post">
            <div class="container">
                <h1 style="text-align:center">Register</h1>
                <p style="text-align:center">Please fill in this form to create an account.</p>
                <hr>
                <label for="name"><b>Name</b></label>
                <input type="text" placeholder="Enter Name" name="name" id="name" required>
                <label for="phone"><b>Phone Number</b></label>
                <input type="text" placeholder="Enter Phone Number" name="phone" id="phone" required maxlength="11" pattern="[0-9]{10,11}">
                <label for="email"><b>Email</b></label>
                <input type="email" name="email" id="email" value="${requestScope.email}" readonly>
                <div class="password-container">
                    <label for="password"><b>Password</b></label>
                    <input type="password" placeholder="Enter Password" name="password" id="password" pattern="^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,16}$"
                           title="Password must be at least 8 characters long and contain at least one number and one special character" 
                           required>  
                    <i class="fa fa-eye show-password" onclick="togglePasswordVisibility()"></i>
                </div>
                <p><b>Role: </b></p>
                <input type="radio" name="role" value="Customer" required>
                <label for="customer">Customer</label><br>
                <input type="radio" name="role" value="StadiumOwner" required>
                <label for="stadium-owner">Stadium Owner</label><br>
                <hr>
                <button type="submit" class="registerbtn"><b>REGISTER</b></button>
            </div>

            <div class="container-signin">
                <p>Already have an account? <a href="login.jsp">Sign in</a>.</p>
            </div>
        </form>
    </body>
</html>