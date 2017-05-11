<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>所有物品-淘宝搜索</title>
    
	<link rel="stylesheet" type="text/css" href="./css/headerCss.css">
	<link rel="stylesheet" type="text/css" href="./css/searchClass.css">
	<script type="text/javascript" src="./js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="./js/headerJs.js"></script>
	<script type="text/javascript" src="./js/searchClass.js"></script>
	<script type="text/javascript">
  		
  </script>
  <style type="text/css">
  	
	</style>
  </head>
  
  <body onload="init()">
    <div id="title">
  		<img onclick="toMainPage()" alt="淘宝主页" id="titlepic" src="./pics/G`I4EGLGZJHSOIBN7}Q9`RY.png">
  		<label class="viewTitle">全网搜索</label>
  		<input type="text" id="searchInput" name="searchInput" placeholder="请输入宝贝名/种类" maxlength="25"/>
  		<div id="searchBtn">搜索</div>
  	</div>
  	<div id="header">
  		<div id="login" onclick="toLogin()"><label onclick="toLogin()">亲，请登录</label></div>
  		<div id="register" onclick="toRegister()"><label onclick="toRegister()">免费注册</label></div>
  		<div id="account"><label id="username"></label></div>
  		<div class="firstPage" onclick="toMainPage()">淘宝网首页</div>
		<ul id="myaccount" onmouseover="showaccout()" onmouseout="hiddenaccout()">
			<li>
				<label id="myaccountText" class="myaccount_sellerCenter_label" onmouseover="changeFontColor(this)" onmouseout="recoverFontColor(this)">我的淘宝</label>
				<img class="pullDown" alt="下拉" src="./pics/f0d93.png">
			</li>
			<ul id="myaccount_sub">
				<li id="purchased" onmouseover="select(this)" onmouseout="unselect(this)">已买到的宝贝</li>
			</ul>
		</ul>
  		<ul id="shoppingCart" onmouseover="showSpc()" onmouseout="hiddenSpc()">
  			<li>
  				<img id="shoppingCartPic" alt="购物车" src="./pics/supermarket1.png">
  				<label id="scLabel" onmouseover="changeFontColor(this)" onmouseout="recoverFontColor(this)">购物车</label>
  				<label id="shoppingNum">11</label>
  				<img class="pullDown" alt="下拉" src="./pics/f0d93.png">
  			</li>
  			<ul id="shoppingCart_sub">
  				<li id="myshoppingCart" onmouseover="select(this)" onmouseout="unselect(this)">查看我的购物车</li>
  			</ul>
  		</ul>
  		<ul id="favorite" onmouseover="showFav()" onmouseout="hiddenFav()">
  			<li>
  				<img id="favoritePic" alt="收藏夹" src="./pics/star-icon.png">
  				<label onmouseover="changeFontColor(this)" onmouseout="recoverFontColor(this)">收藏夹</label>
  				<img class="pullDown" alt="下拉" src="./pics/f0d93.png">
  			</li>
  			<ul id="favorite_sub">
  				<li id="favorite_good" onmouseover="select(this)" onmouseout="unselect(this)">收藏的宝贝</li>
  			</ul>
  		</ul>
  		<ul id="sellerCenter" onmouseover="showSc()" onmouseout="hiddenSc()">
  			<li>
  				<label class="myaccount_sellerCenter_label" onmouseover="changeFontColor(this)" onmouseout="recoverFontColor(this)">卖家中心</label>
  				<img class="pullDown" alt="下拉" src="./pics/f0d93.png">
  			</li>
  			<ul id="sellerCenter_sub">
  				<li id="openShop" onmouseover="select(this)" onmouseout="unselect(this)">免费开店</li>
  				<li id="sold" onmouseover="select(this)" onmouseout="unselect(this)">已卖出的宝贝</li>
  				<li id="selling" onmouseover="select(this)" onmouseout="unselect(this)">出售中的宝贝</li>
  			</ul>
  		</ul>
  	</div>
  	<div id="view">
  		<div id="classFilter">
  			<label class="filterTitle">物品类型:</label>
  			<table class="filterTable">
  				<tr>
  					<td id="allClass" class="filterTableTd" onclick="classOnClick(this)" onmouseover="selectClass(this)" onmouseout="unselectClass(this)">全部</td>
  					<td id="books" class="filterTableTd" onclick="classOnClick(this)" onmouseover="selectClass(this)" onmouseout="unselectClass(this)">图书</td>
  					<td id="cosmetics" class="filterTableTd" onclick="classOnClick(this)" onmouseover="selectClass(this)" onmouseout="unselectClass(this)">美妆品</td>
  					<td id="watches" class="filterTableTd" onclick="classOnClick(this)" onmouseover="selectClass(this)" onmouseout="unselectClass(this)">手表</td>
  				</tr>
  			</table>
  		</div>
  		<div id="goodsSort">
  			<label class="gsLab">排序：</label>
  			<div id="sellNum" class="sellNumSty" onclick="sortOnClick(this)" onmouseover="selectSort(this)" onmouseout="unselectSort(this)">销量</div>
  			<div id="priceUp" class="priceUpSty" onclick="sortOnClick(this)" onmouseover="selectSort(this)" onmouseout="unselectSort(this)">价格升序</div>
  			<div id="priceDown" class="priceDownSty" onclick="sortOnClick(this)" onmouseover="selectSort(this)" onmouseout="unselectSort(this)">价格降序</div>
  		</div>
  		<iframe id="goodsView" src="./jsp/booksDataView.jsp">
  			
  		</iframe>
  	</div>
   	<div id="foot">
  		<label>© 2017 Taobao.com 版权所有</label>
  	</div>
  </body>
</html>
