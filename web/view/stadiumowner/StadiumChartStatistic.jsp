<%-- 
    Document   : StadiumChartStatistic
    Created on : Jun 26, 2024, 6:03:53 PM
    Author     : WINDOWS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Sport Stadium Booking System</title>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
            />
        <style>
            body {
                background: #E6FDE1 !important;
            }

            .datePickerContainer {
                display: flex;
                align-items: center;
                width: 100%;
                flex-wrap: wrap;
            }

            .datePickerContainer select,
            .datePickerContainer button {
                flex-grow: 1;
                padding: 8px 12px;
                border: 1px solid #ccc;
                border-radius: 4px;
                font-size: 16px;
                margin-right: 10px;
                margin-bottom: 10px;
            }

            .datePickerContainer button {
                background-color: #D3E4F5;
                color: #000000;
                border: none;
                cursor: pointer;
                transition: background-color 0.3s, color 0.3s;
                outline: none;
            }

            .datePickerContainer select:hover {
                border-color: #999;
            }

            .datePickerContainer select:focus {
                outline: none;
                border-color: #007bff;
                box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
            }

            .error-message {
                color: red;
                margin-top: 10px;
            }

            canvas {
                border: 1px dotted red;
            }

            .chart-container {
                position: relative;
                margin: auto;
                height: 90vh;
                width: 95vw;
            }
            
            .exit-button {
                margin-bottom: 2%;
            }

            .exit-button a {
                font-family: cursive;
                font-size: 120%;
                color: blue;
                text-decoration: none;
                font-weight: bold;
                transition: background-color 0.3s ease;
                position: relative;
            }

            .exit-button a::after {
                content: '';
                position: absolute;
                width: 100%;
                height: 2px;
                bottom: 0;
                left: 0;
                background-color: blue;
                transform: scaleX(0);
                transform-origin: bottom right;
                transition: transform 0.3s ease-out;
            }

            .exit-button a:hover::after {
                transform: scaleX(1);
                transform-origin: bottom left;
            }
        </style>
    </head>

    <body>
        <div class = "exit-button">
            <a href="bookingManage?stadiumID=${requestScope.stadiumID}">Return to menu</a>
        </div> 
        
        <div class="datePickerContainer">
            <select id="yearSelector">
                <option value="" disabled selected>Select Year</option>
                <option value="2024">2024</option>
                <option value="2023">2023</option>
                <option value="2022">2022</option>
            </select>
            <select id="monthSelector">
                <option value="">Select Month</option>
                <option value="0">January</option>
                <option value="1">February</option>
                <option value="2">March</option>
                <option value="3">April</option>
                <option value="4">May</option>
                <option value="5">June</option>
                <option value="6">July</option>
                <option value="7">August</option>
                <option value="8">September</option>
                <option value="9">October</option>
                <option value="10">November</option>
                <option value="11">December</option>
            </select>
            <select id="chartTypeSelector">
                <option value="bar">Bar Chart (Vertical)</option>
                <option value="line">Line Chart</option>
                <option value="horizontalBar">Bar Chart (Horizontal)</option>
            </select>
            <button onclick="showChart()">Show Chart</button>
        </div>

        <div class="error-message" id="errorMessage" style="display:none;">Please select a year before selecting a month.</div>

        <div class="chart-container">
            <canvas id="chart"></canvas>
        </div>

        <script>
            var acceptedBookings = [
            <c:forEach items="${acceptedBookings}" var="booking" varStatus="status">
            {
            date: '<fmt:formatDate value="${booking.date}" pattern="yyyy-MM-dd"/>',
                    total: ${booking.total}
            }<c:if test="${!status.last}">,</c:if>
            </c:forEach>
            ];

            function filterByYear(bookings, year) {
                return bookings.filter(function (booking) {
                    return new Date(booking.date).getFullYear() === year;
                });
            }

            function filterByMonth(bookings, month) {
                return bookings.filter(function (booking) {
                    return new Date(booking.date).getMonth() === month;
                });
            }

            function processData(acceptedBookings, monthSelected) {
                if (monthSelected !== null) {
                    const year = 2024; // Modify by user selected
                    const daysInMonth = new Date(year, monthSelected + 1, 0).getDate();

                    let dailyData = {};
                    let days = [];

                    for (var i = 1; i <= daysInMonth; i++) {
                        dailyData[i] = 0;
                        days.push(i);
                    }

                    acceptedBookings.forEach(function (booking) {
                        var date = new Date(booking.date);
                        var day = date.getDate();
                        dailyData[day] += booking.total;
                    });

                    return {
                        labels: days,
                        data: Object.values(dailyData)
                    };
                } else {
                    var monthlyData = Array(12).fill(0);
                    var months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
                    acceptedBookings.forEach(function (booking) {
                        var date = new Date(booking.date);
                        var month = date.getMonth();
                        monthlyData[month] += booking.total;
                    });
                    return {
                        labels: months,
                        data: monthlyData
                    };
                }
            }

            function showChart() {
                var selectedYear = parseInt(document.getElementById('yearSelector').value);
                var selectedMonth = document.getElementById('monthSelector').value;
                var selectedChartType = document.getElementById('chartTypeSelector').value;
                var errorMessage = document.getElementById('errorMessage');

                if (selectedMonth !== "" && isNaN(selectedYear)) {
                    errorMessage.style.display = "block";
                    return;
                } else {
                    errorMessage.style.display = "none";
                }

                var filteredBookings = filterByYear(acceptedBookings, selectedYear);

                var monthSelected = selectedMonth !== "";

                if (monthSelected) {
                    filteredBookings = filterByMonth(filteredBookings, parseInt(selectedMonth));
                }

                var processedData = processData(filteredBookings, monthSelected ? parseInt(selectedMonth) : null);

                var data = {
                    labels: processedData.labels,
                    datasets: [{
                            label: monthSelected ? "Avenue of day" : "Avenue of month",
                            backgroundColor: "rgba(255,99,132,0.2)",
                            borderColor: "rgba(255,99,132,1)",
                            borderWidth: 2,
                            hoverBackgroundColor: "rgba(255,99,132,0.4)",
                            hoverBorderColor: "rgba(255,99,132,1)",
                            data: processedData.data,
                            tension: 0.4

                        }]
                };

                var chartType = selectedChartType;
                var isHorizontal = false;

                if (selectedChartType === 'horizontalBar') {
                    chartType = 'bar';
                    isHorizontal = true;
                }


                var options = {
                    maintainAspectRatio: false,
                    scales: {
                        y: {
                            beginAtZero: true,
                            stacked: true,
                            grid: {
                                display: true,
                                color: "rgba(255,99,132,0.2)"
                            }
                        },
                        x: {
                            grid: {
                                display: false
                            }
                        }
                    }
                };

                if (isHorizontal) {
                    options.indexAxis = 'y';
                } else {
                    options.indexAxis = 'x';
                }

                if (window.myChart instanceof Chart) {
                    window.myChart.destroy();
                }

                window.myChart = new Chart(document.getElementById('chart'), {
                    type: chartType,
                    options: options,
                    data: data
                });
            }

            document.addEventListener('DOMContentLoaded', function () {
                document.getElementById('yearSelector').value = new Date().getFullYear();
                showChart();
            });
        </script>
    </body>
</html>
