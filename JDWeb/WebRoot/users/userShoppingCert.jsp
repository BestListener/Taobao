<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <script type="text/javascript" src="./js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
		//  点击加1
  		function addGoodsNum(obj)
  		{		
			var valNum = $('#input1').val();
			valNum = valNum + 1;
			$('#input1').val(valNum);
  			if( valNum > 1 )
  			{
  				$('.sub').css({'cursor':'pointer'});
  				$('.sub').css({'color':'black'});
  			}
  		}
  		//  点击减1
  		function subGoodsNum(obj)
  		{
  			var valNum = $('.numInput').val();
  			if( valNum > 1 )
  			{
  				valNum = valNum - 1;
  				$('.numInput').val(valNum);
  			} 
  			if( valNum == 1 )
  			{
  				$('.sub').css({'cursor':'default'});
  				$('.sub').css({'color':'#CCCCCC'});
  			}
  		}
	</script>
	<style type="text/css">
	body,input,select
	{
		font-family:Microsoft YaHei;
	}
	#title
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
	#content
	{
		position:absolute;
		top:40px;
		left:0px;
		width:100%;
	}
	#countSum
	{
		position:absolute;
		top:40px;
		left:10px;
		width:98%;
	}
	#countSumTip
	{
		position:absolute;
		bottom:10px;
		right:150px;
		color:#666666;
	}
	#countSumNum
	{
		position:absolute;
		bottom:10px;
		right:90px;
		color:#FF4400;
	}
	#orderData
	{
		position:relative;
		top:40px;
		left:10px;
		width:98%;
		list-style-type:none;
		list-style:none;
		margin:0px;
 		padding:0px;
	}
	.firstLi
	{
		height:40px;
	}
	#topAllSelect,#topCountTip,#shopInfoTil,#shopNameTil,#unit-price,#buyNum,#moneySum,#operation
	{
		position:absolute;
		top:8px;
	}
	#topAllSelect
	{
		left:20px;
		top:10px;
	}
	#topCountTip
	{
		left:45px;
	}
	#shopInfoTil
	{
		left:200px;
	}
	#shopNameTil
	{
		left:460px;
	}
	#unit-price
	{
		left:600px;
	}
	#buyNum
	{
		left:715px;
	}
	#moneySum
	{
		left:830px;
	}
	#operation
	{
		left:940px;
	}
	#bottomCount
	{
		position:relative;
		top:40px;
		left:10px;
		width:98%;
		height:50px;
		background-color:#EEEEEE;
		z-index:9999;
	}
	#btmAllSelect,#btmCountTip,#btmGoodsLab,#btm_cSumNum,#btm_SumNum
	{
		position:absolute;
		top:13px;
	}
	#btmAllSelect
	{
		top:15px;
		left:20px;
	}
	#btmCountTip
	{
		left:45px;
	}
	#btmGoodsLab
	{
		left:600px;
	}
	#btm_cSumNum
	{
		left:720px;
	}
	#btm_SumNum
	{
		left:770px;
	}
	#goodsNum,#btm_SumNum
	{	
		font-weight:bold;
		color:#FF4400;
	}
	.unit_goods
	{
		height:100px;
		width:100%;
		border:blue solid 1px;
		margin-bottom:5px;
		border:#CCCCCC solid 1px;
	}
	.goodsSelect
	{
		position:relative;
		top:-55px;
		left:20px;
	}
	.goodsPics
	{
		position:relative;
		width:90px;
		height:80px;
		top:10px;
		left:20px;
	}
	.goodsName
	{
		position:relative;
		top:-75px;
		left:145px;
		width:250px;
		height:50px;
		font-size:14px;
		display:block;
		text-wrap:normal;
	}
	.shopName
	{
		font-size:14px;
		position:relative;
		top:-125px;
		left:420px;
	}
	.unit_price_num
	{
		position:relative;
		top:-125px;
		left:470px;
	}
	.sub,.add
	{
		position:absolute;
		width:20px;
		height:22px;
		text-align:center;
		font-weight:bold;
		font-size:14px;
		font-family:Microsoft YaHei;
		border:#CCCCCC solid 1px;
		background-color:#EEEEEE;
	}
	.sub
	{
		position:relative;
		top:-145px;
		left:700px;
	}
	.numInput
	{	
		position:relative;
		width:30px;
		height:24px;
		top:-169px;
		left:721px;
		z-index:9999;
	}
	.add
	{
		position:relative;
		top:-193px;
		left:750px;
		cursor:pointer;
	}
	.moneyAmount
	{
		position:relative;
		top:-217px;
		left:820px;
		color:#FF4400;
	}
	.delete
	{
		position:relative;
		top:-217px;
		left:888px;
	}
	#top_set_account
	{	
		position:absolute;
		bottom:5px;
		right:20px;
		height:25px;
		width:50px;
		text-align:center;
		padding-top:3px;
		color:white;
		cursor:pointer;
		-moz-border-radius: 2px;
    	-webkit-border-radius: 2px;
    	border-radius: 2px;
		background-color:#AAAAAA;
	}
	#btm_set_account
	{	
		position:absolute;
		top:0px;
		bottom:0px;
		right:0px;
		height:37px;
		width:100px;
		text-align:center;
		padding-top:13px;
		color:white;
		cursor:pointer;
		-moz-border-radius: 2px;
    	-webkit-border-radius: 2px;
    	border-radius: 2px;
		background-color:#AAAAAA;
	}
	</style>
  </head>
  
  <body>
   	<div id="title">我的购物车</div>
   		<div id="content">
   			<div id="countSum">
   				<label id="countSumTip">合计:</label>
   				<label id="countSumNum">0.00</label>
   				<div id="top_set_account">结算</div>
   			</div>
   			<ul id="orderData">
   				<li class="firstLi">
   					<input id="topAllSelect" type="checkbox" name="top_all_sel">
   					<label id="topCountTip">全选</label>
   					<label id="shopInfoTil">商家信息</label>
   					<label id="shopNameTil">店铺</label>
   					<label id="unit-price">单价</label>
   					<label id="buyNum">数量</label>
   					<label id="moneySum">金额</label>
   					<label id="operation">操作</label>
   				</li>
   				<li class="unit_goods">
   					<input class="goodsSelect" type="checkbox" name="good_checkbox" value="1">
   					<img class="goodsPics" alt="goodsPic" src="./Images/TB1NE8NQFXXXXbkXXXXSutbFXXX.jpg">
   					<a class="goodsName">梵西六胜肽原液抗皱紧致玻尿酸面部精华液去皱纹抬头纹祛法令纹</a>
   					<label class="shopName">梵西化妆品旗舰店</label>
   					<label class="unit_price_num">￥88.0</label>
   					<div class="sub" onclick="subGoodsNum(this)">-</div>
   					<input class="numInput" type="text" value="1"/>
   					<div class="add" onclick="addGoodsNum(this)">+</div>
   					<label class="moneyAmount">￥88.0</label>
   					<label class="delete">删除</label>
   				</li>
   				<li class="unit_goods">
   					<input class="goodsSelect" type="checkbox" name="good_checkbox" value="1">
   					<img class="goodsPics" alt="goodsPic" src="./Images/TB1NE8NQFXXXXbkXXXXSutbFXXX.jpg">
   					<a class="goodsName">梵西六胜肽原液抗皱紧致玻尿酸面部精华液去皱纹抬头纹祛法令纹</a>
   					<label class="shopName">梵西化妆品旗舰店</label>
   					<label class="unit_price_num">￥88.0</label>
   					<div class="sub">-</div>
   					<input class="numInput" type="text" value="1"/>
   					<div class="add">+</div>
   					<label class="moneyAmount">￥88.0</label>
   					<label class="delete">删除</label>
   				</li>
   				<li class="unit_goods">
   					<input class="goodsSelect" type="checkbox" name="good_checkbox" value="1">
   					<img class="goodsPics" alt="goodsPic" src="./Images/TB1NE8NQFXXXXbkXXXXSutbFXXX.jpg">
   					<a class="goodsName">梵西六胜肽原液抗皱紧致玻尿酸面部精华液去皱纹抬头纹祛法令纹</a>
   					<label class="shopName">梵西化妆品旗舰店</label>
   					<label class="unit_price_num">￥88.0</label>
   					<div class="sub">-</div>
   					<input class="numInput" type="text" value="1"/>
   					<div class="add">+</div>
   					<label class="moneyAmount">￥88.0</label>
   					<label class="delete">删除</label>
   				</li>
   				<li class="unit_goods">
   					<input class="goodsSelect" type="checkbox" name="good_checkbox" value="1">
   					<img class="goodsPics" alt="goodsPic" src="./Images/TB1NE8NQFXXXXbkXXXXSutbFXXX.jpg">
   					<a class="goodsName">梵西六胜肽原液抗皱紧致玻尿酸面部精华液去皱纹抬头纹祛法令纹</a>
   					<label class="shopName">梵西化妆品旗舰店</label>
   					<label class="unit_price_num">￥88.0</label>
   					<div class="sub">-</div>
   					<input class="numInput" type="text" value="1"/>
   					<div class="add">+</div>
   					<label class="moneyAmount">￥88.0</label>
   					<label class="delete">删除</label>
   				</li>
   			</ul>
   			<div id="bottomCount">
   				<input id="btmAllSelect" type="checkbox" name="btm_all_sel">
   				<label id="btmCountTip">全选</label>
   				<label id="btmGoodsLab">已选商品&nbsp;<label id="goodsNum">0</label>&nbsp;件</label>
   				<label id="btm_cSumNum">合计:</label>
   				<label id="btm_SumNum">0.00</label>
   				<div id="btm_set_account">结算</div>
   			</div>
   		</div>
  </body>
</html>
