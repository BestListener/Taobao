<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
  <head>
    <base href="<%=basePath%>">
	<script type="text/javascript">
		function init()
		{
			window.parent.scrollTo(0,0); 
		}
		function toAddGoods()
		{
			window.location.href = "./users/jsp/shopAddGoods.jsp";
		}
		//  查找物品，返回查找数据
		function searchGoods()
		{
			var input = document.getElementById("inputText");
			if( input.value != "" )
			{
				var searchVal = input.value;
				//  清空两侧空格
				document.getElementById("goodsList").src = "./servlet/getProductInfo?search="+searchVal;
			}
		}
		//  清空查找栏,返回全部数据
		function clearInput()
		{
			var input = document.getElementById("inputText");
			if( input.value != "" )
			{
				input.value = "";
				document.getElementById("goodsList").src = "./servlet/getProductInfo";
			}
		}
	</script>
	<style type="text/css">
	body,input,select
	{
		font-family:Microsoft YaHei;
	}
	#title
	{
		position:absolute;
		top:0px;
		left:0px;
		width:100%;
		height:30px;
		padding-top:8px;
		font-size:18px;
		text-indent:20px;
		background-color:#EEEEEE;
	}
	#content
	{
		position:absolute;
		top:40px;
		left:0px;
		width:100%;
	}
	#searchRegion
	{
		position:absolute;
		top:0px;
		left:20px;
		width:95%;
		height:50px;
	}
	#searchRegion label
	{
		position:absolute;
		top:10px;
		left:260px;
	}
	#inputText
	{
		position:absolute;
		top:9px;
		left:325px;
		width:29%;
		font-size:15px;
	}
	#searchBtn
	{
		position:absolute;
		top:9px;
		left:635px;
		width:60px;
		font-size:15px;
		cursor:pointer;
	}
	#goodsTitle
	{
		position:absolute;
		top:50px;
		left:20px;
		width:95%;
		height:30px;
		border-bottom:#CCCCCC solid 1px;
	}
	#goodsTitle label
	{
		position:absolute;
		left:100px;
	}
	#addGoodsBtn
	{
		position:absolute;
		top:0px;
		right:50px;
		width:80px;
		font-size:15px;
		cursor:pointer;
		border:none;
		background-color:#FF4400;
		color:white;
	}
	#addGoodsBtn:hover
	{
		background-color:#EE3000;
	}
	#goodsList
	{
		position:absolute;
		top:85px;
		left:20px;
		width:95%;
		height:660px;
		border:none;
	}
	</style>
  </head>
  
  <body onload="init()">
    <div id="title">商品管理</div>
   		<div id="content">
   			<div id="searchRegion">
   				<label>请输入:</label>
   				<input id="inputText" placeholder="请输入宝贝名" onfocus="clearInput()" type="text" maxlength="20"/>
   				<input id="searchBtn" onclick="searchGoods()" type="button" value="搜索"/>
   			</div>
   			<div id="goodsTitle">
   				<label>商品列表</label>
   				<input id="addGoodsBtn" onclick="toAddGoods()" type="button" value="上架商品"/>
   			</div>
   			<iframe id="goodsList" src="./servlet/getProductInfo">
   			</iframe>
   		</div>
  </body>
</html>
