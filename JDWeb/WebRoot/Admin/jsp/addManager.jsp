<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
  <head>
    <base href="<%=basePath%>">
	<link rel="stylesheet" type="text/css" href="/JDWeb/Admin/css/addManager.css">
	<script type="text/javascript" src="/JDWeb/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="/JDWeb/js/jquery.md5.js"></script>
    <script type="text/javascript" src="/JDWeb/Admin/js/addManager.js"></script>
  </head>
  
  <body>
    <div id="title">添加系统管理员</div>
   	<div id="content">
   		<table id="managerInfo">
   			<tr>
   				<td>用户名：</td>
   				<td><input id="admin_name" onfocus="recoverColor(this)" type="text" style="width:200px" placeholder="用户名长度大于4" maxlength="10"/></td>
   			</tr>
   			<tr>
   				<td>登录密码：</td>
   				<td><input id="admin_psd" onfocus="recoverColor(this)" type="password" style="width:200px"  placeholder="密码长度不小于6" maxlength="16"/></td>
   			</tr>
   			<tr>
   				<td>确认密码：</td>
   				<td><input id="check_psd" onfocus="recoverColor(this)" type="password" style="width:200px"  placeholder="密码必须一致" maxlength="16"/></td>
   			</tr>
   		</table>
   		<input id="conBtn" onclick="toAddManager()" type="button" value="确定"/>
   		<input id="resetBtn" onclick="clearInput()" type="button" value="重置"/>
   	</div>
   </body>
</html>
