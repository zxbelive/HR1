<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 2021/5/4
  Time: 21:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="edu.hebeu.entity.*" %>
<%@ page import="com.baomidou.mybatisplus.plugins.Page" %>
<%@ page import="edu.hebeu.util.MTimeUtil" %>
<% String path = request.getContextPath(); %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HR - 员工薪资列表</title>
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
                    <h5>员工薪资列表</h5>
                </div>
                <div class="ibox-content">
                    <table class="table table-striped table-bordered table-hover dataTables-example">
                        <thead>
                        <tr style="font-size: 13px">
                            <th>序号</th>
                            <th>姓名</th>
                            <th>部门名称</th>
                            <th>职务</th>
                            <th>薪资</th>
                            <th>更改时间</th>
                            <th width="180px">备注</th>
                            <th>管理</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
//                            Page<Salary> pe=(Page<Salary>)request.getAttribute("salaryList");
//                            if(null != pe && null != pe.getRecords() && pe.getRecords().size()>0){
//                                List<Salary> list = pe.getRecords();
//                                int index=1;
//                                for(Salary salary : list){
                            Page<Salary> salaryList= (Page<Salary>) request.getAttribute("salaryList");
                            if(null != salaryList && null != salaryList.getRecords() && salaryList.getRecords().size()>0){
                                List<Salary> list=salaryList.getRecords();
                                int index=1;
                                for(Salary salary : list){





                        %>
                        <tr class="gradeA" style="font-size: 13px">
                            <td><%=index++ %></td>
                            <td><%=salary.getEmployee().getName() %></td>
                            <td><%=salary.getDepartment().getName() %></td>
                            <td><%=salary.getPosition().getName()%></td>
                            <td><%=salary.getBasicSalary() %></td>
                            <%
                                String intime = MTimeUtil.dateFormat(salary.getInTime());
                            %>
                            <td><%=intime %></td>
                            <td><%=salary.getNotes() %></td>
                            <td><a href="<%=path %>/salary/<%=salary.getId() %>/toupdate.do" class="btn btn-primary">修改</a>&nbsp;&nbsp;</td>
                        </tr>
                        <%
                                }
                            }

                        %>
                        </tbody>
                    </table>
                    <div>
							<span style="float: left; padding: 5px">
								当前&nbsp;<span style="color: red;"><%=salaryList.getCurrent() %></span>&nbsp;/&nbsp;<b><%=salaryList.getPages() %></b>&nbsp;页&nbsp;&nbsp;
								总共&nbsp;<b><%=salaryList.getTotal() %></b>&nbsp;条</span>
                            <nav aria-label="Page navigation" style="margin: 0 auto; width: 240px">
                                <ul class="pagination" style="margin: 0;">
                                    <li>
                                        <a href="<%=path %>/salary/to.do?pageNo=<%=salaryList.getCurrent()-1>1?salaryList.getCurrent()-1:1 %>"
                                           aria-label="Previous"> <span aria-hidden="true">前一页</span>
                                        </a>
                                    </li>
                                    <%
                                        for(int i=1;i<=salaryList.getPages();i++){
                                    %>
                                    <li><a href="<%=path %>/salary/to.do?pageNo=<%=i%>"><%=i %></a></li>
                                    <%
                                        }
                                    %>
                                    <li><a href="<%=path %>/salary/to.do?pageNo=<%=salaryList.getCurrent()+1<salaryList.getPages()?salaryList.getCurrent()+1:salaryList.getPages() %>"
                                           aria-label="Next"> <span aria-hidden="true">后一页</span>
                                    </a></li>
                                </ul>
                        </nav>
                    </div>
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
</body>
</html>
