<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.setCharacterEncoding("utf-8");
String search = "";
if( request.getParameter("search") != null)
	search = request.getParameter("search").toString();
%>

<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>所有物品-淘宝搜索</title>
    
	<link rel="stylesheet" type="text/css" href="./css/headerCss.css">
	<link rel="stylesheet" type="text/css" href="./css/searchClass.css">
	<script type="text/javascript" src="./js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="./js/userCookie.js"></script>
	<script type="text/javascript" src="./js/headerJs.js"></script>
	<script type="text/javascript">
  		var curSelectClass;	//  当前选定的类别
  		var curSelectSort; //  当前选定的排序
  		var classes = new Object();
  		classes['allClass'] = "全部";
  		classes['books'] = "书";
  		classes['cosmetics'] = "美妆";
  		classes['watches'] = "手表";
  		//  初始化页面
  		function init()
  		{
  			//  默认类别为 “全部”
  			curSelectClass = "allClass";
  			//  默认排序为“销量”
  			curSelectSort = "sellNum";
  			var search = "<%=search%>";
  			if( search != "" )
  			{
  				document.getElementById("searchInput").value = search;
  			}
  			var curClass = document.getElementById(curSelectClass);
  			var curSort = document.getElementById(curSelectSort);
  			curClass.style.color = "#EE5F00";
  			curClass.style.border = "#EE5F00 solid 1px";
  			curSort.style.color = "#EE5F00";
  			curSort.style.border = "#EE5F00 solid 1px";
  			initHeader();
  			var url = allgetIframeUrl();
  			document.getElementById("goodsView").src = url;
  		}
  		//  选中类别
  		function selectClass(obj)
  		{
  			obj.style.color = "#EE5F00";
  			obj.style.border = "#EE5F00 solid 1px";
  		}
  		//  未选中类别
  		function unselectClass(obj)
  		{
  			if( obj.id != curSelectClass )
  			{
  				obj.style.color = "black";
  				obj.style.border = "white solid 1px";
  			}
  		}
  		//  点击选中类别
  		function classOnClick(obj)
  		{
  			//  当点击的类别未被选中时
  			if( obj.id != curSelectClass )
  			{
  				var cancelSelect = document.getElementById(curSelectClass);
  				cancelSelect.style.color = "black";
  				cancelSelect.style.border = "white solid 1px";
  				obj.style.color = "#EE5F00";
  				obj.style.border = "#EE5F00 solid 1px";
  				curSelectClass = obj.id;
  				var url = allgetIframeUrl();
  				document.getElementById("goodsView").src = url;
  			}
  		}
  		//  选中排序
  		function selectSort(obj)
  		{
  			obj.style.color = "#EE5F00";
  			obj.style.border = "#EE5F00 solid 1px";
  		}
  		//  未选中
  		function unselectSort(obj)
  		{
  			if( obj.id != curSelectSort )
  			{
  				obj.style.color = "black";
  				obj.style.border = "none";
  			}	
  		}
  		//  获取iframe要传入的url
  		function allgetIframeUrl()
  		{
  			//  设置本页的主题参数
  			var url = "./servlet/getAllProductOrSearch?firstClass="+classes[curSelectClass];
  			//  设置本页的细节参数
  			url = url + "&sort="+curSelectSort;
  			var search = document.getElementById("searchInput").value;
  			search = $.trim(search);
  			if( search != "" )
  			{
  				url = url+"&search="+search;
  			}
  			return url;
  		}
  		//  点击选中排序
  		function sortOnClick(obj)
  		{
  			//  当点击的排序未被选中时
  			if( obj.id != curSelectSort )
  			{
  				var cancelSelect = document.getElementById(curSelectSort);
  				cancelSelect.style.color = "black";
  				cancelSelect.style.border = "none";
  				obj.style.color = "#EE5F00";
  				obj.style.border = "#EE5F00 solid 1px";
  				curSelectSort = obj.id;
  				var url = allgetIframeUrl();
  				document.getElementById("goodsView").src = url;
  			}
  		}
  		//  点击查找按钮
  		function tosearch()
  		{
  			var url = allgetIframeUrl();
  			document.getElementById("goodsView").src = url;
  		}
  		function clearInput()
  		{
  			var val = document.getElementById("searchInput").value;
  			if( val != "" )
  			{
  				document.getElementById("searchInput").value = "";
  				var url = allgetIframeUrl();
  				document.getElementById("goodsView").src = url;
  			}
  		}
  	</script>
  <style type="text/css">
  	
	</style>
  </head>
  
  <body onload="init()">
    <div id="title">
  		<img onclick="toMainPage()" alt="淘宝主页" id="titlepic" src="./pics/G`I4EGLGZJHSOIBN7}Q9`RY.png">
  		<label class="viewTitle">全网搜索</label>
  		<input type="text" id="searchInput" onfocus="clearInput()" placeholder="请输入宝贝名/种类" maxlength="25"/>
  		<div id="searchBtn" onclick="tosearch()">搜索</div>
  	</div>
  	<div id="header">
  		<div id="login" onclick="toLogin()"><label onclick="toLogin()">亲，请登录</label></div>
  		<div id="register" onclick="toRegister()"><label onclick="toRegister()">免费注册</label></div>
  		<div id="account">
  			<label id="username" onclick="touserInfoPage()"></label>
  			<a id="exitTop" onclick="exitAccount()">退出</a>
  		</div>
  		<div class="firstPage" onclick="toMainPage()">淘宝网首页</div>
		<ul id="myaccount" onmouseover="showaccout()" onmouseout="hiddenaccout()">
			<li>
				<label id="myaccountText" class="myaccount_sellerCenter_label" onmouseover="changeFontColor(this)" onmouseout="recoverFontColor(this)">我的淘宝</label>
				<img class="pullDown" alt="下拉" src="./pics/f0d93.png">
			</li>
			<ul id="myaccount_sub">
				<li id="purchased" onclick="tomyManager(this)" onmouseover="select(this)" onmouseout="unselect(this)">已买到的宝贝</li>
			</ul>
		</ul>
  		<ul id="shoppingCart" onmouseover="showSpc()" onmouseout="hiddenSpc()">
  			<li>
  				<img id="shoppingCartPic" alt="购物车" src="./pics/supermarket1.png">
  				<label id="scLabel" onmouseover="changeFontColor(this)" onmouseout="recoverFontColor(this)">购物车</label>
  				<label id="shoppingNum"></label>
  				<img class="pullDown" alt="下拉" src="./pics/f0d93.png">
  			</li>
  			<ul id="shoppingCart_sub">
  				<li id="myshoppingCart" onclick="tomyManager(this)"  onmouseover="select(this)" onmouseout="unselect(this)">查看我的购物车</li>
  			</ul>
  		</ul>
  		<ul id="favorite" onmouseover="showFav()" onmouseout="hiddenFav()">
  			<li>
  				<img id="favoritePic" alt="收藏夹" src="./pics/star-icon.png">
  				<label onmouseover="changeFontColor(this)" onmouseout="recoverFontColor(this)">收藏夹</label>
  				<img class="pullDown" alt="下拉" src="./pics/f0d93.png">
  			</li>
  			<ul id="favorite_sub">
  				<li id="favorite_good" onclick="tomyManager(this)" onmouseover="select(this)" onmouseout="unselect(this)">收藏的宝贝</li>
  			</ul>
  		</ul>
  		<ul id="sellerCenter" onmouseover="showSc()" onmouseout="hiddenSc()">
  			<li>
  				<label class="myaccount_sellerCenter_label" onmouseover="changeFontColor(this)" onmouseout="recoverFontColor(this)">卖家中心</label>
  				<img class="pullDown" alt="下拉" src="./pics/f0d93.png">
  			</li>
  			<ul id="sellerCenter_sub">
  				<li id="openShop" onclick="tomyManager(this)" onmouseover="select(this)" onmouseout="unselect(this)">免费开店</li>
  				<li id="sold" onclick="tomyManager(this)" onmouseover="select(this)" onmouseout="unselect(this)">已卖出的宝贝</li>
  				<li id="selling" onclick="tomyManager(this)" onmouseover="select(this)" onmouseout="unselect(this)">出售中的宝贝</li>
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
  		<iframe id="goodsView" src="">
  		</iframe>
  	</div>
   	<div id="foot">
  		<label>© 2017 Taobao.com 版权所有</label>
  	</div>
  </body>
</html>
