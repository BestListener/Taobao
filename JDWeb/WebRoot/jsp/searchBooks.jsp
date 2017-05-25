<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.setCharacterEncoding("utf-8");
String parentPage = "";
if( request.getParameter("fromPage") != null )
	parentPage = request.getParameter("fromPage").toString();
%>

<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>图书-淘宝搜索</title>
    
	<link rel="stylesheet" type="text/css" href="./css/headerCss.css">
	<link rel="stylesheet" type="text/css" href="./css/searchClass.css">
	<script type="text/javascript" src="./js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="./js/userCookie.js"></script>
	<script type="text/javascript" src="./js/headerJs.js"></script>
	<script type="text/javascript" src="./js/searchClass.js"></script>
	<script type="text/javascript">
		var curSelectClass;	//  当前选定的类别
  		var curSelectSort; //  当前选定的排序
  		//  初始化页面
  		function init()
  		{
  			curSelectClass = "<%=parentPage%>";
  			if( curSelectClass == "" )
  			{
  				//  默认类别为 “全部”
  				curSelectClass = "allClass";
  			}
  			//  默认排序为“销量”
  			curSelectSort = "sellNum";
  			var curClass = document.getElementById(curSelectClass);
  			var curSort = document.getElementById(curSelectSort);
  			curClass.style.color = "#EE5F00";
  			curClass.style.border = "#EE5F00 solid 1px";
  			curSort.style.color = "#EE5F00";
  			curSort.style.border = "#EE5F00 solid 1px";
  			initHeader();
  			var url = getIframeUrl();
  			document.getElementById("goodsView").src = url;
  		}
  </script>
  </head>
  <body onload="init()">
  	<div id="title">
  		<img onclick="toMainPage()" alt="淘宝主页" id="titlepic" src="./pics/G`I4EGLGZJHSOIBN7}Q9`RY.png">
  		<label class="viewTitle">图书</label>
  		<input id="searchValue" type="text" id="searchInput" onfocus="clearInput()" placeholder="请输入宝贝名" maxlength="25"/>
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
  			<label class="filterTitle">图书类型:</label>
  			<table class="filterTable">
  				<tr>
  					<td id="allClass" class="filterTableTd" onclick="classOnClick(this)" onmouseover="selectClass(this)" onmouseout="unselectClass(this)">全部</td>
  					<td id="childBooks" class="filterTableTd" onclick="classOnClick(this)" onmouseover="selectClass(this)" onmouseout="unselectClass(this)">儿童文学</td>
  					<td id="novel" class="filterTableTd" onclick="classOnClick(this)" onmouseover="selectClass(this)" onmouseout="unselectClass(this)">小说</td>
  					<td id="literature" class="filterTableTd" onclick="classOnClick(this)" onmouseover="selectClass(this)" onmouseout="unselectClass(this)">文学</td>
  					<td id="hotBooks" class="filterTableTd" onclick="classOnClick(this)" onmouseover="selectClass(this)" onmouseout="unselectClass(this)">畅销书</td>
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
