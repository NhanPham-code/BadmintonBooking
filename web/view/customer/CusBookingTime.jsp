<%-- 
    Document   : CusBookingTime
    Created on : Jun 10, 2024, 12:16:19 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Choose Date and Time</title>
        <style>
            body {
                text-align: center;
            }
            .stadium-board {
                width: 100%; /* Định kích thước của form */
                background: #ffffff;
                border-radius: 0;
                padding: 20px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                margin-top: 20px; /* Tạo khoảng cách với đỉnh trang */
                background-image: url('<%=request.getContextPath()%>/img/background/bg3.jpg');
                background-repeat: no-repeat;
                background-size: cover;
                background-position: center;

                margin: 0px auto;
                font-family: "Inter", sans-serif;
                display: flex;
                flex-direction: column;
                align-items: center;
                min-height: 100vh;
            }

            .calendar label h1,
            .choosing-time h1,
            .court-detail h1,
            .payment h1 {
                font-size: 24px; /* Tăng kích thước tiêu đề */
                color: #BFDBF7; /* Đổi màu chữ */
            }

            .calendar {
                width: 100%; /* Đảm bảo khung chọn ngày chiếm toàn bộ chiều rộng */
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            .calendar input[type="date"] {
                width: 40%; /* Chiều rộng của khung chọn ngày */
                height: 40px; /* Chiều cao của khung chọn ngày */
                font-size: 18px; /* Kích thước chữ */
                padding: 5px;
                border: 1px solid #ccc;
                border-radius: 5px;
                margin-top: 10px; /* Tạo khoảng cách với tiêu đề */
            }

            .choosing-time {
                width: 100%; /* Đảm bảo các phần bên dưới đều chiếm toàn bộ chiều rộng */
            }

            .appointment-times {
                display: flex;
                flex-wrap: wrap;
                justify-content: center;
                gap: 10px;
                margin-top: 20px;
            }

            .appointment-time {
                display: none;
            }

            .appointment-time + label {
                display: inline-block;
                width: 60px;
                height: 35px;
                padding: 10px;
                font-size: 14px;
                background-color: green;
                color: #fff;
                border-radius: 5px;
                cursor: pointer;
                text-align: center;
                line-height: 1.5;
                overflow: hidden; /* Che bớt phần nội dung vượt ra ngoài khung */
            }

            .appointment-time:checked + label {
                background-color: #0056b3;
            }

            .court-status {
                display: flex;
                justify-content: space-around;
                margin-top: 20px;
                flex-wrap: wrap;
                gap: 10px;
            }

            .status {
                display: flex;
                align-items: center;
                gap: 5px;
            }

            .square {
                border-radius: 5px;
                width: 20px;
                height: 20px;
            }

            .but-book {
                display: flex;
                justify-content: center;
                margin-top: 20px;
            }

            .booking {
                border-radius: 6px;
                background-color: #022B3A; /* Màu nền */
                color: white; /* Màu chữ */
                padding: 13px 20px; /* Khoảng cách giữa nội dung và đường viền */
                border: none; /* Không viền */
                cursor: pointer; /* Con trỏ chuột */
                width: 150px; /* Chiều rộng nút */
                text-align: center; /* Canh giữa nội dung */
                font-size: 16px; /* Kích thước chữ */
                font-weight: bold; /* Độ đậm chữ */
                transition: background-color 0.3s ease, transform 0.2s ease; /* Hiệu ứng chuyển đổi */
            }

            .booking:hover {
                background-color: #0056b3; /* Màu nền khi hover */
                transform: scale(1.05); /* Hiệu ứng phóng to khi hover */
                opacity: 0.9; /* Độ mờ khi hover */
            }

            .booking:active {
                background-color: #004494; /* Màu nền khi click */
                transform: scale(1.02); /* Hiệu ứng thu nhỏ khi click */
            }

            .booking:focus {
                outline: none; /* Bỏ viền khi focus */
                box-shadow: 0 0 0 3px rgba(0, 86, 179, 0.4); /* Hiệu ứng đổ bóng khi focus */
            }


        </style>

        <script>

            document.addEventListener('DOMContentLoaded', function () {
                var appointmentTimes = document.querySelectorAll('.appointment-time');
                var courtCheckboxes = document.querySelectorAll('.court-checkbox');

                var selectedAppointmentTimes = [];

                appointmentTimes.forEach(function (checkbox) {
                    checkbox.addEventListener('change', function () {
                        if (this.checked) {
                            if (selectedAppointmentTimes.length === 2) {
                                var firstSelected = selectedAppointmentTimes.shift();
                                firstSelected.checked = false;
                                firstSelected.nextElementSibling.style.backgroundColor = 'green'; // Huỷ highlight
                            }
                            // Kiểm tra xem checkbox đã được chọn trước đó chưa
                            var index = selectedAppointmentTimes.indexOf(this);
                            if (index === -1) {
                                selectedAppointmentTimes.push(this);
                            }
                            this.nextElementSibling.style.backgroundColor = '#0056b3'; // Highlight checkbox

                            // Update appointment time range
                            updateAppointmentTimeRange();
                        } else {
                            var index = selectedAppointmentTimes.indexOf(this);
                            if (index > -1) {
                                selectedAppointmentTimes.splice(index, 1);
                            }
                            this.nextElementSibling.style.backgroundColor = 'green'; // Huỷ highlight

                            // Update appointment time range
                            updateAppointmentTimeRange();
                        }

                        // Update court availability
                        updateCourtAvailability();
                    });
                });

                function updateAppointmentTimeRange() {
                    // Reset all appointment time backgrounds
                    appointmentTimes.forEach(function (checkbox) {
                        checkbox.nextElementSibling.style.backgroundColor = 'green';
                    });

                    // Update selected appointment time range background
                    if (selectedAppointmentTimes.length === 2) {
                        var startTime = parseInt(selectedAppointmentTimes[0].value.split(':')[0]);
                        var endTime = parseInt(selectedAppointmentTimes[1].value.split(':')[0]);

                        for (var i = startTime; i <= endTime; i++) {
                            var checkbox = document.getElementById('time-' + i);
                            if (checkbox) {
                                checkbox.nextElementSibling.style.backgroundColor = '#0056b3'; // Tô đen khung giờ trong khoảng giữa
                            }
                        }
                    }

                    // Highlight selected appointment times
                    selectedAppointmentTimes.forEach(function (checkbox) {
                        checkbox.nextElementSibling.style.backgroundColor = '#0056b3'; // Tô màu cho các checkbox được chọn
                    });

                    // Check if user selected more than 2 checkboxes, then reset selection
                    if (selectedAppointmentTimes.length > 2) {
                        selectedAppointmentTimes.forEach(function (checkbox) {
                            checkbox.checked = false;
                        });
                        selectedAppointmentTimes = [];
                    }
                }

                function updateCourtAvailability() {
                    if (selectedAppointmentTimes.length === 0) {
                        // Block all courts if no appointment time selected
                        courtCheckboxes.forEach(function (checkbox) {
                            checkbox.disabled = true;
                            checkbox.parentElement.style.opacity = '0.5';
                        });
                    } else {
                        // Unblock all courts
                        courtCheckboxes.forEach(function (checkbox) {
                            checkbox.disabled = false;
                            checkbox.parentElement.style.opacity = '1';
                        });
                    }
                }
            });

        </script>
    </head>
    <body>

        <jsp:include page="CusHeaderNoSearch.jsp" flush="true" />

        <form class="stadium-board">
            <div class="calendar">
                <label for="date"><h1>SELECT A DATE</h1></label>
                <input type="date" id="date" name="date">
            </div>
            <div class="time-pay">
                <div class="choosing-time">
                    <h1>CHOOSING TIME</h1>
                    <!-- Checkbox giờ -->
                    <div class="appointment-times">
                        <input type="checkbox" class="appointment-time" id="time-5" value="5:00">
                        <label for="time-5">5:00</label>
                        <input type="checkbox" class="appointment-time" id="time-6" value="6:00">
                        <label for="time-6">6:00</label>
                        <input type="checkbox" class="appointment-time" id="time-7" value="7:00">
                        <label for="time-7">7:00</label>
                        <input type="checkbox" class="appointment-time" id="time-8" value="8:00">
                        <label for="time-8">8:00</label>
                        <input type="checkbox" class="appointment-time" id="time-9" value="9:00">
                        <label for="time-9">9:00</label>
                        <input type="checkbox" class="appointment-time" id="time-10" value="10:00">
                        <label for="time-10">10:00</label>
                        <input type="checkbox" class="appointment-time" id="time-11" value="11:00">
                        <label for="time-11">11:00</label>
                        <input type="checkbox" class="appointment-time" id="time-12" value="12:00">
                        <label for="time-12">12:00</label>
                        <input type="checkbox" class="appointment-time" id="time-13" value="13:00">
                        <label for="time-13">13:00</label>
                    </div>
                    <div class="appointment-times">
                        <input type="checkbox" class="appointment-time" id="time-14" value="14:00">
                        <label for="time-14">14:00</label>
                        <input type="checkbox" class="appointment-time" id="time-15" value="15:00">
                        <label for="time-15">15:00</label>
                        <input type="checkbox" class="appointment-time" id="time-16" value="16:00">
                        <label for="time-16">16:00</label>
                        <input type="checkbox" class="appointment-time" id="time-17" value="17:00">
                        <label for="time-17">17:00</label>
                        <input type="checkbox" class="appointment-time" id="time-18" value="18:00">
                        <label for="time-18">18:00</label>
                        <input type="checkbox" class="appointment-time" id="time-19" value="19:00">
                        <label for="time-19">19:00</label>
                        <input type="checkbox" class="appointment-time" id="time-20" value="20:00">
                        <label for="time-20">20:00</label>
                        <input type="checkbox" class="appointment-time" id="time-21" value="21:00">
                        <label for="time-21">21:00</label>
                        <input type="checkbox" class="appointment-time" id="time-22" value="22:00">
                        <label for="time-22">22:00</label>
                    </div>
                </div>
                <div class="court-status">
                    <div class="status">   
                        <div class="square" style="background-color: green;"></div>
                        <p>Ready</p> 
                    </div>
                    <div class="status">   
                        <div class="square" style="background-color: #0056b3;"></div>
                        <p>Your booking choice</p> 
                    </div>
                    <div class="status">   
                        <div class="square" style="background-color: orange;"></div>
                        <p>Confirming</p> 
                    </div>
                    <div class="status">   
                        <div class="square" style="background-color: red;"></div>
                        <p>Booked</p> 
                    </div>
                    <div class="status">   
                        <div class="square" style="background-color: gray;"></div>
                        <p>Locked</p> 
                    </div>
                </div>
            </div>
            <div class="but-book"> 
                <button type="submit" class="booking"><b>NEXT</b></button>
            </div>
        </form>
    </body>
</html>


