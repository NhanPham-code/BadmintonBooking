<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Sport Stadium Booking System</title>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/pizzip/3.1.1/pizzip.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/docxtemplater/3.21.1/docxtemplater.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/2.0.5/FileSaver.min.js"></script>

        <style>
            body {
                background: #E6FDE1;
                padding: 16px;
            }

            .datePickerContainer {
                display: flex;
                align-items: center;
                width: 100%;
                flex-wrap: wrap;
            }

            .datePickerContainer select {
                flex-grow: 1;
                padding: 8px 12px;
                border: 1px solid #ccc;
                border-radius: 4px;
                font-size: 16px;
                margin-right: 10px;
                margin-bottom: 10px;
            }

            .datePickerContainer select:hover {
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


            .download-buttons {
                display: flex;
                gap: 10px;
            }

            .download-button button {
                padding: 10px 20px;
                font-size: 16px;
                background-color: #007bff;
                color: white;
                border: none;
                cursor: pointer;
                border-radius: 4px;
                transition: background-color 0.3s;
                margin-right: 10px;
            }

            .download-button button:hover {
                background-color: #0056b3;
            }
            .button-container {
                display: flex;
                justify-content: space-between;
                align-items: center;
                gap: 10px;
            }

        </style>
    </head>

    <body>
        <div class="button-container">
            <div class="exit-button">
                <a href="bookingManage?stadiumID=${requestScope.stadiumID}&stadiumName=${requestScope.stadiumName}">Return to menu</a>

            </div>
            <div class="download-buttons">
                <div class="download-button">
                    <button onclick="downloadCSV()">Download Data</button>
                </div>
                <div class="download-button">
                    <button onclick="downloadChart()">Download Chart Image</button>
                </div>
            </div>
        </div>


        <form id="chartForm" action="OccupancyRateBySlotController" method="get">
            <div class="datePickerContainer">
                <input type="hidden" id="stadiumID" name="StadiumID" value="${param.StadiumID}" >

                <select id="yearSelector" name="year" onchange="submitForm()">
                    <option value="">Select Year (reset param)</option>
                    <option value="2025" ${requestScope.selectedYear == 2025 ? 'selected' : ''}>2025</option>
                    <option value="2024" ${requestScope.selectedYear == 2024 ? 'selected' : ''}>2024</option>
                    <option value="2023" ${requestScope.selectedYear == 2023 ? 'selected' : ''}>2023</option>
                    <option value="2022" ${requestScope.selectedYear == 2022 ? 'selected' : ''}>2022</option>
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

                <select id="daySelector" name="day" onchange="submitForm()" disabled>
                    <option value="">Select Day</option>
                </select>

                <select id="chartTypeSelector" name="chartType" onchange="updateChartType()">
                    <option value="bar">Bar Chart (Vertical)</option>
                    <option value="line">Line Chart</option>
                    <option value="horizontalBar">Bar Chart (Horizontal)</option>
                    <!--                    <option value="pie">Pie chart</option>-->
                </select>
            </div>
        </form>

        <div class="chart-container">
            <canvas id="chart"></canvas>
        </div>


        <script>
            var freqList = [
            <c:forEach var="item" items="${requestScope.freqList}" varStatus="itemStatus">
            "${item}"<c:if test="${!itemStatus.last}">,</c:if>
            </c:forEach>
            ];

            var slotList = [
            <c:forEach var="item" items="${requestScope.slotList}" varStatus="itemStatus">
            "${item}"<c:if test="${!itemStatus.last}">,</c:if>
            </c:forEach>
            ];

            function processData() {
                return {
                    labels: slotList,
                    data: freqList.map(Number)
                };
            }

            function showChart() {
                var chartType = document.getElementById('chartTypeSelector').value;
                var processedData = processData();
                var data = {
                    labels: processedData.labels,
                    datasets: [{
                            label: "Booking slot count",
                            backgroundColor: chartType === 'pie' ? generateColors(processedData.data.length) : "rgba(255,99,132,0.2)",
                            borderColor: chartType === 'pie' ? generateColors(processedData.data.length) : "rgba(255,99,132,1)",
                            borderWidth: chartType === 'pie' ? 1 : 2,
                            hoverBackgroundColor: chartType === 'pie' ? generateColors(processedData.data.length) : "rgba(255,99,132,0.4)",
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

                if (chartType === 'pie') {
                    options = {
                        responsive: true,
                        maintainAspectRatio: false
                    };
                }

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

            function generateColors(count) {
                const colors = [
                    '#FF6384', '#36A2EB', '#FFCE56', '#4BC0C0', '#9966FF',
                    '#FF9F40', '#FF6384', '#C9CBCF', '#4BC0C0', '#FF9F40',
                    '#FF6B6B', '#4ECDC4', '#45B7D1', '#FFA07A', '#98D8C8',
                    '#7FDBFF', '#FDCB6E', '#778BEB', '#786FA6', '#F8A5C2',
                    '#63CDDA', '#CF6A87', '#786FA6', '#FDA7DF'
                ];
                return colors.slice(0, count);
            }

            function updateMonthSelector() {
                var yearSelector = document.getElementById('yearSelector');
                var monthSelector = document.getElementById('monthSelector');
                var daySelector = document.getElementById('daySelector');

                // Lưu trữ tháng đã chọn trước khi cập nhật
                var selectedMonth = monthSelector.value;

                if (yearSelector.value) {
                    monthSelector.disabled = false;
                    // Không reset selectedIndex nếu đã chọn tháng
                    if (!selectedMonth) {
                        monthSelector.selectedIndex = 0; // Reset month to default
                    }
                } else {
                    monthSelector.disabled = true;
                    monthSelector.selectedIndex = 0;
                }
                daySelector.disabled = true;
                daySelector.selectedIndex = 0;
            }


            function updateDaySelector() {
                var yearSelector = document.getElementById('yearSelector');
                var monthSelector = document.getElementById('monthSelector');
                var daySelector = document.getElementById('daySelector');

                daySelector.innerHTML = '<option value="">Select Day</option>';
                daySelector.disabled = true;

                if (yearSelector.value && monthSelector.value) {
                    var year = parseInt(yearSelector.value);
                    var month = parseInt(monthSelector.value);
                    var daysInMonth = new Date(year, month, 0).getDate();

                    for (var i = 1; i <= daysInMonth; i++) {
                        var option = document.createElement('option');
                        option.value = i;
                        option.textContent = i;
                        if ('${requestScope.selectedDay}' == i) {
                            option.selected = true;
                        }
                        daySelector.appendChild(option);
                    }

                    daySelector.disabled = false;
                }

                // Call showChart() to update the chart without submitting the form
                showChart();
            }

            function updateChartType() {
                showChart();
            }

            function submitForm() {
                var yearSelector = document.getElementById('yearSelector');
                var monthSelector = document.getElementById('monthSelector');
                var daySelector = document.getElementById('daySelector');
                var chartTypeSelector = document.getElementById('chartTypeSelector');
                var stadiumID = document.getElementById('stadiumID').value;
                var stadiumName = '${param.stadiumName}'; // Get stadiumName from URL parameter

                var url = 'OccupancyRateBySlotController?StadiumID=' + stadiumID + '&stadiumName=' + encodeURIComponent(stadiumName);

                if (yearSelector.value) {
                    url += '&year=' + yearSelector.value;

                    if (monthSelector.value) {
                        url += '&month=' + monthSelector.value;
                        if (daySelector.value) {
                            url += '&day=' + daySelector.value;
                        }
                    }
                }

                // Include chartType in the URL so it can be preserved
                url += '&chartType=' + chartTypeSelector.value;

                window.location.href = url;
            }

            /**
             * 
             * @HongDang
             */
            function downloadCSV() {
                var headers = []; // Initialize an empty array for headers

                // Get the stadium name from the URL parameter
                var urlParams = new URLSearchParams(window.location.search);
                var stadiumName = urlParams.get('stadiumName');

                // Get year and month from selectors
                var year = document.getElementById('yearSelector').value;
                var month = document.getElementById('monthSelector').value;
                var day = document.getElementById('daySelector').value; // Get the selected day

                // Construct the filename
                var filename = stadiumName ? stadiumName : 'UnknownStadium';
                if (year) {
                    filename += '_year:' + year; // Format year as 'year:2024'
                    if (month) {
                        filename += '_month:' + month;
                        if (day) {
                            filename += '_day:' + day; // Append the day if selected
                        }
                    }
                }
                filename += '';

                // Add headers
                headers.push('Slot'); // A2 cell
                headers.push('Booking Count'); // B2 cell

                var csvContent = "data:text/csv;charset=utf-8,";

                // Add filename as the first row in CSV content
                csvContent += ' ' + filename + '\n\n';

                // Add headers row to CSV content
                csvContent += headers.join(',') + '\n';

                // Add data rows (assuming freqList and slotList are defined elsewhere in your code)
                freqList.forEach(function (row, index) {
                    csvContent += '' + slotList[index] + ',' + row + '\n';
                });

                var encodedUri = encodeURI(csvContent);
                var link = document.createElement("a");
                link.setAttribute("href", encodedUri);
                link.setAttribute("download", filename + ".csv"); // Ensure the filename ends with .csv
                document.body.appendChild(link); // Required for Firefox

                link.click(); // This will download the data file with the constructed filename
            }





            document.addEventListener('DOMContentLoaded', function () {
                updateMonthSelector();
                updateDaySelector();
                //showChart();

                document.getElementById('yearSelector').addEventListener('change', function () {
                    updateMonthSelector();
                    //showChart(); // Update the chart without submitting the form
                });

                document.getElementById('monthSelector').addEventListener('change', function () {
                    updateDaySelector();
                    //showChart(); // Update the chart without submitting the form
                });

                document.getElementById('daySelector').addEventListener('change', function () {
                    //showChart(); // Update the chart without submitting the form
                });

                document.getElementById('chartTypeSelector').addEventListener('change', function () {
                    updateChartType();
                });

                // Preserve chartType on page load
                var urlParams = new URLSearchParams(window.location.search);
                var chartType = urlParams.get('chartType');
                if (chartType) {
                    document.getElementById('chartTypeSelector').value = chartType;
                    showChart(); // Re-render chart with preserved chart type
                }
            });

            // Add event listener for the submit button to submit the form
            document.getElementById('submitButton').addEventListener('click', function () {
                submitForm();
            });


            /**
             * 
             * @HongDang
             */
            function downloadChart() {
                var chart = document.getElementById('chart');
                var context = chart.getContext('2d');

                // Save the current state
                context.save();

                // Set the background color to white
                context.globalCompositeOperation = 'destination-over';
                context.fillStyle = '#E6FDE1';
                context.fillRect(0, 0, chart.width, chart.height);

                // Restore the state
                context.restore();

                // Download the chart
                var link = document.createElement('a');
                link.href = chart.toDataURL('image/png');
                link.download = 'chart.png';
                link.click();
            }

            document.addEventListener('DOMContentLoaded', function () {
                updateMonthSelector();
                updateDaySelector();

                document.getElementById('yearSelector').addEventListener('change', function () {
                    updateMonthSelector();
                });

                document.getElementById('monthSelector').addEventListener('change', function () {
                    updateDaySelector();
                });

                document.getElementById('daySelector').addEventListener('change', function () {
                });

                document.getElementById('chartTypeSelector').addEventListener('change', function () {
                    updateChartType();
                });

                var urlParams = new URLSearchParams(window.location.search);
                var chartType = urlParams.get('chartType');
                if (chartType) {
                    document.getElementById('chartTypeSelector').value = chartType;
                    showChart();
                }
            });


        </script>
    </body>
</html>
