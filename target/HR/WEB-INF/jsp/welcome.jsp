<%@page import="edu.hebeu.entity.Employee"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String path = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <link rel="shortcut icon" href="favicon.ico"> <link href="css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="<%=path %>/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="<%=path %>/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=path %>/css/animate.css" rel="stylesheet">
    <link href="<%=path %>/css/style.css?v=4.1.0" rel="stylesheet">
     <script>
		var myVar=setInterval(function(){myTimer()},1000);
		function myTimer(){
			var d=new Date();
			var t=d.toLocaleTimeString();
			document.getElementById("time").innerHTML=t;
		}
	</script>
</head>
<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
              <div class="jumbotron">
              	<div style="margin-left: 250px">
                    <p>&nbsp;</p>
					<%Employee employee = (Employee)session.getAttribute("loged"); %>
					<h1><%=employee.getName() %></h1>
					<p>&nbsp;</p>
					<p>欢迎登录HR人事管理系统</p>
					<p id="time">&nbsp;</p>
					<p>&nbsp;</p>
					<%--<p><a href="<%=path %>/attendance/addStart.do?employeeNumber=<%=employee.getEmployeeNumber() %>" --%>
							<%--class="btn btn-info btn-lg" id="but1">&nbsp;上班签到&nbsp;</a>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;--%>
                            <button class="btn btn-info btn-lg" id="but1">&nbsp;上班签到&nbsp;</button>
						<%--<a href="<%=path %>/attendance/addEnd.do?employeeNumber=<%=employee.getEmployeeNumber() %>" --%>
							<%--class="btn btn-info btn-lg" id="but2">&nbsp;下班签到&nbsp;</a>--%>
                            <button class="btn btn-info btn-lg" id="but2">&nbsp;下班签到&nbsp;</button>
					</p>
					<p>&nbsp;</p>
					<p>&nbsp;</p>
                </div>
            </div>
            </div>
         </div>
     </div>
	<!-- 全局js -->
    <script src="<%=path%>/js/jquery.min.js?v=2.1.4"></script>
    <script src="<%=path%>/js/bootstrap.min.js?v=3.3.6"></script>
    
    <!-- 自定义js -->
    <script src="<%=path%>/js/content.js?v=1.0.0"></script>
    
    <!-- layer javascript -->
    <script src="js/plugins/layer/layer.min.js"></script>
   	<script>
   //      var flag = 0;
   // 	$("#but1").click(function () {
   //      if (flag == 0){
   //          parent.layer.alert('签到成功！');
   //          flag = 1;
   //      }
   //  });
   // if (flag == 1){
   //     $("#but1").attr("disabled",true).css("pointer-events","none");
   // }
   //  $("#but2").click(function () {
   //      parent.layer.alert('签到成功！')
   //      $("#but2").attr("disabled",true).css("pointer-events","none");
   //  });
   function current() {
       var d = new Date(),
           str = '';
       str += d.getFullYear() + '年'; //获取当前年份
       str += d.getMonth() + 1 + '月'; //获取当前月份（0——11）
       str += d.getDate() + '日';
       str += d.getHours() + '时';
       str += d.getMinutes() + '分';
       str += d.getSeconds() + '秒';
       return str;
   }
        $(function(){
            $("#but1").click(function(){
                $.ajax({url:"/attendance/addStart.do?employeeNumber=<%=employee.getEmployeeNumber()%>",
                success:function (data){if (data==200){
                    parent.layer.alert('签到成功！'+current());
                    document.getElementById('but1').disabled = true;}else {
                    parent.layer.alert("请勿重复签到");
                    document.getElementById('but1').disabled = true;
                }}
                });
            })
        })

        $(function(){
            $("#but2").click(function(){
                $.ajax({url:"/attendance/addEnd.do?employeeNumber=<%=employee.getEmployeeNumber() %>",
                success:function (data){if (data==200){
                   parent.layer.alert('签到成功！'+current());
                   document.getElementById('but2').disabled = true;}else {
                    parent.layer.alert("请勿重复签到");
                    document.getElementById('but2').disabled = true;
                }}
                });
            })
        })

    </script>
</body>
</html>
