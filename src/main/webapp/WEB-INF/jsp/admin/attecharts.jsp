<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 2021/5/4
  Time: 17:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://cdn.jsdelivr.net/npm/echarts@5.1.1/dist/echarts.min.js"></script>
    <script src="/js/jquery.min.js?v=2.1.4"></script>
</head>
<body>
<div id="main" style="width: 500px;height:400px;float: left"></div>
<div id="t" style="width: 500px;height:400px;float: right"></div>
</body>
<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'));
    var tmychart=echarts.init(document.getElementById('t'));
    $(document).ready(function(){
        $.ajax({url:"/echarts/attmap.do"}).done(function (data) {
            console.log(data)
            var s = [];
            s.push(data[0].timetype);
            s.push(data[0].qdmnumber);
            s.push(data[0].wqdnumber);
            var x = [];
            x.push(data[1].timetype);
            x.push(data[1].qdmnumber);
            x.push(data[1].wqdnumber);
            var w = [];
            w.push(data[2].timetype);
            w.push(data[2].qdmnumber);
            w.push(data[2].wqdnumber);

            myChart.setOption({
                title:{
                text:'考勤人数图'
                },
                legend: {},
                tooltip: {},
                dataset: {
                    // 提供一份数据。
                    source: [
                        ['product', '已签到', '未签到'],
                        s,
                        x,
                        w
                    ]
                },
                // 声明一个 X 轴，类目轴（category）。默认情况下，类目轴对应到 dataset 第一列。
                xAxis: {type: 'category'},
                // 声明一个 Y 轴，数值轴。
                yAxis: {},
                // 声明多个 bar 系列，默认情况下，每个系列会自动对应到 dataset 的每一列。
                series: [
                    {type: 'bar'},
                    {type: 'bar'}
                ]
            });
            $.ajax({url: "/echarts/historymap.do"}).done(function (data) {
                console.log(data)
                var s = [];
                s.push(data[0].name);
                s.push(data[0].value);
                var x = [];
                x.push(data[1].name);
                x.push(data[1].value);
                var w = [];
                w.push(data[2].name);
                w.push(data[2].value);

                tmychart.setOption({
                    title:{
                        text:'员工在职状态图'
                    },
                    legend: {},
                    tooltip: {},
                    dataset: {
                        // 提供一份数据。
                        source: [
                            ['product', '人数'],
                            s,
                            x,
                            w
                        ]
                    },
                    // 声明一个 X 轴，类目轴（category）。默认情况下，类目轴对应到 dataset 第一列。
                    xAxis: {type: 'category'},
                    // 声明一个 Y 轴，数值轴。
                    yAxis: {},
                    // 声明多个 bar 系列，默认情况下，每个系列会自动对应到 dataset 的每一列。
                    series: [
                        {type: 'bar'}
                    ]
                });
            });
        })
    });
</script>
</html>
