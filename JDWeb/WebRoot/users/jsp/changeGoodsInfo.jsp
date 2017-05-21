<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="cn.edu.zhku.she.Model.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Product data = (Product)request.getAttribute("product");
%>

<html>
  <head>
    <base href="<%=basePath%>">
	<link rel="stylesheet" type="text/css" href="./users/css/GoodsView.css">
    <script type="text/javascript" src="./js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="./users/js/GoodsView.js"></script>
    <script type="text/javascript">
    	function init()
    	{
    		var msg = "${msg}";
    		if( msg != "" )
    			alert(msg);
    	}
    </script>
    <style type="text/css">
    	#booksInfo,#cosmeticsInfo,#watchInfo
    	{
    		display:block;
    	}
    	#firstClass,#secondClass,#brank
    	{
    		background-color:#EEEEEE;
    		disabled:disabled;
    	}
    </style>
  </head>
  
  <body onload="init()">
    <div id="title">修改商品信息</div>
   		<div id="content">
   			<form id="productData" action="./servlet/alterProductInfo" method="get" enctype="multipart/form-data">
   			<table id="goodsInfoTab">
   				<tr>
   					<td class="leftTd">封面图:</td>
   					<td class="midTd">
   						<input name="pid" type="text" value="${product.getPid() }" style="display:none"/>
   						<img id="showImage" alt="封面图" src="./${product.getBigImg() }">
   					</td>
				</tr>
   				<tr>
   					<td></td>
   					<td class="midTd">
   				   		<input id="upload" type="button" class="uploadBtn" value="上传图片">
   						<input id="showImageSrc" name="showImageSrc" onchange="updateShowPic()" class="showImageSrc" type="file" accept="image/gif,image/jpeg,image/jpg,image/png,image/svg" maxlength="80">
   						<input id="saveShowImage" name="saveShowImage" value="${product.getBigImg() }" type="text" style="display:none">
   					</td>
   				</tr>
   				<tr>
   					<td class="leftTd">商品名:</td>
   					<td  class="midTd" colspan="3">
   					<input id="goodsName" name="goodsName" value="${product.getName() }" type="text" maxlength="20">
   					</td>
   				</tr>
   				<tr>
   					<td class="leftTd">商品价格:</td>
   					<td class="midTd">
   					<input id="goodsPrice" name="goodsPrice" value="${product.getPrice() }" type="text" maxlength="10">
   					</td>
   					<td class="rightTd">商品分类:</td>
   					<td class="selectTd">
	   					<select id="firstClass" name="firstClass">
	   						<option value="${product.getFirstClass() }">${product.getFirstClass() }</option>
	   					</select>
	   					<select id="secondClass" name="secondClass">
	   						<option value="${product.getSecondClass() }">${product.getSecondClass() }</option>
	   					</select>
	   					<%
	   						if( !data.getFirstClass().equals("书") )
	   						{
	   					 %>
	   					<select id="brank" name="brank">
	   						<option value="${product.getBrank() }">${product.getBrank() }</option>
	   					</select>
	   					<%
	   						}
	   					 %>
   					</td>
   				</tr>
   				<tr>
   					<td class="leftTd">库存:</td>
   					<td class="midTd"><input id="goodsNum" name="goodsNum" value="${product.getSaveNum() }" type="text" maxlength="6"></td>
   				</tr>
   				<tr>
   					<td class="leftTd">详细图片:</td>
   					<td class="midTd">
   						<img id="imageInter" name="imageInter" alt="详细图片" src="./${product.getSmallImg() }">
   					</td>
   					<td class="rightTd">介绍图片:</td>
   					<td>
   						<img id="infoImage" name="infoImage" alt="介绍图片" src="./${product.getInfoImg() }">
   					</td>
				</tr>
   				<tr>
   					<td></td>
   					<td class="midTd">
   				   		<input id="upload" type="button" class="uploadBtn" value="上传图片">
   						<input id="interImageSrc" name="interImageSrc" onchange="updateInterPic()" class="showImageSrc" type="file" accept="image/gif,image/jpeg,image/jpg,image/png,image/svg" maxlength="80">
   						<input id="saveInterImage" name="saveInterImage"  value="${product.getSmallImg() }" type="text" style="display:none">
   					</td>
   					<td></td>
   					<td>
   				   		<input id="upload" type="button" class="uploadBtn" value="上传图片">
   						<input id="infoImageSrc" name="infoImageSrc" onchange="updateInfoPic()" class="showImageSrc" type="file" accept="image/gif,image/jpeg,image/jpg,image/png,image/svg" maxlength="80">
   						<input id="saveInfoImage" name="saveInfoImage"  value="${product.getInfoImg() }" type="text" style="display:none">
   					</td>
   				</tr>
   			</table>
   			<%
   				if( data.getFirstClass().equals("书")  )
   				{
   			 %>
   			<div id="booksInfo" class="bottomInfo">
   				<ul class="booksDetailInfo">
		   			<li>书名：<input name="bookName" value="${product.getBookName() }" type="text"/></li>
		   			<li>出版社名称：<input name="publishName" value="${product.getPublishName() }" type="text"/></li>
		   			<li>出版时间：<input name="publishDate" value="${product.getPublishDate() }" type="text"/></li>
		   			<li>作者：<input name="author" value="${product.getAuthor() }" type="text"/></li>
		   			<li>开本：<input name="bookPage" value="${product.getBookPage() }" type="text"/></li>
		   		</ul>
   			</div>
   			<%
   				}
   				else if( data.getFirstClass().equals("美妆")  )
   				{
   			 %>
   			<div id="cosmeticsInfo" class="bottomInfo">
   				<ul class="goodsDetailInfo">
		   			<li>规格类型：<input name="cosSize" value="${product.getCosSize() }" type="text"/></li>
		   			<li>月份：<input name="cosMonth" value="${product.getCosMonth() }" type="text"/></li>
		   			<li>适合肤质：<input name="fitSkin" value="${product.getFitSkin() }" type="text"/></li>
		   			<li>功效：<input name="cosEffect" value="${product.getCosEffect() }" type="text"/></li>
		   			<li>保质期：<input name="period" value="${product.getPeriod() }" type="text"/></li>
		   			<li>产地：<input name="proAddress" value="${product.getProAddress() }" type="text"/></li>
		   		</ul>
   			</div>
   			<%
   				}
   				else if( data.getFirstClass().equals("手表")  )
   				{
   			 %>
   			<div id="watchInfo" class="bottomInfo">
   				<ul class="goodsDetailInfo">
		   			<li>型号：<input name="watchNo" value="${product.getWatchNo() }" type="text"/></li>
		   			<li>形状：<input name="watchApp" value="${product.getWatchApp() }" type="text"/></li>
		   			<li>机芯类型：<input name="watchMove" value="${product.getWatchMove() }" type="text"/></li>
		   			<li>风格：<input name="watchStyle" value="${product.getWatchStyle() }" type="text"/></li>
		   			<li>品牌产地：<input name="watchProduce" value="${product.getWatchProduce() }" type="text"/></li>
		   			<li>显示方式：<input name="watchDisplay" value="${product.getWatchDisplay() }" type="text"/></li>
		   			<li>表带材质：<input name="watchStrap" value="${product.getWatchStrap() }" type="text"/></li>
		   		</ul>
   			</div>
   			<%
   				}
   			 %>
   			<div id="confirmAdd" onclick="changeInfo()" onmouseover="mouseOverCon(this)" onmouseout="mouseOutCon(this)">确定</div>
   			<div id="cancel" onclick="comeback()" onmouseover="mouseOverCan(this)" onmouseout="mouseOutCan(this)">返回</div>
   			</form>
   		</div>
  </body>
</html>
