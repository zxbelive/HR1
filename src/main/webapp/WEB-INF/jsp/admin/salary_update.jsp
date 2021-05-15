<%@ page import="edu.hebeu.entity.Salary" %>
<%@ page import="edu.hebeu.util.MTimeUtil" %><%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 2021/5/5
  Time: 11:14
  To change this template use File | Settings | File Templates.
--%>
<% String path = request.getContextPath(); %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HR - 修改员工薪资</title>
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

</head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>修改员工薪资</h5>
                </div>
                <div class="ibox-content">
                    <% Salary salary = (Salary)request.getAttribute("salary"); %>
                    <form method="post" class="form-horizontal" id="commentForm" action="<%=path %>/salary/<%=salary.getId() %>/update.do">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">姓名</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="departmentNumber" value="<%=salary.getEmployee().getName() %>" readonly="readonly">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">部门名称</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" placeholder="" name="name" value="<%=salary.getDepartment().getName() %>" readonly="readonly">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">职务</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" placeholder="" name="name" value="<%=salary.getPosition().getName() %>" readonly="readonly">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">薪资</label>
                            <div class="col-sm-7">
                                <input type="text" id="aaa" class="form-control" placeholder="" name="basicSalary" value="<%=salary.getBasicSalary() %>" style="width: 150px">
                                <button type="button" onclick="getDaysBetween()" style="margin-left: 435px;margin-top: -30px">+10%</button>
                                <button type="button" onclick="getDaysBetween1()" style="margin-left: 495px;margin-top: -30px">+20%</button>
                                <button type="button" onclick="getDaysBetween2()" style="margin-left: 555px;margin-top: -30px">+30%</button>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">更改时间</label>
                            <div class="col-sm-7">
                                <%
                                    String intime = MTimeUtil.dateFormat(salary.getInTime());
                                %>
                                <input type="text" class="form-control" placeholder="" name="address" value="<%=intime %>" readonly="readonly">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">备注</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" placeholder="" name="notes" value="<%=salary.getNotes() %>">
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <div class="col-sm-4 col-sm-offset-8">
                                <button class="btn btn-success" type="submit">修&nbsp;&nbsp;改</button>&nbsp;&nbsp;&nbsp;&nbsp;
                                <a class="btn btn-white" href="/salary/to.do?pageNo=1">取&nbsp;&nbsp;消</a>
                            </div>
                        </div>
                    </form>
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

<!-- 表单验证 -->
<script src="<%=path %>/js/plugins/validate/jquery.validate.min.js"></script>
<script src="<%=path %>/js/plugins/validate/messages_zh.min.js"></script>

<!-- layer javascript -->
<script src="js/plugins/layer/layer.min.js"></script>
<script>
    $().ready(function() {
        $("#commentForm").validate();
    });
    $.validator.setDefaults({
        submitHandler: function() {
            parent.layer.alert('修改成功！',{icon: 1}),
                form.submit();
        }
    });
</script>
<script>
    function getDaysBetween() {
        <%
            double newsalery=salary.getBasicSalary()+salary.getBasicSalary()*0.1;
        %>
        document.getElementById("aaa").value=<%= newsalery %>
    }
    function getDaysBetween1() {
        <%
            double newsalery1=salary.getBasicSalary()+salary.getBasicSalary()*0.2;
        %>
        document.getElementById("aaa").value=<%= newsalery1 %>
    }
    function getDaysBetween2() {
        <%
            double newsalery2=salary.getBasicSalary()+salary.getBasicSalary()*0.3;
        %>
        document.getElementById("aaa").value=<%= newsalery2 %>
    }
</script>

</body>
</html>
