<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.setCharacterEncoding("utf-8");
Map data = (Map)request.getAttribute("shop");
String state = data.get("shopstate").toString();
%>

<html>
  <head>
    <base href="<%=basePath%>">
	<link rel="stylesheet" type="text/css" href="/JDWeb/Admin/css/shopInfoView.css">
	<script type="text/javascript" src="./js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="/JDWeb/Admin/js/shopInfoView.js"></script>
	<script type="text/javascript">
		var state = "<%=state%>";
	</script>
  </head>
  
  <body onload="init()">
    <div id="title">店铺资料</div>
   	<div id="content">
 			<table id="shopInfoTab">
 				<tr>
 					<td align="right">店铺名:</td>
 					<td>${shop.shopname }</td>
 				</tr>
 				<tr>
 					<td align="right">店铺状态:</td>
 					<td id="shopstate" >${shop.shopstate }</td>
 				</tr>
 				<tr>
 					<td align="right">掌柜名:</td>
 					<td>${shop.ownername }</td>
 				</tr>
 				<tr>
 					<td align="right">所属用户:</td>
 					<td>${shop.username }</td>
 				</tr>
 				<tr>
 					<td align="right">联系方式:</td>
 					<td>${shop.phoneNumber }</td>
 				</tr>
 				<tr>
 					<td align="right" valign="top">身份认证:</td>
 					<td>
 						<img id="identifyPic" alt="认证照片" src="/JDWeb/${shop.identifyImg }">
 					</td>
				</tr>
 			</table>
 			<div id="stopBtn" class="stopBtn" onclick="clickStopBtn('${shop.sid }')" onmouseover="instopBtn(this)" onmouseout="outstopBtn(this)">停用</div>
   			<div id="recoverBtn" class="recoverBtn" onclick="clickRecoverBtn('${shop.sid }')" onmouseover="inRecoverBtn(this)" onmouseout="outRecoverBtn(this)">恢复</div>
   			<div id="passBtn" class="passBtn" onclick="clickPassBtn('${shop.sid }')" onmouseover="inRecoverBtn(this)" onmouseout="outRecoverBtn(this)">通过</div>
   			<div class="backBtn" onclick="clickBackBtn(this)" onmouseover="inCheckBtn(this)" onmouseout="outCheckBtn(this)">返回</div>	
   	</div>
  </body>
</html>
