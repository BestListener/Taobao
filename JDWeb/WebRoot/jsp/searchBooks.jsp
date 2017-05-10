<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>淘宝搜索</title>
    
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="./css/headerCss.css">
	<script type="text/javascript" src="./js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="./js/headerJs.js"></script>
  </head>
  <script text="text/javascript">
  		var curSelectClass;	//  当前选定的类别
  		var curSelectSort; //  当前选定的排序
  		//  初始化页面
  		function init()
  		{
  			//  默认类别为 “全部”
  			curSelectClass = "allBooks";
  			//  默认排序为“销量”
  			curSelectSort = "sellNum";
  			$('#allBooks').css({'color':'#EE5F00'});
  			$('#allBooks').css({'border':'#EE5F00 solid 1px'});
  			$('#sellNum').css({'color':'#EE5F00'});
  			$('#sellNum').css({'border':'#EE5F00 solid 1px'});
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
  			}
  		}
  </script>
  <style type="text/css">
  	#title
	{
		position:absolute;
		top:36px;
		left:0px;
		width:100%;
		height:100px;
		min-width:1280px;
		background-color:white;
	}
	#title img
	{
		position:absolute;
		left:10%;
		top:30px;
	}
	#title input
	{
		position:absolute;
		left:50%;
		top:40px;
		height:30px;
		width:30%;
		border:#FF6600 solid 3px;
		text-indent:10px;
		font-size:1.1vw;
		font-family:Microsoft YaHei;
		outline:medium;
	}
	#searchBtn
	{
		position:absolute;
		left:80.4%;
		top:40px;
		height:27px;
		width:8%;
		text-align:center;
		background-color:#FF6600;
		padding-top:3px;
		color:white;
		font-size:1.3vw;
		font-family:Microsoft YaHei;
		cursor:pointer;
	}
	#view
	{
		position:absolute;
		top:136px;
		left:0px;
		width:100%;
		height:1940px;
		min-width:1280px;
		border-top:#FF0066 solid 2px;
		background-color:#EEEEEE;
	}
	.viewTitle
	{
		position:absolute;
		top:33px;
		left:22%;
		color:#EE5F00;
		font-size:2vw;
		font-family:Microsoft YaHei;
	}
	#booksFilter
	{
		position:absolute;
		top:25px;
		left:7%;
		width:87%;
		height:50px;
		border:#C4C4C4 solid 1px;
		background-color:white;
	}
	#booksView
	{
		position:absolute;
		top:125px;
		left:7%;
		width:87%;
		height:1800px;
		border:#C4C4C4 solid 1px;
		background-color:white;
	}
	.filterTitle
	{
		position:absolute;
		top:10px;
		left:2%;
		color:#777777;
		font-size:1.2vw;
		font-family:Microsoft YaHei;
	}
	.filterTable
	{
		position:absolute;
		top:6px;
		left:8%;
		font-size:1.2vw;
		font-family:Microsoft YaHei;
		border-collapse:separate; 
		border-spacing:50px 3px;
	}
	.filterTableTd
	{
		border:white solid 1px;
		-moz-border-radius: 2px;
    	-webkit-border-radius: 2px;
    	border-radius: 2px;
		cursor:pointer;
	}
	#goodsSort
	{
		position:absolute;
		top:80px;
		left:7%;
		width:87%;
		height:35px;
		border:#C4C4C4 solid 1px;
		background-color:white;
	}
	.gsLab
	{
		position:absolute;
		top:5px;
		left:3%;
		color:#777777;
		font-size:1.2vw;
		font-family:Microsoft YaHei;
	}
	.sellNumSty,.priceUpSty,.priceDownSty
	{
		position:absolute;
		top:-1px;
		left:115px;
		width:8%;
		height:30px;
		padding-top:5px;
		text-align:center;
		font-size:1.2vw;
		font-family:Microsoft YaHei;
		cursor:pointer;
	}
	.priceUpSty
	{
		left:210px;
	}
	.priceDownSty
	{
		left:305px;
	}
	#foot
	{
		position:absolute;
		top:2070px;
		left:0px;
		width:100%;
		height:30px;
		min-width:1280px;
		font-size:14px;
		text-align:center;
		color:gray;
		padding-top:20px;
		font-family:Microsoft YaHei;
	}
  </style>
  <body onload="init()">
  	<div id="title">
  		<img alt="淘宝主页" id="titlepic" src="./pics/G`I4EGLGZJHSOIBN7}Q9`RY.png">
  		<label class="viewTitle">图书</label>
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
  		<div id="booksFilter">
  			<label class="filterTitle">图书类型:</label>
  			<table class="filterTable">
  				<tr>
  					<td id="allBooks" class="filterTableTd" onclick="classOnClick(this)" onmouseover="selectClass(this)" onmouseout="unselectClass(this)">全部</td>
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
  		<iframe id="booksView" src="./jsp/booksDataView.jsp">
  		
  		</iframe>
  	</div>
   	<div id="foot">
  		<label>© 2017 Taobao.com 版权所有</label>
  	</div>
  </body>
</html>
