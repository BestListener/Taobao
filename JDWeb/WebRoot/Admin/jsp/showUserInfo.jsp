<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.setCharacterEncoding("utf-8");
Map data = (Map)request.getAttribute("user");
String state = data.get("state").toString();
%>

<html>
  <head>
    <base href="<%=basePath%>">
	<link rel="stylesheet" type="text/css" href="/JDWeb/Admin/css/userInfoView.css">
	<script type="text/javascript" src="/JDWeb/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="/JDWeb/Admin/js/userInfoView.js"></script>
	<script type="text/javascript">
		var state = "<%=state%>";
	</script>
  </head>
  
  <body onload="init()">
   	<div id="title">用户资料</div>
   		<div id="content">
   			<table id="userInfoTab">
   				<tr>
   					<td>当前头像:</td>
   					<td>
   						<img id="userImage" alt="用户头像" src="/JDWeb/${user.image }">
   					</td>
				</tr>
				<tr>
   					<td>状态:</td>
   					<td id="userstate">${user.state }</td>
   				</tr>
   				<tr>
   					<td>用户名:</td>
   					<td>${user.username }</td>
   				</tr>
				<tr>
   					<td>昵称:</td>
   					<td>${user.name }</td>
   				</tr>
   				<tr>
   					<td>真实姓名:</td>
   					<td>${user.realname }</td>
   				</tr>
   				<tr>
   					<td>性别:</td>
   				<% 
	   					if( data.get("sex").toString().equals("0") )
	   					{
   				%>
   					<td>男</td>
  				<%
	  					}else
	  					{
  				%>
  					<td>女</td>
  				<%
  						}
  				 %>
   				</tr>
   				<tr>
   					<td>生日:</td>
   					<td>${user.brithday }</td>
   				</tr>
   				<tr>
   					<td>手机号码:</td>
   					<td>${user.phone }</td>
   				</tr>
   				<tr>
   					<td>收货地址:</td>
   					<td>${user.address }</td>
   				</tr>
   			</table>
   			<div id="stopBtn" class="stopBtn" onclick="clickStopBtn('${user.uid }')" onmouseover="instopBtn(this)" onmouseout="outstopBtn(this)">停用</div>
   			<div id="recoverBtn" class="recoverBtn" onclick="clickRecoverBtn('${user.uid }')" onmouseover="inRecoverBtn(this)" onmouseout="outRecoverBtn(this)">恢复</div>
   			<div class="backBtn" onclick="clickBackBtn(this)" onmouseover="inCheckBtn(this)" onmouseout="outCheckBtn(this)">返回</div>	
   		</div>
  </body>
</html>
