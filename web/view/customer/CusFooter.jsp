<%-- 
    Document   : CusFooter
    Created on : Jun 7, 2024, 3:33:50 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Footer Customer</title>
        <style>
            body {
                margin: 0;
                font-family: 'Inter', sans-serif;
                background: white;
                display: flex;
                flex-direction: column;
                min-height: 100vh;
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
            .footer {
                justify-content: space-around;
                display: flex;
                align-items: center;
                padding: 10px; /* Reduce padding to make footer smaller */
                margin-top: auto; /* Push the footer to the bottom */
            }
            .footer div {
                margin: 5px 0;
            }
        </style>
    </head>
    <body>
        <div class="footer">
            <div>CONTACT US: 0778289817</div>
            <div>EMAIL: group1@gmail.com</div>
        </div>
    </body>
</html>
