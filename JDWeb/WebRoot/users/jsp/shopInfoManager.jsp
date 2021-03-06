<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
  <head>
    <base href="<%=basePath%>">
	<link rel="stylesheet" type="text/css" href="./users/css/shopInfo.css">
	<script type="text/javascript" src="./js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="./users/js/shopInfo.js"></script>
	<script type="text/javascript">
		function init()
		{
			var msg = "${msg}";
			if( msg != "" )
				alert(msg);
		}
	</script>
  </head>
  
  <body onload="init()">
    <div id="title">店铺信息管理</div>
   	<div id="content">
   		<form id="shopData" action="./servlet/saveShopInfo" method="get" enctype="multipart/form-data">
   			<table id="shopInfoTab">
   				<tr>
   					<td colspan="2" class="openTip">您已经拥有店铺，只能修改店铺信息。</td>
   				</tr>
   				<tr>
   					<td align="right">店铺名:</td>
   					<td><input id="shopName" name="shopName" value="${shop.getShopname() }" onfocus="changeBorderColor(this)" placeholder="店铺名不能为空" type="text" maxlength="10"></td>
   				</tr>
   				<tr>
   					<td align="right">掌柜名:</td>
   					<td><input id="shopowName" name="shopowName" value="${shop.getOwnername() }" onfocus="changeBorderColor(this)" placeholder="掌柜名不能为空" type="text" maxlength="10"></td>
   				</tr>
   				<tr>
   					<td align="right">联系方式:</td>
   					<td><input id="shopPhone" name="shopPhone" value="${shop.getPhoneNumber() }" onfocus="changeBorderColor(this)" placeholder="手机号码不能为空" type="text" maxlength="11"></td>
   				</tr>
   				<tr>
   					<td align="right" valign="top">身份认证:</td>
   					<td>
   						<img id="identifyPic" alt="认证照片" src="./${shop.getIdentifyImg() }">
   					</td>
				</tr>
   				<tr>
   					<td></td>
   					<td>
   				   		<input id="upload" type="button" value="上传图片">
   						<input id="identifyPicSrc" name="identifyPicSrc" onchange="updatePic()" type="file" accept="image/gif,image/jpeg,image/jpg,image/png,image/svg" maxlength="80">
   						<input id="saveSrc" value="${shop.getIdentifyImg() }" name="saveSrc" style="display:none" type="text"/>
   					</td>
   				</tr>
   				<tr>
   					<td></td>
   					<td><input id="change" type="button" onclick="changeInfo()" value="修改"></td>
   				</tr>
   			</table>
   		</form>
   	</div>
  </body>
</html>
