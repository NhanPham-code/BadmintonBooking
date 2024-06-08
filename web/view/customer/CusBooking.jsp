<%-- 
    Document   : CusBooking
    Created on : Jun 8, 2024, 10:52:06 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html><!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Booking</title>
        <style>
            .stadium-bg{
                width: 100%;
                background: #e3e6ed;
                padding: 40px 45px;
                box-sizing: border-box;
                display: flex;
                flex-direction: column;
                gap: 20px;
                flex-grow: 1; /* Make the stadium list take the available space */
            }
            .stadium-board {
                background: #ffffff;
                border-radius: 4px;
                height: 720px;
                position: relative;
            }
            .time-pay{
                display: flex;
                justify-content: space-around;
                margin-bottom: 20px;
            }

            h1 {
                text-align: center;
                font-size: 16px;
            }

            .appointment-times {
                display: flex;
                justify-content: center;
                margin-top: 20px;
            }

            .appointment-time {
                width: 60px; /* Đặt chiều rộng của nút */
                height: 35px; /* Đặt chiều cao của nút */
                padding: 10px 12px;
                margin: 0 10px;
                font-size: 14px;
                background-color: #007bff;
                color: #fff;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }
            .appointment-time:hover {
                background-color: #0056b3;
            }
            .court-status{
                display: flex;
                justify-content: space-around;
            }
            .status{
                display: flex;
                justify-content: center;

            }
            .square {
                border-radius: 5px;
                margin-top: 10px;
                margin-right: 3px;
                width: 30px; /* Chiều rộng của hình vuông */
                height: 30px; /* Chiều cao của hình vuông */
                background-color: blue; /* Màu sắc của hình vuông */
            }
            .payment {
                text-align: center;
            }

            .payment img {
                max-width: 300px;
                height: auto;
                margin-top: 20px;
            }
            .choose-court{
                display: flex;
            }
            .number{
                display: flex;
            }
            .court{
                margin-right: 10px;
            }
            .courtbtn{
                display: flex;
                margin-left: 20px;
            }
            .court-detail{
                justify-content: space-around;
                display: flex;
                width: 106%;
            }
            .booking {
                border-radius: 6px;
                background-color: #022B3A;
                color: white;
                padding: 13px 20px;
                margin: 6px 0;
                border: none;
                cursor: pointer;
                width: 8%;
                opacity: 0.9;
                position: relative;
            }
            .but-book{
                display: flex;
                justify-content: center;
            }
            .booking:hover {
                opacity: 1;
            }
        </style>
    </head>
    <body>
        <jsp:include page = "CusHeader.jsp" flush = "true" />
        <div class="stadium-bg">
            <div class="stadium-board">
                <div class="time-pay">
                    <div class="choosing-time">
                        <div class="time">  
                            <h1>CHOOSING TIME</h1>
                            <div class="appointment-times">
                                <button class="appointment-time">5:00</button>
                                <button class="appointment-time">6:00</button>
                                <button class="appointment-time">7:00</button>
                                <button class="appointment-time">8:00</button>
                                <button class="appointment-time">9:00</button>
                                <button class="appointment-time">10:00</button>
                                <button class="appointment-time">11:00</button>
                                <button class="appointment-time">12:00</button>
                                <button class="appointment-time">13:00</button>
                            </div>
                            <div class="appointment-times">
                                <button class="appointment-time">14:00</button>
                                <button class="appointment-time">15:00</button>
                                <button class="appointment-time">16:00</button>
                                <button class="appointment-time">17:00</button>
                                <button class="appointment-time">18:00</button>
                                <button class="appointment-time">19:00</button>
                                <button class="appointment-time">20:00</button>
                                <button class="appointment-time">21:00</button>
                                <button class="appointment-time">22:00</button>
                                <!-- Thêm các button giờ hẹn khác ở đây -->
                            </div>
                        </div>
                        <div class="court-status">
                            <div class="status">   
                                <div class="square"></div>
                                <p>Ready</p> 
                            </div>
                            <div class="status">   
                                <div class="square"></div>
                                <p>Your booking choice</p> 
                            </div>
                            <div class="status">   
                                <div class="square"></div>
                                <p>Confirming</p> 
                            </div>
                            <div class="status">   
                                <div class="square"></div>
                                <p>Booked</p> 
                            </div>
                            <div class="status">   
                                <div class="square"></div>
                                <p>Locked</p> 
                            </div>
                        </div>


                    </div>
                    <div class="payment">
                        <h1>PAYMENT METHOD</h1>
                        <img
                            src="<%=request.getContextPath()%>/img/QRCode/qr.png"
                            alt="QR"
                            width="200px"
                            height="200px"
                            />
                    </div>
                </div>
                <div class="court-detail"> 
                    <div class="choose-court">
                        <div class="number">
                            <h1>CHOOSING COURT</h1>  
                            <div class="courtbtn">
                                <button class="court">                            
                                    <img
                                        src="<%=request.getContextPath()%>/img/icon/icon.png"
                                        alt="icon"
                                        width="40px"
                                        height="40px"
                                        />
                                    <p>01</p>
                                </button>
                                <button class="court">                            
                                    <img
                                        src="<%=request.getContextPath()%>/img/icon/icon.png"
                                        alt="icon"
                                        width="40px"
                                        height="40px"
                                        />
                                    <p>02</p>
                                </button>
                                <button class="court">                            
                                    <img
                                        src="<%=request.getContextPath()%>/img/icon/icon.png"
                                        alt="icon"
                                        width="40px"
                                        height="40px"
                                        />
                                    <p>03</p>
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="calendar">
                        <label for="date"><h1>SELECT A DATE</h1></label>
                        <input type="date" id="date" name="date">
                    </div>
                </div>    
                <div class="but-book"> 
                    <button type="submit" class="booking"><b>BOOKING</b></button>
                </div>
            </div>
        </div>
    </body>
</html>
