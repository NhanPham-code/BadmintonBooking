<%-- 
    Document   : CusBookingCourt
    Created on : Jun 10, 2024, 12:16:35 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Choosing Court</title>
        <style>
            body {
                text-align: center;
                margin: 0;
                font-family: "Inter", sans-serif;
                background-color: #f4f4f9;
            }

            .court-detail {
                width: 100%;
                height: 100%;
                background: #ffffff;
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
                background-image: url('<%=request.getContextPath()%>/img/background/bg3.jpg');
                background-repeat: no-repeat;
                background-size: cover;
                background-position: center;
                align-items: center;
                min-height: 100vh;
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            .court-detail h1 {
                font-size: 32px;
                color: #022B3A;
                margin-bottom: 20px;
            }

            .courtbtn {
                display: flex;
                justify-content: center;
                gap: 20px;
                flex-wrap: wrap;
            }

            .court {
                position: relative;
                width: 150px;
                height: 150px;
                cursor: pointer;
                transition: transform 0.2s ease;
            }

            .court input[type="checkbox"] {
                display: none;
            }

            .court label {
                display: block;
                width: 100%;
                height: 100%;
                border: 2px solid #022B3A;
                border-radius: 10px;
                background-color: rgba(255, 255, 255, 0.8);
                text-align: center;
                padding-top: 40px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                transition: background-color 0.3s ease, transform 0.2s ease;
            }

            .court label img {
                width: 50px;
                height: 50px;
            }

            .court label p {
                margin-top: 10px;
                font-size: 24px;
                color: #022B3A;
                font-weight: bold;
            }

            .court input[type="checkbox"]:checked + label {
                background-color: #1f7a8c;
                color: #3f8aed;
                transform: scale(1.05);
            }

            .court label:hover {
                transform: scale(1.05);
            }

            .but-book {
                display: flex;
                justify-content: center;
                margin-top: 15%;
            }

            .booking {
                border-radius: 6px;
                background-color: #022B3A;
                color: white;
                padding: 13px 20px;
                border: none;
                cursor: pointer;
                width: 150px;
                text-align: center;
                font-size: 16px;
                font-weight: bold;
                transition: background-color 0.3s ease, transform 0.2s ease;
            }

            .booking:hover {
                background-color: #0056b3;
                transform: scale(1.05);
                opacity: 0.9;
            }

            .booking:active {
                background-color: #004494;
                transform: scale(1.02);
            }

            .booking:focus {
                outline: none;
                box-shadow: 0 0 0 3px rgba(0, 86, 179, 0.4);
            }
        </style>
    </head>
    <body>

        <jsp:include page="CusHeaderNoSearch.jsp" flush="true" />

        <div class="court-detail">
            <h1>Choosing Court</h1>
            <div class="courtbtn">
                <div class="court">
                    <input type="checkbox" class="court-checkbox" id="court-01" value="01" name="selectedCourt">
                    <label for="court-01">
                        <img src="<%=request.getContextPath()%>/img/icon/icon.png" alt="icon" />
                        <p>01</p>
                    </label>
                </div>
                <div class="court">
                    <input type="checkbox" class="court-checkbox" id="court-02" value="02" name="selectedCourt">
                    <label for="court-02">
                        <img src="<%=request.getContextPath()%>/img/icon/icon.png" alt="icon" />
                        <p>02</p>
                    </label>
                </div>
            </div>

            <div class="but-book"> 
                <button type="submit" class="booking"><b>Booking</b></button>
            </div>
        </div>

    </body>
</html>
