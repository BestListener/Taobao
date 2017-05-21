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
		
	</script>
	<style type="text/css">
		
	</style>
  </head>
  
  <body>
    <div id="title">免费开店认证</div>
   	<div id="content">
   		<form id="shopData" action="./servlet/applyOpenShop" method="get" enctype="multipart/form-data">
   			<table id="shopInfoTab">
   				<tr>
   					<td align="right">店铺名:</td>
   					<td><input id="shopName" name="shopName" onfocus="changeBorderColor(this)" placeholder="店铺名不能为空" type="text" maxlength="10"></td>
   				</tr>
   				<tr>
   					<td align="right">掌柜名:</td>
   					<td><input id="shopowName" name="shopowName" onfocus="changeBorderColor(this)" placeholder="掌柜名不能为空" type="text" maxlength="10"></td>
   				</tr>
   				<tr>
   					<td align="right">联系方式:</td>
   					<td><input id="shopPhone" name="shopPhone" onfocus="changeBorderColor(this)" placeholder="手机号码不能为空" type="text" maxlength="11"></td>
   				</tr>
   				<tr>
   					<td align="right" valign="top">身份认证:</td>
   					<td>
   						<img id="identifyPic" alt="认证照片" src="./users/pics/id_card.png">
   					</td>
				</tr>
   				<tr>
   					<td></td>
   					<td>
   				   		<input id="upload" type="button" value="上传图片">
   						<input id="identifyPicSrc" name="identifyPicSrc" onchange="updatePic()" type="file" accept="image/gif,image/jpeg,image/jpg,image/png,image/svg" maxlength="80">
   						<input id="saveSrc" name="saveSrc" type="text" style="display:none"/>
   					</td>
   				</tr>
   				<tr>
   					<td></td>
   					<td><input id="confirm" type="button" onclick="toapplyShop()" value="申请"></td>
   				</tr>
   			</table>
   		</form>
   	</div>
  </body>
</html>
