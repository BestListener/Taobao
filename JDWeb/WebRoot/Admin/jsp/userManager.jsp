<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String search = "";
String state = "";
if( session.getAttribute("search") != null )
	search = session.getAttribute("search").toString();
if( session.getAttribute("state") != null )
	state = session.getAttribute("state").toString();
if( state.equals("正常") )
	state = "normal";
else if( state.equals("停用") )
	state = "stop";
%>

<html>
  <head>
    <base href="<%=basePath%>">
	<link rel="stylesheet" type="text/css" href="/JDWeb/Admin/css/userManager.css">
	<script type="text/javascript" src="/JDWeb/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="/JDWeb/Admin/js/userManager.js"></script>
	<script type="text/javascript">
		function init()
		{
			curOption = "<%=state%>";
			if( curOption == "" )
				curOption = "normal";
			var curBtn = document.getElementById(curOption);
			var view = document.getElementById("usersList");
			curBtn.style.color = "black";
			curBtn.style.borderBottomColor = "#FF4111";
			view.src = options[curOption];
			getUserNum();
			var search = "<%=search%>";
			if( search != "" )
				document.getElementById("inputText").value = search;
		}
	</script>
	<style type="text/css">
	
	</style>
  </head>
  
  <body onload="init()">
    <div id="title">用户管理</div>
   		<div id="content">
   			<div id="searchRegion">
   				<label>请输入:</label>
   				<input id="inputText" placeholder="请输入用户名/手机号" onfocus="clearInput()" type="text" maxlength="20"/>
   				<input id="searchBtn" onclick="searchUser()" type="button" value="搜索"/>
   			</div>
   			<div id="state_box">
   				<span id="state">状态：</span>
   				<span id="normal" onclick="clickOption(this)">正常</span>
   				<span id="stop" onclick="clickOption(this)">停用</span>
   			</div>
   			<div id="usersTitle">
   				<label id="usersTitleleft">用户列表</label>
   				<label id="usersRightTitle"></label>
   			</div>
   			<iframe id="usersList" src="">
   			</iframe>
   		</div>
  </body>
</html>
