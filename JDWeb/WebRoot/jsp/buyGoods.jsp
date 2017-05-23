<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="cn.edu.zhku.she.Model.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.setCharacterEncoding("utf-8");
String msg = "";
String firstClass = null;
//  如果获取的数据不为空
if( request.getAttribute("product") != null )
{
	Product product = (Product)request.getAttribute("product");
	firstClass = product.getFirstClass();
}
else
{
	msg = "服务器出错，请稍后重试";
}
%>

<html>
  <head>
    <base href="<%=basePath%>">
    
    <title></title>
    <link rel="stylesheet" type="text/css" href="./css/headerCss.css">
    <link rel="stylesheet" type="text/css" href="./css/buyGoods.css">
	<script type="text/javascript" src="./js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="./plugs/picZoom/js/jquery.zoom.js"></script>
	<script type="text/javascript" src="./js/userCookie.js"></script>
	<script type="text/javascript" src="./js/headerJs.js"></script>
	<script type="text/javascript" src="./js/buyGoods.js"></script>
	<script type="text/javascript">
		var curSelectBtn;//  当前选中的按钮
		var curSelectPic;//  当前选中的图片
		var goodsSaveNum;//  物品库存
		var goodsBuyNum;//  当前购物数量
		var pid = "${product.pid}";	//  获取产品id
		var sid = "${product.sid}";	//  获取该产品的店铺id
		var price = "${product.price}";	//  获取该产品的单价
		//  页面初始化函数
  		function init()
  		{
  			//  获取错误消息
  			var msg = "<%=msg%>";
  			//  如果错误消息不为空，关闭当前窗口
  			if( msg != "" )
  			{
  				alert(msg);
  				window.opener=null;
				window.open('','_self');
				window.close();
  			}
  			//  初始化顶部信息
  			initHeader();
  			//  初始化默认选项与页面数据
  			curSelectBtn = "goodsDetail";
  			curSelectPic = "img1";
  			goodsSaveNum = "${product.saveNum}";
  			goodsSaveNum = parseInt(goodsSaveNum);
  			price = returnFloat(price);
  			document.getElementById("priceAmount").innerText = "￥  "+price;
  			goodsBuyNum = 1; //  默认购买数为1
  			document.title = "${product.name}-淘宝网";
  			//  图片放大镜
			$(document).ready(function(){
				$('#bigPicZoom').zoom();
			});
			document.getElementById(curSelectPic).style.borderColor = "#EE5F00";
  		}
  </script>
  </head>
  <body onload="init()">
    <div id="title">
  		<img onclick="toMainPage()" alt="淘宝主页" id="titlepic" src="./pics/G`I4EGLGZJHSOIBN7}Q9`RY.png">
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
  		<div id="goodsBox">
  			<div class="zoom" id="bigPicZoom">
  				<img id="bigPic" class="bigPic" alt="bigPic" src="./${product.bigImg }">
  			</div>
  			<span class="smallPicBox">
  				<img id="img1" onmouseover="selectImage(this)" class="smallPic" alt="smallPic" src="./${product.bigImg }">
  				<img id="img2" onmouseover="selectImage(this)" class="smallPic" alt="smallPic" src="./${product.smallImg }">
  			</span>
  			<label class="goodName">${product.name }</label>
  			<div class="price">
  				<label class="price-label">价格</label>
  				<label id="priceAmount" class="price-num"></label>
  				<div class="comment">
	  				<label class="amount">134</label>
	  				<label class="tip-label">累计评论</label>
  				</div>
  				<div class="transaction-num">
	  				<label class="amount">${product.salesAmount }</label>
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
  				<label id="goodsStock">件（库存${product.saveNum }件）</label>
  			</span>
  			<div id="buy-btn" onclick="buyRightNow()" onmouseover="inBuyBtn(this)" onmouseout="outBuyBtn(this)">立即购买</div>
  			<div id="add-toSc-btn" onclick="addToMyShoppingCart()" onmouseover="inAddBtn(this)" onmouseout="outAddBtn(this)">
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
  			<iframe id="goodsDetailView" src="./servlet/getGoodsDetail?firstClass=<%=firstClass %>&secondClass=${product.secondClass }&pid=${product.pid}&image=${product.infoImg}">
  			</iframe>
  		</div>
  		<div id="shopBox">
  			<div id="shopInfo">
  				<img id="shopInfoBg" alt="shopInfoBg" src="./pics/`WUL}ZX{QI_BRG{7`09B(F7.png">
  				<div id="shopHeader">
  					<img alt="shopPic" src="./pics/supermarket22.png">
  					<label id="shopName">${shop.shopname }</label>
  				</div>
  				<div id="shop_owner">
  						<label id="shop_owner_label">店主:</label>
  						<label id="shop_owner_name">${shop.ownername }</label>
  				</div>
  				<div id="shop_cfdL">
  						<label>可信度:</label>
  						<div id="shop_cfdL_ok">
  							<label>官方认证</label>
  							<img alt="passaway" src="./pics/check_alt(1).png">
  						</div>
  				</div>
  			</div>
  			<iframe id="shopGoodsView" src="./servlet/getShopProducts?sid=${product.sid}&pid=${product.pid}">
  			</iframe>
  		</div>
  	</div>
  	<div id="foot">
  		<label>© 2017 Taobao.com 版权所有</label>
  	</div>
  </body>
</html>
