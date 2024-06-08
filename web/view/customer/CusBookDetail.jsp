<%-- 
    Document   : CusBookDetail
    Created on : Jun 8, 2024, 10:50:45 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Booking Detail</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
            />
        <style>
            .stadium-bg{
                width: 100%;
                background: #e3e6ed;
                padding: 40px 271px;
                box-sizing: border-box;
                display: flex;
                flex-direction: column;
                gap: 20px;
                flex-grow: 1; /* Make the stadium list take the available space */
            }
            .stadium-board {
                background: #ffffff;
                border-radius: 4px;
                width: 1000px;
                height: 1000px;
                position: relative;
            }
            .stadium-detail{
                padding: 50px 200px;
            }
            .stadium-inf{
                display: flex;

            }
            .stadium-inf h1{
                font-size: 20px;
                flex-grow: 1;
                margin-left: 60px;
                margin-bottom: 40px;
            }
            .court{

            }
            .total{
                margin-top: 60px;
                display: flex;
                justify-content: center;
            }
            .total h1{
                text-align: center;
                
                padding: 15px;
                
            }
        </style>
    </head>
    <body>
        <jsp:include page = "CusHeader.jsp" flush = "true" />

        <div class="stadium-bg">
            <div class="stadium-board">
                <div class="stadium-detail">
                    <div class="stadium-inf">
                        <h1>Stadium name:</h1>
                        <p>Name of stadium</p>
                    </div>
                    <div class="stadium-inf">
                        <h1>Stadium address:</h1>
                        <p>Name of stadium</p>
                    </div>
                    <div class="stadium-inf">
                        <h1>Stadium contact:</h1>
                        <p>Name of stadium</p>
                    </div>
                    <div class="stadium-inf">
                        <h1>Time Booked:</h1>
                        <p>01</p>
                    </div>
                    <div class="stadium-inf">
                        <h1>Chosen court:</h1>
                        <div class="court">
                            <p>01</p>
                            <img
                                src="<%=request.getContextPath()%>/img/icon/icon.png"
                                alt="icon"
                                width="40px"
                                height="40px"
                                />
                        </div>
                    </div>
                    <div class="stadium-inf">
                        <h1>Price per hour</h1>
                        <p>50.000</p>
                    </div>
                    <div class="total">
                        <h1>Total</h1>
                        <h1>50.000</h1>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
