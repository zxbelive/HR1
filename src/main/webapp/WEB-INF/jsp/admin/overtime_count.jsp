<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="edu.hebeu.entity.*" %>
<%@ page import="com.baomidou.mybatisplus.plugins.Page" %>
<%@page import="edu.hebeu.util.MTimeUtil"%>
<% String path = request.getContextPath(); %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HR - 加班统计</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link rel="shortcut icon" href="favicon.ico">
    <link href="<%=path %>/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="<%=path %>/css/font-awesome.css?v=4.4.0" rel="stylesheet">

    <!-- Data Tables -->
    <link href="<%=path %>/css/plugins/dataTables/dataTables.bootstrap.css"
          rel="stylesheet">
    <link href="<%=path %>/css/animate.css" rel="stylesheet">
    <link href="<%=path %>/css/style.css?v=4.1.0" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="<%=path %>/dist/sweetalert.css">
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>加班统计</h5>
                </div>
                <div class="ibox-content">
                    起始时间:<input type="date" class="startdate" id="start">
                    结束时间:<input type="date" class="stopdate" id="stop">
                    <button class="btn btn-success" type="abutton" onclick="s()">确认</button>
                    <a class="btn btn-success" href="/overtime/countlist.do">显示所有</a>
                    <table  class="table table-striped table-bordered table-hover dataTables-example">
                        <thead>
                        <tr>
                            <th>工号</th>
                            <th>姓名</th>
                            <th>部门</th>
                            <th>加班次数</th>
                        </tr>
                        </thead>
                        <tbody id="t">
                        <%
                            List<overtimestatistics> list= (List<overtimestatistics>) request.getAttribute("List");
                            for (overtimestatistics olist : list) {

                        %>
                        <tr class="gradeA">
                            <td><%=olist.getEmpid() %></td>
                            <td><%=olist.getName() %></td>
                            <td><%=olist.getDepname()%></td>
                            <td><%=olist.getCounts() %></td>
                        </tr>
                        <%

                            }
                        %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 全局js -->
<script src="<%=path %>/js/jquery.min.js?v=2.1.4"></script>
<script src="<%=path %>/js/bootstrap.min.js?v=3.3.6"></script>
<script src="<%=path %>/js/plugins/jeditable/jquery.jeditable.js"></script>

<!-- Data Tables -->
<script src="<%=path %>/js/plugins/dataTables/jquery.dataTables.js"></script>
<script src="<%=path %>/js/plugins/dataTables/dataTables.bootstrap.js"></script>

<!-- 自定义js -->
<script src="<%=path %>/js/content.js?v=1.0.0"></script>

<!-- layer javascript -->
<script src="js/plugins/layer/layer.min.js"></script>

<script type="text/javascript">
    function s() {
        var startdate=document.getElementById("start").value;
        var stopdate=document.getElementById("stop").value;
        $.ajax({url:"/overtime/countlistcondition.do",data:{"startdate":startdate,"stopdate":stopdate},success:function (data) {
            console.log(data)
                console.log(data[0].empid)
                $("#t").html('<tr class="gradeA"></tr>')
                for (var i=0;i<data.length;i++){
                    $("#t").append(
                        '<tr class="gradeA">'+
                        '<td>'+data[i].empid+'</td>' +
                        '<td>'+data[i].name+'</td>' +
                        '<td>'+data[i].depname+'</td>' +
                        '<td>'+data[i].counts+'</td>'
                    +'</tr>')
                }

        }
        });
    }
</script>
</body>
</html>
