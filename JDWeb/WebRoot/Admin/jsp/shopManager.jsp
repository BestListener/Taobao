<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String search = "";
String state = "";
if( session.getAttribute("shopsearch") != null )
	search = session.getAttribute("shopsearch").toString();
if( session.getAttribute("shopstate") != null )
	state = session.getAttribute("shopstate").toString();
if( state.equals("等待验证") )
	state = "verify";
else if( state.equals("正在运营") )
	state = "normal";
else if( state.equals("停止运营") )
	state = "stop";
%>

<html>
  <head>
    <base href="<%=basePath%>">
	<link rel="stylesheet" type="text/css" href="/JDWeb/Admin/css/shopManager.css">
	<script type="text/javascript" src="/JDWeb/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="/JDWeb/Admin/js/shopManager.js"></script>
	<script type="text/javascript">
		function init()
		{
			curOption = "<%=state%>";
			if( curOption == "" )
				curOption = "verify";
			var curBtn = document.getElementById(curOption);
			var view = document.getElementById("shopsList");
			curBtn.style.color = "black";
			curBtn.style.borderBottomColor = "#FF4111";
			view.src = options[curOption];
			getShopNum();
			var search = "<%=search%>";
			if( search != "" )
				document.getElementById("inputText").value = search;
		}
	</script>
  </head>
  
  <body onload="init()">
    <div id="title">店铺管理</div>
   		<div id="content">
   			<div id="searchRegion">
   				<label>请输入:</label>
   				<input id="inputText" placeholder="请输入店铺名/掌柜名/手机号" onfocus="clearInput()" type="text" maxlength="20"/>
   				<input id="searchBtn" onclick="searchShop()" type="button" value="搜索"/>
   			</div>
   			<div id="state_box">
   				<span id="state">状态：</span>
   				<span id="verify" onclick="clickOption(this)">等待验证</span>
   				<span id="normal" onclick="clickOption(this)">正在运营</span>
   				<span id="stop" onclick="clickOption(this)">停止运营</span>
   			</div>
   			<div id="shopTitle">
   				<label id="shopTitleleft">店铺列表</label>
   				<label id="shopRightTitle"></label>
   			</div>
   			<iframe id="shopsList" src="">
   			</iframe>
   		</div>
  </body>
</html>
