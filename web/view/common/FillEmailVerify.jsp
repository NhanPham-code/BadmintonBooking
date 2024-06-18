<%-- 
    Document   : FillEmailVerify
    Created on : Jun 18, 2024, 7:51:06 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Email Verification</title>
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
            }

            input[type=email] {
                border-radius: 6px;
                width: 100%;
                padding: 15px;
                margin: 5px 0 22px 0;
                display: inline-block;
                border: none;
                background: #f1f1f1;
            }

            input[type=email]:focus {
                background-color: #ddd;
                outline: none;
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
    </head>
    <body>
        <div class="container">
            <h1 style="color: red">${requestScope.error}</h1>
            <h1>Email Verification</h1>
            <p>Please fill in this form to receive a verification code.</p>
            <form action="<%=request.getContextPath()%>/EmailVerification" method="post">
                <label for="email">Enter your email address:</label>
                <input type="email" id="email" name="email" required>
                <button type="submit">Verify</button>
            </form>
        </div>
    </body>
</html>
