<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Sport Stadium Booking System</title>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <style>
            body {
                background: #E6FDE1;
                padding: 16px;
                font-family: Arial, sans-serif;
            }

            .datePickerContainer {
                display: flex;
                justify-content: space-between;
                align-items: center;
                width: 100%;
                flex-wrap: wrap;
                gap: 10px;
            }

            .datePickerContainer select,
            .datePickerContainer button {
                flex: 1;
                padding: 8px 12px;
                border: 1px solid #ccc;
                border-radius: 4px;
                font-size: 16px;
                min-width: 150px;
            }

            .datePickerContainer button {
                background-color: #D3E4F5;
                color: #000;
                border: none;
                cursor: pointer;
                transition: background-color 0.3s, color 0.3s;
            }

            .datePickerContainer select:hover,
            .datePickerContainer button:hover {
                border-color: #999;
            }

            .datePickerContainer select:focus {
                outline: none;
                border-color: #007bff;
                box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
            }

            canvas {
                border: 1px dotted red;
            }

            .chart-container {
                position: relative;
                margin: auto;
                height: 80vh;
                width: 95vw;
            }
        </style>
    </head>

    <body>
        <form id="chartForm" action="OccupancyRateController" method="get">
            <div class="datePickerContainer">
                <input type="hidden" id="stadiumID" name="StadiumID" value="${param.StadiumID}">
                <select id="yearSelector" name="year" onchange="submitForm()">
                    <option value="">Select Year</option>
                    <option value="2025" ${requestScope.selectedYear eq '2025' ? 'selected' : ''}>2025</option>
                    <option value="2024" ${requestScope.selectedYear eq '2024' ? 'selected' : ''}>2024</option>
                    <option value="2023" ${requestScope.selectedYear eq '2023' ? 'selected' : ''}>2023</option>
                    <option value="2022" ${requestScope.selectedYear eq '2022' ? 'selected' : ''}>2022</option>
                </select>

                <select id="monthSelector" name="month" onchange="submitForm()" disabled>
                    <option value="">Select Month</option>
                    <option value="1" ${requestScope.selectedMonth eq '1' ? 'selected' : ''}>January</option>
                    <option value="2" ${requestScope.selectedMonth eq '2' ? 'selected' : ''}>February</option>
                    <option value="3" ${requestScope.selectedMonth eq '3' ? 'selected' : ''}>March</option>
                    <option value="4" ${requestScope.selectedMonth eq '4' ? 'selected' : ''}>April</option>
                    <option value="5" ${requestScope.selectedMonth eq '5' ? 'selected' : ''}>May</option>
                    <option value="6" ${requestScope.selectedMonth eq '6' ? 'selected' : ''}>June</option>
                    <option value="7" ${requestScope.selectedMonth eq '7' ? 'selected' : ''}>July</option>
                    <option value="8" ${requestScope.selectedMonth eq '8' ? 'selected' : ''}>August</option>
                    <option value="9" ${requestScope.selectedMonth eq '9' ? 'selected' : ''}>September</option>
                    <option value="10" ${requestScope.selectedMonth eq '10' ? 'selected' : ''}>October</option>
                    <option value="11" ${requestScope.selectedMonth eq '11' ? 'selected' : ''}>November</option>
                    <option value="12" ${requestScope.selectedMonth eq '12' ? 'selected' : ''}>December</option>
                </select>

                <select id="chartTypeSelector" name="chartType" onchange="updateChartType()">
                    <option value="bar">Bar Chart (Vertical)</option>
                    <option value="line">Line Chart</option>
                    <option value="horizontalBar">Bar Chart (Horizontal)</option>
                </select>
            </div>
        </form>

        <div class="chart-container">
            <canvas id="chart"></canvas>
        </div>

        <script>
            var freqList = [
            <c:forEach var="item" items="${freqList}" varStatus="itemStatus">
            "${item}"<c:if test="${!itemStatus.last}">,</c:if>
            </c:forEach>
            ];

            function processYearData() {
                var months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
                return {
                    labels: months,
                    data: freqList.map(Number)
                };
            }

            function processMonthData() {
                var days = Array.from({length: 31}, (_, i) => (i + 1).toString());
                return {
                    labels: days,
                    data: freqList.map(Number)
                };
            }

            function showChart() {
                var chartType = document.getElementById('chartTypeSelector').value;
                var processedData;
                var monthSelector = document.getElementById('monthSelector');

                if (monthSelector.disabled || monthSelector.value === "") {
                    processedData = processYearData();
                } else {
                    processedData = processMonthData();
                }

                var data = {
                    labels: processedData.labels,
                    datasets: [{
                            label: monthSelector.disabled || monthSelector.value === "" ? "Booking of each month" : "Booking of each day",
                            backgroundColor: "rgba(255,99,132,0.2)",
                            borderColor: "rgba(255,99,132,1)",
                            borderWidth: 2,
                            hoverBackgroundColor: "rgba(255,99,132,0.4)",
                            hoverBorderColor: "rgba(255,99,132,1)",
                            data: processedData.data,
                            tension: 0.4
                        }]
                };

                var isHorizontal = false;

                if (chartType === 'horizontalBar') {
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

                var ctx = document.getElementById('chart').getContext('2d');
                if (window.myChart instanceof Chart) {
                    window.myChart.destroy();
                }
                window.myChart = new Chart(ctx, {
                    type: chartType,
                    data: data,
                    options: options
                });
            }

            function updateMonthSelector() {
                var yearSelector = document.getElementById('yearSelector');
                var monthSelector = document.getElementById('monthSelector');

                if (yearSelector.value) {
                    monthSelector.disabled = false;
                } else {
                    monthSelector.disabled = true;
                    monthSelector.selectedIndex = 0;
                }
            }

            function updateChartType() {
                showChart();
            }

            document.addEventListener('DOMContentLoaded', function () {
                updateMonthSelector();
                showChart();

                //khi chọn year
                document.getElementById('yearSelector').addEventListener('change', function () {
                    updateMonthSelector();
                });
            });

            function submitForm() {
                var yearSelector = document.getElementById('yearSelector');
                var monthSelector = document.getElementById('monthSelector');

                if (yearSelector.value) {
                    document.getElementById("chartForm").submit();
                } else {
                    monthSelector.disabled = true; // Disable month selector
                    monthSelector.selectedIndex = 0; // Reset to "Select Month"
                }
            }
        </script>
    </body>
</html>
