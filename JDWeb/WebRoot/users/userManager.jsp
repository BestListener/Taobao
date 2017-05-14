<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>我的淘宝</title>
	<link rel="stylesheet" type="text/css" href="./css/headerCss.css">
	<script type="text/javascript" src="./js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="./js/headerJs.js"></script>
	<script type="text/javascript">
		var curSelectOption; //  当前选中的选项
		var options;		 //  选项对应的页面 
		options = new Object();
		options['per_info'] = "./users/userInfoView.jsp";
		options['own_goods'] = "./users/userOrderView.jsp";
		options['shopping_cert'] = "./users/userShoppingCert.jsp";
		options['open_shop'] = "./users/applyOpenShop.jsp";
		options['sold_goods'] = "./users/shopOrderView.jsp";
		function init()
		{
			curSelectOption = "per_info";//  默认选择为per_info
			var curSelect = document.getElementById(curSelectOption);
			curSelect.style.backgroundColor = "#E6E6E6";
			curSelect.style.color = "black";
			//skipTo(curSelectOption);
		}
		//  指向该选项时
		function tarOption(obj)
		{
			obj.style.backgroundColor = "#E6E6E6";
			obj.style.color = "black";
		}
		//  当鼠标移出选项时
		function unTarOption(obj)
		{
			if( obj.id != curSelectOption )
			{
				obj.style.backgroundColor = "white";
				obj.style.color = "#666666";
			}
		}
		//  点击选中选项
		function selectOption(obj)
		{
			if( obj.id != curSelectOption )
			{
				var curSelect = document.getElementById(curSelectOption);
				curSelect.style.backgroundColor = "white";
				curSelect.style.color = "#666666";
				obj.style.backgroundColor = "#E6E6E6";
				obj.style.color = "black";
				curSelectOption = obj.id;
				skipTo(curSelectOption);
			}
		}
		//  跳向指向页面
		function skipTo(obj)
		{
			var pageSrc = options[obj];
			document.getElementById("right_info_box").src = pageSrc;
		}
	</script>
	<style type="text/css">
	#account
	{
		display:block;
	}
	#title
	{
		position:absolute;
		top:38px;
		left:0px;
		width:100%;
		min-width:1280px;
		height:70px;
		background-color:white;
	}
	#title img
	{
		position:absolute;
		left:2%;
	}
	#view
	{
		position:absolute;
		top:108px;
		left:0px;
		width:100%;
		min-width:1280px;
		height:700px;
		background-color:white;
		font-family:Microsoft YaHei;
	}
	#left_ctrl_box
	{
		position:absolute;
		top:0px;
		left:3%;
		width:15%;
		height:700px;
	}
	#right_info_box
	{
		position:absolute;
		top:0px;
		left:19%;
		width:78%;
		height:700px;
		border:none;
	}
	#account_manager_title,#shop_manager_title
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
	#shop_manager_title
	{
		top:240px;
	}
	#acc_mag_option,#shop_mag_option
	{
		position:absolute;
		top:40px;
		left:0px;
		width:79%;
		margin:0px;
		list-style-type:none;
	}
	#shop_mag_option
	{
		top:280px;
	}
	#acc_mag_option li,#shop_mag_option li
	{
		color:#666666;
		text-indent:10px;
		width:80%;
		height:25px;
		margin-top:10px;
		margin-bottom:20px;
		cursor:pointer;
	}
	</style>
  </head>
  	
  <body onload="init()">
  	<div id="title">
  		<img alt="myTaobao" src="./users/pics/ZWOM_96CM](E]}BL094P@1P.png">
  	</div>
    <div id="header">
  		<div id="account">
  			<label id="username">windq</label>
  			<a id="exitTop">退出</a>
  		</div>
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
  		<div id="left_ctrl_box">
  			<div id="account_manager_title">帐号管理</div>
  			<ul id="acc_mag_option">
  				<li id="per_info" onclick="selectOption(this)" onmouseover="tarOption(this)" onmouseout="unTarOption(this)">●&nbsp;个人资料</li>
  				<li id="own_goods" onclick="selectOption(this)" onmouseover="tarOption(this)" onmouseout="unTarOption(this)">●&nbsp;已买到的宝贝</li>
  				<li id="shopping_cert" onclick="selectOption(this)" onmouseover="tarOption(this)" onmouseout="unTarOption(this)">●&nbsp;购物车</li>
  				<li id="my_favorite" onclick="selectOption(this)" onmouseover="tarOption(this)" onmouseout="unTarOption(this)">●&nbsp;收藏夹</li>
  			</ul>
  			<div id="shop_manager_title">店铺管理</div>
  			<ul id="shop_mag_option">
  				<li id="open_shop" onclick="selectOption(this)" onmouseover="tarOption(this)" onmouseout="unTarOption(this)">●&nbsp;免费开店</li>
  				<li id="sold_goods" onclick="selectOption(this)" onmouseover="tarOption(this)" onmouseout="unTarOption(this)">●&nbsp;已卖出的宝贝</li>
  				<li id="selling_goods" onclick="selectOption(this)" onmouseover="tarOption(this)" onmouseout="unTarOption(this)">●&nbsp;出售中的宝贝</li>
  			</ul>
  		</div>
  		<iframe id="right_info_box" src="./users/shopOrderView.jsp">
  			
  		</iframe>
  	</div>
  </body>
</html>
