<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
  <head>
    <base href="<%=basePath%>">
    <link rel="stylesheet" type="text/css" href="./users/css/shopGoodsView.css">
    <script type="text/javascript" src="./users/js/shopGoodsView.js"></script>
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
