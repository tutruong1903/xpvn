/**
 * Traffic Chart (ApexCharts)
 * Displays hourly traffic usage chart using ApexCharts library
 * Note: This script requires traffic data to be passed from template
 */

function getTrafficChartConfig(trafficData) {
    return {
        chart: {
            type: "line",
            fontFamily: "Inter, sans-serif",
            height: '100%',
            parentHeightOffset: 0,
            toolbar: { show: false },
            animations: { enabled: true }
        },
        stroke: { curve: "smooth", width: 3 },
        fill: { opacity: 1 },
        series: [{ name: "使用流量（MB）", data: trafficData }],
        tooltip: { theme: "light" },
        grid: {
            padding: { top: 0, right: 0, left: 0, bottom: 0 },
            strokeDashArray: 4
        },
        xaxis: {
            title: { text: "小时" },
            labels: { padding: 0 },
            tooltip: { enabled: false },
            axisBorder: { show: false },
            categories: ["00","01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23"]
        },
        yaxis: {
            title: { text: "使用流量（MB）", rotate: -90 },
            labels: { padding: 14 }
        },
        colors: ["#0051d5"],
        legend: { show: false }
    };
}

function initTrafficChart() {
    const chartElement = document.getElementById('traffic-log');
    if (!chartElement || !window.ApexCharts) return;
    
    // Traffic data should be set globally by template
    if (!window.trafficLogData) {
        console.warn('Traffic log data not found');
        return;
    }
    
    try {
        const chart = new ApexCharts(chartElement, getTrafficChartConfig(window.trafficLogData));
        chart.render();
    } catch (error) {
        console.error('流量图表初始化失败:', error);
    }
}

document.addEventListener("DOMContentLoaded", function () {
    initTrafficChart();
});
