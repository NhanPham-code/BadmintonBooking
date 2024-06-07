<%-- 
    Document   : AddNewStadium
    Created on : Jun 7, 2024, 12:26:31 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Update Stadium Information</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                height: 100vh;

                display: flex;
                justify-content: center;
                align-items: center;
                position: relative;
                overflow: hidden;
            }

            .background-image {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-image: url('<%=request.getContextPath()%>/img/background/bg2.jpg');
                background-size: cover;
                background-position: center;
                filter: blur(5px);
                /* Làm mờ ảnh */
                z-index: -1;
            }

            .overlay {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: rgba(255, 255, 255, 0.2);
                /* Lớp phủ sáng màu để làm mờ ảnh nền */
                z-index: -1;
            }

            .content {
                position: relative;
                z-index: 1;
                /* Đảm bảo nội dung hiển thị trên cùng */
            }


            .form-container {
                background-color: #ffffff;
                padding: 40px;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
                width: 400px;
                text-align: center;
            }

            .form-container h1 {
                margin-bottom: 20px;
                font-size: 24px;
                color: #022B3A;
            }

            .form-container label {
                display: block;
                text-align: left;
                margin-bottom: 5px;
                font-weight: bold;
                color: #022B3A;
            }

            .form-container input[type="text"],
            .form-container input[type="file"] {
                width: calc(100% - 20px);
                padding: 10px;
                margin-bottom: 20px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }

            .file-input-container {
                position: relative;
                margin-right: 300px;
            }

            .file-input-label {
                position: absolute;
                top: 0;
                left: 0;
                padding: 10px;
                background-color: #fff;
                border: 1px solid #ccc;
                border-radius: 4px;
                cursor: pointer;
                width: calc(100% - 20px);
                text-align: left;
            }

            .file-input-label::before {
                content: 'ICON';
                margin-right: 10px;
            }

            .file-input-container input[type="file"] {
                opacity: 0;
                width: calc(100% - 20px);
                height: 100%;
                cursor: pointer;
            }
            .confirm-button {
                background-color: #022B3A;
                color: #fff;
                border: none;
                padding: 10px 20px;
                border-radius: 4px;
                cursor: pointer;
                font-size: 16px;
                transition: background-color 0.3s;
            }

            .confirm-button:hover {
                background-color: #145569;
                color: #ff0;
            }

            /* CSS mới để định dạng label start và end trên cùng một dòng */
            .time-labels {
                display: flex;
                align-items: center;
                /* Căn giữa theo chiều dọc */
            }

            select {
                padding: 8px;
                border-radius: 5px;
                border: 1px solid #ccc;
                width: 100%;
                max-width: 200px;
                outline: none;
                /* Điều chỉnh chiều rộng tối đa của các ô chọn */
            }

            /* Định dạng các nhãn để đặt cạnh nhau */
            .label-container {
                display: inline-block;
                width: 80px;
                /* Điều chỉnh chiều rộng của các nhãn */
                text-align: right;

                margin-left: 10px;
                /* Tạo khoảng cách giữa các nhãn và các ô chọn */
            }

            /* Định dạng ô chọn thời gian để đặt cạnh nhau */
            .select-container {
                display: inline-block;
                width: calc(70% - 70px);
                /* Chiều rộng của ô chọn thời gian sẽ là 100% trừ đi chiều rộng của nhãn */
                outline: none;
            }

            .file-input-container {
                margin-bottom: 20px;
            }

            label {
                display: block;
                margin-bottom: 10px;
            }

            input[type="file"] {
                display: none;
            }

            .select-images-button {
                background-color: #3f8aed;
                color: #fff;
                border: none;
                padding: 10px 20px;
                border-radius: 4px;
                cursor: pointer;
                font-size: 16px;
                transition: background-color 0.3s;
                width: 140px !important;
            }

            .select-images-button:hover {
                background-color: #0056b3;
            }

            /* Định dạng khoảng cách giữa nút chọn hình ảnh và các hình ảnh đã chọn */
            .space {
                margin-top: 10px;
            }

            /* Định dạng biểu tượng hoặc hình ảnh trong nút */
            .add-image-icon {
                width: 50px;
                /* Điều chỉnh kích thước của biểu tượng */
                height: auto;
                margin-right: 5px;
                /* Tạo khoảng cách giữa biểu tượng và văn bản */
            }
        </style>
    </head>

    <body>
        <div class="background-image"></div>
        <div class="overlay"></div>
        <div class="container">
            <div class="form-container">
                <h1>ADD NEW STADIUM INFORMATION</h1>
                <form>
                    <label for="stadium-name">Stadium name:<i class="fas fa-star"></i></label>
                    <input type="text" id="stadium-name" name="stadium-name" required>

                    <label for="stadium-address">Stadium address:</label>
                    <input type="text" id="stadium-address" name="stadium-address" required>

                    <label for="stadium-phone">Stadium Phone:</label>
                    <input type="text" id="stadium-phone" name="stadium-phone" required>

                    <!-- Thêm một div để nhóm label start và end -->
                    <label for="stadium-name">Choose Time:</label>
                    <div class="time-labels">
                        <div class="label-container">
                            <label for="startTime">Start</label>
                        </div>
                        <div class="select-container">
                            <select id="startTime"></select>
                        </div>
                        <div class="label-container">
                            <label for="endTime">End</label>
                        </div>
                        <div class="select-container">
                            <select id="endTime"></select>
                        </div>
                    </div>




                    <script>
                        function populateTimeSelect(selectId) {
                            var select = document.getElementById(selectId);
                            for (var hour = 0; hour <= 23; hour++) {
                                for (var minute = 0; minute < 60; minute += 30) {
                                    var timeString = (hour < 10 ? "0" : "") + hour + ":" + (minute === 0 ? "00" : "30");
                                    var option = new Option(timeString, timeString);
                                    select.add(option);
                                }
                            }
                        }

                        populateTimeSelect("startTime");
                        populateTimeSelect("endTime");

                        // Sử dụng JavaScript để ngăn người dùng chọn thời gian không hợp lệ
                        document.getElementById("endTime").addEventListener("change", function () {
                            var startTime = document.getElementById("startTime").value;
                            var endTime = this.value;
                            if (startTime >= endTime) {
                                alert("Thời gian kết thúc phải sau thời gian bắt đầu.");
                                this.value = startTime; // Đặt lại giá trị nếu không hợp lệ
                            }
                        });
                    </script>

                    <label for="stadium-images">Stadium Images:</label>
                    <div class="file-input-container">
                        <input type="file" id="stadium-images" name="stadium-images" accept="image/*" required>
                        <button class="select-images-button" onclick="document.getElementById('stadium-images').click()">
                            <img class="add-image-icon" src="add_image_icon.png" alt="Add Image">
                        </button>
                    </div>
                    <div class="space"></div>
                    <label for="stadium-images">QR Images:</label>
                    <div class="file-input-container">
                        <input type="file" id="stadium-images" name="stadium-images" accept="image/*" required>
                        <button class="select-images-button" onclick="document.getElementById('stadium-images').click()">
                            <img class="add-image-icon" src="add_image_icon.png" alt="Add Image">
                        </button>
                    </div>
                    <div class="space"></div>

                    <label for="price-per-hour">PricePerHour:</label>
                    <input type="text" id="price-per-hour" name="price-per-hour" required>

                    <button type="submit" class="confirm-button">CONFIRM</button>
                </form>
            </div>
        </div>
    </body>

</html>