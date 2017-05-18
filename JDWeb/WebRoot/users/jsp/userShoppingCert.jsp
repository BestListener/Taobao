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
		var setAmountFlag = 0;
		//  点击加1
  		function addGoodsNum(obj)
  		{		
			var id = obj.parentNode.id;
			var subid = "s" + id;
			var inputid = "i" + id;
			var unId = "un" + id;
			var maId = "ma" + id;
			var subBtn = document.getElementById(subid);
			var input = document.getElementById(inputid);
			var unit_Num = document.getElementById(unId);
			var money_Acc = document.getElementById(maId);
			var uNum = unit_Num.innerText.substring(1,unit_Num.length);
			var amount = money_Acc.innerText.substring(1,money_Acc.length);
			amount = parseFloat(amount);
			uNum = parseFloat(uNum);
			var value = parseInt(input.value);
			if( value < 99 )
			{	
				value = value + 1;
				input.value = value;
				amount = returnFloat(uNum * value);
				money_Acc.innerText = "￥"+amount;
			}
  			if( value > 1 )
  			{
  				subBtn.style.cursor = "pointer";
  				subBtn.style.color = "black";
  			}
  			getSum();
  		}
  		//  点击减1
  		function subGoodsNum(obj)
  		{
  			var id = obj.parentNode.id;
			var subid = "s" + id;
			var inputid = "i" + id;
			var unId = "un" + id;
			var maId = "ma" + id;
			var subBtn = document.getElementById(subid);
			var input = document.getElementById(inputid);
			var value = parseInt(input.value);
			var unit_Num = document.getElementById(unId);
			var money_Acc = document.getElementById(maId);
			var uNum = unit_Num.innerText.substring(1,unit_Num.length);
			var amount = money_Acc.innerText.substring(1,money_Acc.length);
			amount = parseFloat(amount);
			uNum = parseFloat(uNum);
  			if( value > 1 )
  			{
  				value = value - 1;
  				input.value = value;
  				amount = returnFloat(uNum * value);
				money_Acc.innerText = "￥"+amount;
  			} 
  			if( value == 1 )
  			{
  				subBtn.style.cursor = "default";
  				subBtn.style.color = "#CCCCCC";
  			}
  			getSum();
  		}
  		//  检查用户输入的数额
  		function checkInput(obj)
  		{
  			var id = obj.parentNode.id;
			var subid = "s" + id;
			var addtid = "a" + id;
			var subBtn = document.getElementById(subid);
			var addBtn = document.getElementById(addtid);
  			//  如果输入的不是数字
  			if( event.keyCode < 48 || event.keyCode > 57 )
  			{
  				obj.value = "1";
  				goodsBuyNum = obj.value;
  			}
  			//  如果输入的是数字
  			if( obj.value == 99 )
  			{
  				addBtn.style.cursor = "default";
  				addBtn.style.color = "#CCCCCC";
  			}
  			if( obj.value == 1 )
  			{
  				subBtn.style.cursor = "default";
  				subBtn.style.color = "#CCCCCC";
  			}
  			if( obj.value > 1 )
  			{
  				subBtn.style.cursor = "pointer";
  				subBtn.style.color = "black";
  			}
  			if( obj.value < 99 )
			{
  				addBtn.style.cursor = "pointer";
  				addBtn.style.color = "black";
  			}
  		}
  		//   删除商品
  		function clickDelete(obj)
  		{
  			if( window.confirm("您确定要删除该商品么？") )
  			{
  			
  			}
  		}
  		//   保留一位小数
  		function returnFloat(value)
  		{
		 	var value=Math.round(parseFloat(value)*100)/100;
		 	var xsd=value.toString().split(".");
		    if(xsd.length==1){
		 		value=value.toString()+".0";
		 		return value;
			}
		}
		//   保留两位小数
  		function returnFloat2(value)
  		{
		 	var value=Math.round(parseFloat(value)*100)/100;
		 	var xsd=value.toString().split(".");
		    if(xsd.length == 1){
		 		value=value.toString()+".00";
		 		return value;
			}
			else if(xsd[1].length < 2)
			{
				value=value.toString()+"0";
		 		return value;
			}
		}
		//  求选中个数
		function getGoodsSum()
		{
			var sum = 0;
			var goods = document.getElementsByName("good_checkbox");
			for(var i = 0;i < goods.length; i++)
			{
				if( goods[i].checked )
				{
					sum = sum + 1;
				}
			}
			document.getElementById("goodsNum").innerText = sum;
		}
		//  求总价
		function getSum()
		{
			var sum = 0;
			var goods = document.getElementsByName("good_checkbox");
			for(var i = 0;i < goods.length; i++)
			{
				if( goods[i].checked )
				{
					var id = goods[i].value;
					var maId = "ma" + id;
					var money_Acc = document.getElementById(maId);
					var amount = money_Acc.innerText.substring(1,money_Acc.length);
					amount = parseFloat(amount);
					sum = sum + amount;
				}
			}
			sum = returnFloat2(sum);
			document.getElementById("countSumNum").innerText = sum;
			document.getElementById("btm_SumNum").innerText = sum;
		}
		//  判断是否选中物品并显示结算
		function checkSelect()
		{
			var top = document.getElementById("top_set_account");
			var btm = document.getElementById("btm_set_account");
			var goods = document.getElementsByName("good_checkbox");
			for(var i = 0;i < goods.length; i++)
			{
				if( goods[i].checked )
				{
					
					top.style.backgroundColor = "#FF4400";
					btm.style.backgroundColor = "#FF4400";
					top.style.cursor = "pointer";
					btm.style.cursor = "pointer";
					setAmountFlag = 1;
					return;
				}
			}
			top.style.backgroundColor = "#AAAAAA";
			btm.style.backgroundColor = "#AAAAAA";
			top.style.cursor = "default";
			btm.style.cursor = "default";
		}
		//  全选
		function checkAll(obj)
		{
			var topsel = document.getElementsByName("top_all_sel");
			var btmsel = document.getElementsByName("btm_all_sel");
			var goods = document.getElementsByName("good_checkbox");
			var flag = obj.checked;
			topsel[0].checked = flag;
			btmsel[0].checked = flag;
			for(var i = 0;i < goods.length; i++)
			{
				goods[i].checked = flag;
			}
			getSum();
			getGoodsSum();
			checkSelect();
		}
		//  选中此物品
		function selectThis(obj)
		{
			if( !obj.checked )
			{
				var topsel = document.getElementsByName("top_all_sel");
				var btmsel = document.getElementsByName("btm_all_sel");
				topsel[0].checked = false;
				btmsel[0].checked = false;
			}
			getSum();
			getGoodsSum();
			checkSelect();
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
		margin-bottom:5px;
		border:#CCCCCC solid 1px;
	}
	.tipTr
	{
		height:100px;
		width:100%;
		margin-bottom:5px;
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
		border:#CCCCCC solid 1px;
		cursor:pointer;
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
		cursor:pointer;
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
		text-align:center;
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
		color:red;
		cursor:pointer;
	}
	.delete:hover
	{
		text-decoration:underline;
	}
	#Tip
	{
		position:relative;
		left:450px;
		top:30px;
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
   			<form action="" method="post">
   			<ul id="orderData">
   				<li class="firstLi">
   					<input id="topAllSelect" type="checkbox" name="top_all_sel" onclick="checkAll(this)">
   					<label id="topCountTip">全选</label>
   					<label id="shopInfoTil">宝贝信息</label>
   					<label id="shopNameTil">店铺</label>
   					<label id="unit-price">单价</label>
   					<label id="buyNum">数量</label>
   					<label id="moneySum">金额</label>
   					<label id="operation">操作</label>
   				</li>
   				<li id="1" class="unit_goods">
   					<input class="goodsSelect" type="checkbox" name="good_checkbox" onclick="selectThis(this)" value="1">
   					<img class="goodsPics" alt="goodsPic" src="./Images/TB1NE8NQFXXXXbkXXXXSutbFXXX.jpg">
   					<a class="goodsName">梵西六胜肽原液抗皱紧致玻尿酸面部精华液去皱纹抬头纹祛法令纹</a>
   					<label class="shopName">梵西化妆品旗舰店</label>
   					<label id="un1" class="unit_price_num">￥88.0</label>
   					<div id="s1" class="sub" onclick="subGoodsNum(this)">-</div>
   					<input id="i1" class="numInput" onkeyup="checkInput(this)" type="text" value="1" maxlength="2"/>
   					<div id="a1" class="add" onclick="addGoodsNum(this)">+</div>
   					<label id="ma1" class="moneyAmount">￥88.0</label>
   					<label class="delete" onclick="clickDelete(this)">删除</label>
   				</li>
   				<li id="2" class="unit_goods">
   					<input class="goodsSelect" type="checkbox" name="good_checkbox" onclick="selectThis(this)" value="2">
   					<img class="goodsPics" alt="goodsPic" src="./Images/TB1NE8NQFXXXXbkXXXXSutbFXXX.jpg">
   					<a class="goodsName">梵西六胜肽原液抗皱紧致玻尿酸面部精华液去皱纹抬头纹祛法令纹</a>
   					<label class="shopName">梵西化妆品旗舰店</label>
   					<label id="un2" class="unit_price_num">￥88.0</label>
   					<div id="s2" class="sub" onclick="subGoodsNum(this)">-</div>
   					<input id="i2" class="numInput" type="text" value="1" maxlength="2"/>
   					<div id="a2" class="add" onclick="addGoodsNum(this)">+</div>
   					<label id="ma2" class="moneyAmount">￥88.0</label>
   					<label class="delete" onclick="clickDelete(this)">删除</label>
   				</li>
   				<li class="tipTr">
   					<label id="Tip">您暂时没有选购物品。</label>
   				</li>
   			</ul>
   			</form>
   			<div id="bottomCount">
   				<input id="btmAllSelect" type="checkbox" name="btm_all_sel" onclick="checkAll(this)">
   				<label id="btmCountTip">全选</label>
   				<label id="btmGoodsLab">已选商品&nbsp;<label id="goodsNum">0</label>&nbsp;件</label>
   				<label id="btm_cSumNum">合计:</label>
   				<label id="btm_SumNum">0.00</label>
   				<div id="btm_set_account">结算</div>
   			</div>
   		</div>
  </body>
</html>
