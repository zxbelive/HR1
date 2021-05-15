<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 2021/5/4
  Time: 7:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>图</title>
    <script src="https://cdn.jsdelivr.net/npm/echarts@5.1.1/dist/echarts.min.js"></script>
    <script src="/js/jquery.min.js?v=2.1.4"></script>
</head>
<body>
<div>
<div id="main" style="width: 500px;height:400px;float: left"></div>
<div id="t" style="width: 500px;height: 400px;float: right"></div>
</div>
</body>

<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var fmyChart = echarts.init(document.getElementById('main'));
    var smyChart = echarts.init(document.getElementById('t'));

    $(document).ready(function(){
        $.ajax({url:"/echarts/sexmap.do"}).done(function (data) {
            var v=[];
            v.push(data[0].name);
            v.push(data[1].name);
            var k=[];
            k.push(data[0].value)
            k.push(data[1].value)

            smyChart.setOption({
                title : {
                    text: '男女比例图',//主标题
                    subtext: '',//副标题
                    x:'center'//x轴方向对齐方式
                },
                tooltip : {
                    trigger: 'item',
                    formatter: "{a} <br/>{b} : {c} ({d}%)"
                },
                legend: {
                    orient: 'vertical',
                    bottom: 'bottom',
                    data: v
                },
                series : [
                    {
                        name: '人数',
                        type: 'pie',
                        radius : '55%',
                        center: ['50%', '60%'],
                        data:
                            data,
                        itemStyle: {
                            emphasis: {
                                shadowBlur: 10,
                                shadowOffsetX: 0,
                                shadowColor: 'rgba(0, 0, 0, 0.5)'
                            }
                        }
                    }
                ]
            })
        })
        $.ajax({url:"/echarts/salarymap.do"}).done(function (data) {
            var v=[];
            v.push(data[0].name);
            v.push(data[1].name);
            v.push(data[2].name)
            fmyChart.setOption({
                title : {
                    text: '工资比例图',//主标题
                    subtext: '',//副标题
                    x:'center',//x轴方向对齐方式
                },
                tooltip : {
                    trigger: 'item',
                    formatter: "{a} <br/>{b} : {c} ({d}%)"
                },
                legend: {
                    orient: 'vertical',
                    bottom: 'bottom',
                    data: v
                },
                series : [
                    {
                        name: '人数',
                        type: 'pie',
                        radius : '55%',
                        center: ['50%', '60%'],
                        data:
                        data,
                        itemStyle: {
                            emphasis: {
                                shadowBlur: 10,
                                shadowOffsetX: 0,
                                shadowColor: 'rgba(0, 0, 0, 0.5)'
                            }
                        }
                    }
                ]
            });
        })
    });
</script>




</html>
