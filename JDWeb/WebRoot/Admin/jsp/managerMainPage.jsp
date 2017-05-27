<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
response.setCharacterEncoding("utf-8");
String adminname = "";
adminname = session.getAttribute("adminname").toString();
%>

<html>
  <head>
    <base href="<%=basePath%>">
    <title>平台管理页面</title>
	<link rel="stylesheet" type="text/css" href="/JDWeb/Admin/css/managerMainPage.css">
	<script type="text/javascript" src="/JDWeb/Admin/js/managerMainPage.js"></script>
  </head>
  
  <body onload="init()">
  		<div id="head">
  			<label id="headtitle">平&nbsp;台&nbsp;管&nbsp;理</label>
  			<label id="admin_name">你好,管理员&nbsp;<%=adminname %></label>
  			<label id="exit" onclick="exit()">退出</label>
  		</div>
 		<div id="view">
		<div id="left_ctrl_box">
			<div id="system_manager_title">系统管理</div>
			<ul id="sys_mag_option">
				<li id="system_info" onclick="selectOption(this)" onmouseover="tarOption(this)" onmouseout="unTarOption(this)">●&nbsp;系统信息</li>
				<li id="add_manager" onclick="selectOption(this)" onmouseover="tarOption(this)" onmouseout="unTarOption(this)">●&nbsp;添加管理员</li>
				<li id="notice_manager" onmouseover="tarOption(this)" onmouseout="unTarOption(this)">●&nbsp;公告管理</li>
			</ul>
			<div id="user_manager_title">用户管理</div>
			<ul id="user_mag_option">
				<li id="user_manger" onclick="selectOption(this)" onmouseover="tarOption(this)" onmouseout="unTarOption(this)">●&nbsp;用户管理</li>
				<li id="flow_manager" onmouseover="tarOption(this)" onmouseout="unTarOption(this)">●&nbsp;流量管理</li>
			</ul>
			<div id="shop_manager_title">店铺管理</div>
			<ul id="shop_mag_option">
				<li id="shop_check" onclick="selectOption(this)" onmouseover="tarOption(this)" onmouseout="unTarOption(this)">●&nbsp;店铺审核</li>
				<li id="product_manager" onmouseover="tarOption(this)" onmouseout="unTarOption(this)">●&nbsp;产品管理</li>
			</ul>
		</div>
		<iframe id="right_info_box" src="">
		</iframe>
  	</div>
  </body>
</html>
