<%-- 
    Document   : AddNewStadium
    Created on : Jun 7, 2024, 12:26:31 PM
    Author     : NhanNQT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Add Stadium Information</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                min-height: 100vh;
                display: flex;
                justify-content: center;
                align-items: center;
                background-color: #f0f2f5;
                position: relative;
                overflow: auto;
            }

            .background-image {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-image: url('<%=request.getContextPath()%>/img/background/bg2.jpg');
                background-repeat: no-repeat;
                background-size: cover;
                background-position: center;
                filter: blur(5px);
                z-index: -1;
            }

            .overlay {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: rgba(255, 255, 255, 0.2);
                z-index: -1;
            }

            .form-container {
                background-color: #ffffff;
                padding: 40px;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
                width: 400px;
                text-align: center;
                position: relative;
                z-index: 1;
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
                background: #145569;
            }

            .time-labels {
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            .time-labels select {
                padding: 8px;
                border-radius: 5px;
                border: 1px solid #ccc;
                width: 48%;
                outline: none;
            }

            .file-upload-container {
                margin-bottom: 20px;
            }

            .file-upload-label {
                display: inline-block;
                background-color: #4CAF50;
                color: white;
                padding: 10px 20px;
                font-size: 16px;
                border-radius: 5px;
                cursor: pointer;
            }

            .file-upload-label:hover {
                background-color: #0056b3;
            }

            .file-upload-input {
                display: none;
            }

            .file-upload-filename {
                display: block;
                margin-top: 10px;
                font-size: 14px;
            }
        </style>
    </head>

    <body>
        <div class="background-image"></div>
        <div class="overlay"></div>
        <div class="form-container">
            <h1>ADD NEW STADIUM INFORMATION</h1>
            <form action="AddNewSta" method="POST" enctype="multipart/form-data">
                <label for="stadium-name">Stadium name:</label>
                <input type="text" id="stadium-name" name="stadium_name" required>

                <label for="stadium-address">Stadium address:</label>
                <input type="text" id="stadium-address" name="stadium_address" required>

                <label for="stadium-phone">Stadium Phone:</label>
                <input type="text" id="stadium-phone" name="stadium_phone" required>

                <label for="stadium-time">Choose Time:</label>
                <div class="time-labels">
                    <select id="startTime" name="startTime"></select>
                    <select id="endTime" name="endTime"></select>
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

                    document.getElementById("endTime").addEventListener("change", function () {
                        var startTime = document.getElementById("startTime").value;
                        var endTime = this.value;
                        if (startTime >= endTime) {
                            alert("Thời gian kết thúc phải sau thời gian bắt đầu.");
                            this.value = startTime;
                        }
                    });
                </script>

                <label for="stadium-image">Stadium Image:</label>
                <div class="file-upload-container">
                    <label for="stadium-image" class="file-upload-label">Stadium Image</label>
                    <input type="file" id="stadium-image" name="stadium_image" class="file-upload-input" accept="image/*" required>
                    <span id="stadium-file-name" class="file-upload-filename"></span>
                </div>

                <script>
                    document.getElementById('stadium-image').addEventListener('change', function () {
                        if (this.files.length > 0) {
                            var fileName = this.files[0].name;
                            document.getElementById('stadium-file-name').textContent = fileName;
                        } else {
                            document.getElementById('stadium-file-name').textContent = "No file chosen";
                        }
                    });
                </script>

                <label for="QRCode">QR Code:</label>
                <div class="file-upload-container">
                    <label for="QRCode" class="file-upload-label">QR Code Image</label>
                    <input type="file" id="QRCode" name="QRCode" class="file-upload-input" accept="image/*" required>
                    <span id="qr-file-name" class="file-upload-filename"></span>
                </div>

                <script>
                    document.getElementById('QRCode').addEventListener('change', function () {
                        if (this.files.length > 0) {
                            var fileName = this.files[0].name;
                            document.getElementById('qr-file-name').textContent = fileName;
                        } else {
                            document.getElementById('qr-file-name').textContent = "No file chosen";
                        }
                    });
                </script>

                <label for="price-per-hour">Price Per Hour:</label>
                <input type="text" id="price-per-hour" name="price_per_hour" required>

                <button type="submit" class="confirm-button">CONFIRM</button>
            </form>
        </div>
    </body>
</html>
