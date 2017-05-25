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
    
    <title>美妆-淘宝搜索</title>
    
	<link rel="stylesheet" type="text/css" href="./css/headerCss.css">
	<link rel="stylesheet" type="text/css" href="./css/searchBrankClass.css">
	<script type="text/javascript" src="./js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="./js/userCookie.js"></script>
	<script type="text/javascript" src="./js/headerJs.js"></script>
	<script type="text/javascript" src="./js/searchBrankClass.js"></script>
	<script type="text/javascript">
		var curSelectBrand; //  当前选定的品牌
		var curSelectClass;	//  当前选定的类别
  		var curSelectSort; //  当前选定的排序
  		//  初始化页面
  		function init()
  		{
  			//  默认品牌为“全部”
  			curSelectBrand = "allBranks";
  			//  默认类别为 “全部”
  			curSelectClass = "<%=parentPage%>";
  			if( curSelectClass == "" )
  			{
  				//  默认类别为 “全部”
  				curSelectClass = "allClass";
  			}
  			//  默认排序为“销量”
  			curSelectSort = "sellNum";
  			var curBrank = document.getElementById(curSelectBrand);
  			var curClass = document.getElementById(curSelectClass);
  			var curSort = document.getElementById(curSelectSort);
  			curBrank.style.color = "#EE5F00";
  			curBrank.style.border = "#EE5F00 solid 1px";
  			curClass.style.color = "#EE5F00";
  			curClass.style.border = "#EE5F00 solid 1px";
  			curSort.style.color = "#EE5F00";
  			curSort.style.border = "#EE5F00 solid 1px";
  			initHeader();
  			var url = getIframeUrl();
  			document.getElementById("goodsView").src = url;
  		}
  		//  获取iframe要传入的url
  		function getIframeUrl()
  		{
  			//  设置本页的主题参数
  			var url = "./servlet/getProductList?firstClass=美妆";
  			//  设置本页的细节参数
  			url = url+"&secondClass="+classes[curSelectClass]+"&brank="+branks[curSelectBrand]+"&sort="+curSelectSort;
  			var search = document.getElementById("searchValue").value;
  			search = $.trim(search);
  			if( search != "" )
  			{
  				url = url+"&search="+search;
  			}
  			return url;
  		}
	</script>
	<style type="text/css">
	
	</style>
  </head>
  
  <body onload="init()">
    <div id="title">
  		<img onclick="toMainPage()" alt="淘宝主页" id="titlepic" src="./pics/G`I4EGLGZJHSOIBN7}Q9`RY.png">
  		<label class="viewTitle">美妆</label>
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
  		<div id="brankFilter">
  			<label class="filterTitle">美妆品品牌:</label>
  			<table class="filterTable">
  				<tr>
  					<td id="allBranks" class="filterTableTd" onclick="branksOnClick(this)" onmouseover="selectClass(this)" onmouseout="unselectClass(this)">全部</td>
  					<td id="Olaiya" class="filterTableTd" onclick="branksOnClick(this)" onmouseover="selectClass(this)" onmouseout="unselectClass(this)">欧莱雅</td>
  					<td id="zishenTang" class="filterTableTd" onclick="branksOnClick(this)" onmouseover="selectClass(this)" onmouseout="unselectClass(this)">资生堂</td>
  					<td id="proya" class="filterTableTd" onclick="branksOnClick(this)" onmouseover="selectClass(this)" onmouseout="unselectClass(this)">PROYA/珀莱雅</td>
  				</tr>
  			</table>
  		</div>
  		<div id="classFilter">
  			<label class="filterTitle">美妆品类型:</label>
  			<table class="filterTable">
  				<tr>
  					<td id="allClass" class="filterTableTd" onclick="classOnClick(this)" onmouseover="selectClass(this)" onmouseout="unselectClass(this)">全部</td>
  					<td id="washFace" class="filterTableTd" onclick="classOnClick(this)" onmouseover="selectClass(this)" onmouseout="unselectClass(this)">洁面</td>
  					<td id="milk" class="filterTableTd" onclick="classOnClick(this)" onmouseover="selectClass(this)" onmouseout="unselectClass(this)">乳液</td>
  					<td id="mask" class="filterTableTd" onclick="classOnClick(this)" onmouseover="selectClass(this)" onmouseout="unselectClass(this)">面膜</td>
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
