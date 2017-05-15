<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title></title>
    <link rel="stylesheet" type="text/css" href="./css/headerCss.css">
	<script type="text/javascript" src="./js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="./plugs/picZoom/js/jquery.zoom.js"></script>
	<script type="text/javascript" src="./js/headerJs.js"></script>
	<script type="text/javascript">
		var curSelectBtn;//  当前选中的按钮
		var curSelectPic;//  当前选中的图片
		var goodsSaveNum;//  物品库存
		var goodsBuyNum;//  当前购物数量
		//  页面初始化函数
  		function init()
  		{
  			curSelectBtn = "goodsDetail";
  			curSelectPic = "img1";
  			goodsSaveNum = 2;
  			goodsBuyNum = 1; //  默认购买数为1
  			document.title = "-淘宝网";
  			//  图片放大镜
			$(document).ready(function(){
				$('#bigPicZoom').zoom();
			});
			document.getElementById(curSelectPic).style.borderColor = "#EE5F00";
  		}
  		//  鼠标选中图像
  		function selectImage(obj)
  		{
  			var bigPic = document.getElementById("bigPic");
  			var curPic = document.getElementById(curSelectPic);
  			curPic.style.borderColor = "white";
  			curSelectPic = obj.id;
  			obj.style.borderColor = "#EE5F00";
  			bigPic.src = obj.src;
  			//  图片放大镜
			$(document).ready(function(){
				$('#bigPicZoom').zoom();
			});
  		}
  		//  鼠标移入立即购买按键
  		function inBuyBtn(obj)
  		{
  			obj.style.backgroundColor = "#FFBBFF";
  		}
  		//  鼠标移出立即购买按键
  		function outBuyBtn(obj)
  		{
  			obj.style.backgroundColor = "#FFEEFF";
  		}
  		//  鼠标移入加入购物车按键
  		function inAddBtn(obj)
  		{
  			obj.style.backgroundColor = "#DD2C00";
  		}
  		//  鼠标移出加入购物车按键
  		function outAddBtn(obj)
  		{
  			obj.style.backgroundColor = "#FF3300";
  		}
  		//  选中商品信息
  		function onClickBtn(obj)
  		{
  			if( obj.id != curSelectBtn )
  			{
  				var curSelect = document.getElementById(curSelectBtn);
  				curSelect.style.borderTop = "none";
  				curSelect.style.borderBottom = "none";
  				curSelect.style.color = "black";
  				curSelect.style.backgroundColor = "#EEEEEE";
  				obj.style.borderTop = "#FF4111 solid 2px";
  				obj.style.borderBottom = "white solid 1px";
  				obj.style.color = "#FF4111";
  				obj.style.backgroundColor = "white";
  				curSelectBtn = obj.id;
  			}
  		}
  		//  点击加1
  		function addGoodsNum(obj)
  		{
  			if( goodsBuyNum < goodsSaveNum && goodsBuyNum < 99 )
  			{
  				goodsBuyNum = goodsBuyNum + 1;
  				$('#goodsNum').val(goodsBuyNum);
  				if( goodsBuyNum >= goodsSaveNum )
  				{
  					$('#addOne').css({'cursor':'default'});
  					$('#addOne').css({'color':'#CCCCCC'});
  				}
  			}
  			if( goodsBuyNum > 1 )
  			{
  				$('#subOne').css({'cursor':'pointer'});
  				$('#subOne').css({'color':'black'});
  			}
  		}
  		//  点击减1
  		function subGoodsNum(obj)
  		{
  			if( goodsBuyNum > 1 )
  			{
  				goodsBuyNum = goodsBuyNum - 1;
  				$('#goodsNum').val(goodsBuyNum);
  				if( goodsBuyNum <= 1 )
  				{
  					$('#subOne').css({'cursor':'default'});
  					$('#subOne').css({'color':'#CCCCCC'});
  				}
  			}			
  			if( goodsBuyNum < goodsSaveNum )
  			{
  				$('#addOne').css({'cursor':'pointer'});
  				$('#addOne').css({'color':'black'});
  			}
  		}
  		//  检查用户输入的数额
  		function checkInput(obj)
  		{
  			//  如果输入的不是数字
  			if( event.keyCode < 48 || event.keyCode > 57 )
  			{
  				obj.value = "1";
  				goodsBuyNum = obj.value;
  			}
  			//  如果输入的是数字
  			if( obj.value > goodsSaveNum )
  			{
  				obj.value = goodsSaveNum;
  				goodsBuyNum = obj.value;
  			}
  			if( obj.value == goodsSaveNum )
  			{
  				$('#addOne').css({'cursor':'default'});
  				$('#addOne').css({'color':'#CCCCCC'});
  			}
  			if( obj.value == 1 )
  			{
  				$('#subOne').css({'cursor':'default'});
  				$('#subOne').css({'color':'#CCCCCC'});
  			}
  			if( obj.value > 1 )
  			{
  				$('#subOne').css({'cursor':'pointer'});
  				$('#subOne').css({'color':'black'});
  			}
  			if( obj.value < goodsSaveNum )
			{
  				$('#addOne').css({'cursor':'pointer'});
  				$('#addOne').css({'color':'black'});
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
		cursor:pointer;
	}
	#view
	{
		position:absolute;
		top:136px;
		left:0px;
		width:100%;
		height:1440px;
		min-width:1280px;
		border-top:#FF0066 solid 2px;
		background-color:#EEEEEE;
	}
	#goodsBox
	{
		position:absolute;
		top:5px;
		left:8%;
		width:70%;
		height:500px;
		border:#C4C4C4 solid 1px;
		background-color:white;
	}
	#shopBox
	{
		position:absolute;
		top:5px;
		left:78.1%;
		width:15%;
		height:1410px;
		border:#C4C4C4 solid 1px;
		background-color:white;
	}
	#goodsInfoBox
	{
		position:absolute;
		top:515px;
		left:8%;
		width:70%;
		height:900px;
		border:#C4C4C4 solid 1px;
		background-color:white;
	}
	.bigPic
	{
		position:absolute;
		top:0px;
		left:0px;
		width:100%;
		height:400px;
	}
	.zoom
	{
		position:absolute;
		top:5px;
		left:1%;
		width:47%;
		height:400px;
		cursor:pointer;
	}
	.smallPicBox
	{
		position:absolute;
		top:420px;
		width:45%;
		left:2%;
		cursor:pointer;
	}
	.smallPic
	{
		border:white solid 2px;
		width:20%;
		height:60px;
	}
	.goodName
	{
		position:absolute;
		top:50px;
		left:51%;
		width:47%;
		height:55px;
		font-size:1.3vw;
		font-family:Microsoft YaHei;
	}
	.price
	{
		position:absolute;
		top:135px;
		left:51.5%;
		width:46.5%;
		height:55px;
		background-color:#FFEEFF;
	}
	.price-label
	{
		position:absolute;
		top:10px;
		left:3%;
		color:#5E5E5E;
		font-size:1vw;
		font-family:Microsoft YaHei;
	}
	.price-num
	{
		position:absolute;
		top:5px;
		left:15%;
		color:#FF4111;
		font-size:1.8vw;
		font-family:Microsoft YaHei;
	}
	.comment
	{
		position:absolute;
		top:5px;
		right:18%;
		width:15%;
		height:45px;
		color:#5E5E5E;
		font-size:0.9vw;
		font-family:Microsoft YaHei;
		border-right:#DDDDDD solid 1px;
	}
	.amount
	{
		position:absolute;
		top:0px;
		left:0px;
		width:100%;
		overflow:hidden;
		font-size:1.2vw;
		font-weight:bold;
		text-align:center;
	}
	.tip-label
	{
		position:absolute;
		bottom:5px;
		left:0px;
		width:100%;
		text-align:center;
	}
	.transaction-num
	{
		position:absolute;
		top:5px;
		right:2%;
		width:15%;
		height:45px;
		color:#5E5E5E;
		font-size:0.9vw;
		font-family:Microsoft YaHei;
	}
	#tofavorite
	{
		position:absolute;
		top:200px;
		right:5%;
		height:25px;
		width:10%;
		font-size:0.9vw;
		font-family:Microsoft YaHei;
		cursor:pointer;
	}
	#tofavorite img
	{
		width:20px;
		height:20px;
	}
	#tofavorite label
	{
		position:absolute;
		top:1px;
		left:30%;
		color:#5E5E5E;
		cursor:pointer;
	}
	#buy-amount-ctrl
	{
		position:absolute;
		top:235px;
		left:51.5%;
		width:46.5%;
		height:55px;
	}
	#subOne,#addOne
	{
		position:absolute;
		width:28px;
		height:28px;
		text-align:center;
		font-weight:bold;
		font-size:20px;
		font-family:Microsoft YaHei;
		border:#CCCCCC solid 1px;
		background-color:#EEEEEE;
	}
	#goodsNum
	{
		position:absolute;
		top:5px;
		left:103px;
		width:60px;
		height:30px;
		text-align:center;
		font-size:17px;
		z-index:9999;
		font-family:Microsoft YaHei;
		border:#CCCCCC solid 1px;
	}
	#subOne
	{
		top:5px;
		left:74px;
		color:#CCCCCC;
	}
	#addOne
	{
		top:5px;
		left:162px;
		cursor:pointer;
	}
	#goodsStock
	{
		position:absolute;
		top:10px;
		left:196px;
		color:#5E5E5E;
		font-size:1vw;
		font-family:Microsoft YaHei;
	}
	#buy-btn,#add-toSc-btn
	{
		position:absolute;
		width:15%;
		height:31px;
		font-size:1.3vw;
		font-family:Microsoft YaHei;
		-moz-border-radius: 2px;
    	-webkit-border-radius: 2px;
    	border-radius: 2px;
    	cursor:pointer;
	}
	#buy-btn
	{
		top:300px;
		left:53.5%;
		padding-top:5px;
		text-align:center;
		background-color:#FFEEFF;
		border:#FF77AD solid 1px;
		color:#FF6944;
	}
	#add-toSc-btn
	{
		width:19%;
		height:32px;
		top:300px;
		left:73.5%;
		text-indent:6%;
		padding-top:7px;
		color:white;
		background-color:#FF3300;
	}
	#add-toSc-btn img
	{
		position:absolute;
		top:8px;
		left:15%;
		width:10%;
		height:20px;
	}
	#goodsInfoTitle
	{
		position:absolute;
		top:-1px;
		left:-1px;
		width:100%;
		height:50px;
		background-color:#EEEEEE;
		border:#CCCCCC solid 1px;
	}
	#goodsInfoCtrl
	{
		position:absolute;
		top:-1px;
		left:-1px;
		width:30%;
		height:50px;
		border-collapse:collapse; 
		border-spacing:0px 0px;
		font-size:1.1vw;
		font-family:Microsoft YaHei;
	}
	#goodsInfoCtrl tr td
	{
		width:15%;
		height:50px;
		border-left:#CCCCCC solid 1px;
		border-right:#CCCCCC solid 1px;
		cursor:pointer;
	}
	#goodsDetail
	{
		text-align:center;
		border-top:#FF4111 solid 2px;
		border-bottom:white solid 1px;
		color:#FF4111;
		background-color:white;
	}
	#goodsComment
	{
		position:absolute;
		top:15px;
		left:55%;
		cursor:pointer;
	}
	#goodsCommentNum
	{
		width:18%;
		color:#FF3300;
		position:absolute;
		font-weight:bold;
		overflow:hidden;
		top:15px;
		left:80%;
		cursor:pointer;
	}
	#shopInfo
	{
		position:absolute;
		top:-1px;
		left:-1px;
		width:100%;
		height:220px;
		border:#FFAD77 solid 1px;
	}
	#shopInfoBg
	{
		position:absolute;
		top:0px;
		left:0px;
		width:100%;
	}
	#shopHeader
	{
		position:absolute;
		top:55px;
		left:0px;
		width:100%;
		height:30px;
	}
	#shopHeader img
	{
		position:absolute;
		top:2px;
		left:30px;
		width:20px;
		height:20px;
	}
	#shopHeader label
	{
		position:absolute;
		top:3px;
		left:65px;
		font-weight:bold;
		font-size:1.1vw;
		font-family:Microsoft YaHei;
	}
	#shop_owner
	{
		position:absolute;
		top:100px;
		left:0px;
		width:100%;
		height:30px;
	}
	#shop_owner_label
	{
		position:absolute;
		top:3px;
		left:25px;
		font-size:1vw;
		font-family:Microsoft YaHei;
	}
	#shop_owner_name
	{
		position:absolute;
		top:3px;
		left:65px;
		font-size:1vw;
		font-family:Microsoft YaHei;
	}
	#shop_cfdL
	{
		position:absolute;
		top:145px;
		left:0px;
		width:100%;
		height:30px;
	}
	#shop_cfdL label
	{
		position:absolute;
		top:3px;
		left:12px;
		font-size:1vw;
		font-family:Microsoft YaHei;
	}
	#shop_cfdL_ok
	{
		position:absolute;
		top:0px;
		left:65px;
		width:50%;
		height:30px;
		font-size:1vw;
		font-family:Microsoft YaHei;
		border:#4EFF22 solid 1px;
	}
	#shop_cfdL_ok label
	{
		position:absolute;
		top:3px;
		left:10px;
		font-weight:bold;
		color:#4EFF22;
	}
	#shop_cfdL_ok img
	{
		position:absolute;
		top:3px;
		right:10px;
		width:20px;
		height:20px;
	}
	#shopGoodsView
	{
		position:absolute;
		top:220px;
		left:0px;
		width:100%;
		height:1150px;
		border:none;
	}
	#goodsDetailView
	{
		position:absolute;
		top:55px;
		left:0px;
		height:830px;
		border:none;
		width:100%;
	}
	#foot
	{
		position:absolute;
		top:1565px;
		left:0px;
		width:100%;
		height:30px;
		min-width:1280px;
		font-size:14px;
		text-align:center;
		color:gray;
		background:white;
		padding-top:20px;
		font-family:Microsoft YaHei;
	}
	</style>
  </head>
  <body onload="init()">
    <div id="title">
  		<img onclick="toMainPage()" alt="淘宝主页" id="titlepic" src="./pics/G`I4EGLGZJHSOIBN7}Q9`RY.png">
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
  		<div id="goodsBox">
  			<div class="zoom" id="bigPicZoom">
  				<img id="bigPic" class="bigPic" alt="bigPic" src="./Images/TB2LKuZpHxmpuFjSZJiXXXauVXa_!!845001562.jpg">
  			</div>
  			<span class="smallPicBox">
  				<img id="img1" onmouseover="selectImage(this)" class="smallPic" alt="smallPic" src="./Images/TB2LKuZpHxmpuFjSZJiXXXauVXa_!!845001562.jpg">
  				<img id="img2" onmouseover="selectImage(this)" class="smallPic" alt="smallPic" src="./Images/TB2e81JpNxmpuFjSZFNXXXrRXXa_!!749391658.jpg">
  			</span>
  			<label class="goodName">韩版夜光防水多功能户外登山运动学生潮流运动电子手表男大表盘酷</label>
  			<div class="price">
  				<label class="price-label">价格</label>
  				<label class="price-num">￥&nbsp;368.0</label>
  				<div class="comment">
	  				<label class="amount">134</label>
	  				<label class="tip-label">累计评论</label>
  				</div>
  				<div class="transaction-num">
	  				<label class="amount">—</label>
	  				<label class="tip-label">交易成功</label>
  				</div>
  			</div>
  			<span id="tofavorite">
  				<img alt="star" src="./pics/star-icon.png">
  				<label>收藏宝贝</label>
  			</span>
  			<span id="buy-amount-ctrl">
  				<label class="price-label">数量</label>
  				<span id="subOne" onclick="subGoodsNum(this)">-</span>
  				<input id="goodsNum" onkeyup="checkInput(this)" type="text" value="1" maxlength="2"/>
  				<span id="addOne" onclick="addGoodsNum(this)">+</span>
  				<label id="goodsStock">件（库存2件）</label>
  			</span>
  			<div id="buy-btn" onmouseover="inBuyBtn(this)" onmouseout="outBuyBtn(this)">立即购买</div>
  			<div id="add-toSc-btn" onmouseover="inAddBtn(this)" onmouseout="outAddBtn(this)">
  				<img alt="shopcert" src="./pics/supermarket11.png">加入购物车
  			</div>
  		</div>
  		<div id="goodsInfoBox">
  			<div id="goodsInfoTitle">
  			<table id="goodsInfoCtrl">
  				<tr>
	  				<td id="goodsDetail" onclick="onClickBtn(this)">宝贝详情</td>
	  				<td id="goodsCommentBtn" onclick="onClickBtn(this)">
	  					<label id="goodsComment">累计评论</label>
	  					<label id="goodsCommentNum">134</label>
	  				</td>
  				</tr>
  			</table>
  			</div>
  			<iframe id="goodsDetailView" src="./jsp/goodsDetailView.jsp">
  			</iframe>
  		</div>
  		<div id="shopBox">
  			<div id="shopInfo">
  				<img id="shopInfoBg" alt="shopInfoBg" src="./pics/`WUL}ZX{QI_BRG{7`09B(F7.png">
  				<div id="shopHeader">
  					<img alt="shopPic" src="./pics/supermarket22.png">
  					<label id="shopName">极地搜索</label>
  				</div>
  				<div id="shop_owner">
  						<label id="shop_owner_label">店主:</label>
  						<label id="shop_owner_name">极地搜索z</label>
  				</div>
  				<div id="shop_cfdL">
  						<label>可信度:</label>
  						<div id="shop_cfdL_ok">
  							<label>官方认证</label>
  							<img alt="passaway" src="./pics/check_alt(1).png">
  						</div>
  				</div>
  			</div>
  			<iframe id="shopGoodsView" src="./jsp/shopGoodsView.jsp">
  			</iframe>
  		</div>
  	</div>
  	<div id="foot">
  		<label>© 2017 Taobao.com 版权所有</label>
  	</div>
  </body>
</html>
