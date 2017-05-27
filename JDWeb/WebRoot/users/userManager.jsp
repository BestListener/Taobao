<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String mid = "";
	//  判断用户id值
	if( session.getAttribute("uid") != null )
	{
		mid = session.getAttribute("Mid")+"";
	}
	else
	{
		response.sendRedirect("/JDWeb/userLogin.html");
	}
	//  判断要前往页面
	if( mid.equals("purchased") )
	{
		mid = "own_goods";
	}
	else if( mid.equals("myshoppingCart") )
	{
		mid = "shopping_cert";
	}
	else if( mid.equals("favorite_good") )
	{
		mid = "far_goods";
	}
	else if( mid.equals("openShop") )
	{
		mid = "open_shop";
	}
	else if( mid.equals("sold") )
	{
		mid = "sold_goods";
	}
	else if( mid.equals("selling") )
	{
		mid = "selling_goods";
	}
%>

<html>
  <head>
    <base href="<%=basePath%>">
    <title>我的淘宝</title>
	<link rel="stylesheet" type="text/css" href="./css/headerCss.css">
	<link rel="stylesheet" type="text/css" href="./users/css/userManager.css">
	<script type="text/javascript" src="./js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="./js/userCookie.js"></script>
	<script type="text/javascript" src="./js/headerJs.js"></script>
	<script type="text/javascript" src="./users/js/userManager.js"></script>
	<script type="text/javascript">
		function init()
		{
			//  默认选择为per_info
			curSelectOption = '<%= mid%>';  
			var curSelect = document.getElementById(curSelectOption);
			curSelect.style.backgroundColor = "#E6E6E6";
			curSelect.style.color = "black";
			skipTo(curSelectOption);
			//  初始化头部数据
			initHeader();
		}
	</script>
  </head>
  	
  <body onload="init()">
  	<div id="title">
  		<img alt="myTaobao" src="./users/pics/ZWOM_96CM](E]}BL094P@1P.png">
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
  		<div id="left_ctrl_box">
  			<div id="account_manager_title">帐号管理</div>
  			<ul id="acc_mag_option">
  				<li id="per_info" onclick="selectOption(this)" onmouseover="tarOption(this)" onmouseout="unTarOption(this)">●&nbsp;个人资料</li>
  				<li id="own_goods" onclick="selectOption(this)" onmouseover="tarOption(this)" onmouseout="unTarOption(this)">●&nbsp;已买到的宝贝</li>
  				<li id="shopping_cert" onclick="selectOption(this)" onmouseover="tarOption(this)" onmouseout="unTarOption(this)">●&nbsp;购物车</li>
  				<li id="far_goods" onmouseover="tarOption(this)" onmouseout="unTarOption(this)">●&nbsp;收藏夹</li>
  			</ul>
  			<div id="shop_manager_title">店铺管理</div>
  			<ul id="shop_mag_option">
  				<li id="open_shop" onclick="selectOption(this)" onmouseover="tarOption(this)" onmouseout="unTarOption(this)">●&nbsp;免费开店</li>
  				<li id="sold_goods" onclick="selectOption(this)" onmouseover="tarOption(this)" onmouseout="unTarOption(this)">●&nbsp;已卖出的宝贝</li>
  				<li id="selling_goods" onclick="selectOption(this)" onmouseover="tarOption(this)" onmouseout="unTarOption(this)">●&nbsp;出售中的宝贝</li>
  			</ul>
  		</div>
  		<iframe id="right_info_box" src="">
  			
  		</iframe>
  	</div>
  </body>
</html>
