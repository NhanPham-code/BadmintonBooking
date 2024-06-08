

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
        <style>
            body {
                font-family: Arial, Helvetica, sans-serif;
                background-image: url('<%=request.getContextPath()%>/img/background/bg3.jpg'); /* Đường dẫn đến hình ảnh */
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

            /* Set a style for the submit button */
            .resetbtn {
                border-radius: 6px;
                background-color: #022B3A;
                color: white;
                padding: 13px 20px;
                margin: 8px 0;
                border: none;
                cursor: pointer;
                width: 100%;
                opacity: 0.9;
                font-size: 18px;
                
            }

            .resetbtn:hover {
                opacity: 1;
            }

            /* Add a blue text color to links */
            a {
                color: #022B3A;
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
                <h1 style="text-align:center">RESET PASSWORD</h1>
                <p style="text-align:center">Please fill in this form to create new password.</p>
                <hr>

                <label for="psw"><b>New Password</b></label>
                <input type="password" placeholder="Enter New Password" name="new-psw" id="new-psw" required>

                <label for="psw-repeat"><b>Repeat Password</b></label>
                <input type="password" placeholder="Repeat Password" name="psw-repeat" id="psw-repeat" required>

                <button type="submit" class="resetbtn">RESET</button>
            </div>

            <div class="container-signin">
                <p>Already have an account? <a href="#">Sign in</a>.</p>
            </div>
        </form>
    </body>
</html>