<%-- 
    Document   : acceptedRateChart
    Created on : Jul 2, 2024, 6:04:02 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Booking Acceptance Rate Chart</title>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2.0.0"></script>
        <style>
            body {
                font-family: 'Inter', sans-serif;
                background-color: #f4f7f6;
                color: #333;
                text-align: center;
                margin: 0;
                padding: 0;
            }
            header {
                background-color: #004494;
                color: white;
                padding: 1em 0;
                box-shadow: 0 4px 2px -2px gray;
            }
            .chart-container {
                width: 80%;
                height: 400px;
                margin: 2em auto;
                padding: 2em;
                background: white;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            footer {
                background-color: #004494;
                color: white;
                padding: 1em 0;
                position: fixed;
                width: 100%;
                bottom: 0;
                box-shadow: 0 -4px 2px -2px gray;
            }
            h1 {
                font-size: 2em;
                margin: 0.5em 0;
            }
            p {
                margin: 0.5em 0;
                font-size: 1.2em;
            }
            .animate-fadein {
                animation: fadein 2s;
            }
            @keyframes fadein {
                from {
                    opacity: 0;
                }
                to {
                    opacity: 1;
                }
            }
        </style>
    </head>
    <body>
        <jsp:include page="AdHeader.jsp" flush="true" />
        <header>
            <h1 class="animate-fadein">Booking Acceptance Rate Chart</h1>
            <p class="animate-fadein">Visual representation of accepted and rejected booking rates</p>
        </header>

        <div class="chart-container animate-fadein">
            <canvas id="chart"></canvas>
        </div>

        <footer>
            <p>&copy; 2024 Badminton Stadium Booking System. All rights reserved.</p>
        </footer>

        <script>
            // Ensure listRate is correctly populated
            var listRate = [
            <c:forEach var="item" items="${requestScope.listRate}" varStatus="itemStatus">
            "${item}"<c:if test="${!itemStatus.last}">,</c:if>
            </c:forEach>
            ];

            console.log("List Rate:", listRate); // Debugging: Check the listRate in the browser console

            function processData() {
                var status = ["Accepted Booking", "Rejected Booking", "Waiting Booking"];
                return {
                    labels: status,
                    data: listRate.map(function (rate) {
                        return parseFloat(rate); // Ensure float values
                    })
                };
            }

            function generateColors(count) {
                const colors = [
                    '#FF6384', '#36A2EB', '#FFCE56', '#4BC0C0', '#9966FF',
                    '#FF9F40', '#FF6384', '#C9CBCF', '#4BC0C0', '#FF9F40',
                    '#FF6B6B', '#4ECDC4', '#45B7D1', '#FFA07A', '#98D8C8',
                    '#7FDBFF', '#FDCB6E', '#778BEB', '#786FA6', '#F8A5C2',
                    '#63CDDA', '#CF6A87', '#786FA6', '#FDA7DF'
                ];
                return colors.slice(0, count); // Cut the array to the required length
            }

            function showChart() {
                var processedData = processData();
                var total = processedData.data.reduce((sum, val) => sum + val, 0);

                var data = {
                    labels: processedData.labels,
                    datasets: [{
                            label: "Booking Accepted Rate",
                            backgroundColor: generateColors(processedData.data.length),
                            borderColor: generateColors(processedData.data.length),
                            borderWidth: 1,
                            hoverBackgroundColor: generateColors(processedData.data.length),
                            hoverBorderColor: "rgba(255,99,132,1)",
                            data: processedData.data,
                            tension: 0.4
                        }]
                };

                var options = {
                    plugins: {
                        datalabels: {
                            formatter: (value, context) => {
                                let percentage = (value / total * 100).toFixed(2) + '%';
                                return percentage;
                            },
                            color: '#fff',
                            font: {
                                weight: 'bold'
                            }
                        },
                        tooltip: {
                            callbacks: {
                                label: function (tooltipItem) {
                                    let value = tooltipItem.raw;
                                    let percentage = (value / total * 100).toFixed(2) + '%';
                                    return tooltipItem.label + ': ' + percentage;
                                }
                            }
                        }
                    },
                    maintainAspectRatio: false
                };

                var ctx = document.getElementById('chart').getContext('2d');
                if (window.myChart instanceof Chart) {
                    window.myChart.destroy();
                }
                window.myChart = new Chart(ctx, {
                    type: 'pie', // Change chart type here if needed
                    data: data,
                    options: options,
                    plugins: [ChartDataLabels]
                });
            }

            // Call showChart to render the chart
            showChart();
        </script>
    </body>
</html>
