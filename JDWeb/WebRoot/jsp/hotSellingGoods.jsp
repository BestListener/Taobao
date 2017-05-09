<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
//  首页热卖商品加载页
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
	<meta charset="utf-8">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
		function selectGood(obj)
		{
			obj.style.border = "#0099FF solid 2px";
		}
		function unselectGood(obj)
		{
			obj.style.border = "white solid 2px";
		}
	</script>
	<style type="text/css">
		#goodsData
		{
			position:absolute;
			top:5px;
			left:5px;
			width:99%;
			height:500px;
			border-collapse:separate; 
			border-spacing:15px 10px;
			list-style-type:none;
		}
		#goodsData tr td
		{
			position:relative;
			width:250px;
			height:330px;
			background-color:white;
			border:white solid 2px;
			font-size:13px;
			font-family:Microsoft YaHei;
		}
		.goodPic
		{
			position:absolute;
			top:5px;
			left:5px;
			width:240px;
			height:200px;
		}
		.goodPrice
		{
			position:absolute;
			top:210px;
			left:20px;
			text-align:left;
			width:240px;
			height:30px;
			color:#ff6905;
			font-size:20px;
		}
		.sellingNum
		{
			position:absolute;
			top:240px;
			left:20px;
			color:#AAAAAA;
			text-align:left;
			width:240px;
			height:30px;
		}
		.goodName
		{
			position:absolute;
			top:270px;
			left:20px;
			text-align:left;
			width:220px;
			height:60px;
			color:#5E5E5E;
		}
	</style>
  </head>
  
  <body>
    <table id="goodsData">
    	<tr>
    		<td onmouseover="selectGood(this)" onmouseout="unselectGood(this)">
    			<img class="goodPic" alt="goodImage" src="./Images/TB2e81JpNxmpuFjSZFNXXXrRXXa_!!749391658.jpg">
    			<label class="goodPrice">￥ 55.0</label>
    			<label class="sellingNum">销量：1000</label>
    			<label class="goodName">夏季薄款中老年休闲男士弹力牛仔裤加肥长裤宽松直筒大码爸爸男裤</label>
    		</td>
    		<td onmouseover="selectGood(this)" onmouseout="unselectGood(this)">
    			<img class="goodPic" alt="goodImage" src="./Images/TB2e81JpNxmpuFjSZFNXXXrRXXa_!!749391658.jpg">
    			<label class="goodPrice">￥ 55.0</label>
    			<label class="sellingNum">销量：1000</label>
    			<label class="goodName">夏季薄款中老年休闲男士弹力牛仔裤加肥长裤宽松直筒大码爸爸男裤</label>
    		</td>
    		<td onmouseover="selectGood(this)" onmouseout="unselectGood(this)">
    			<img class="goodPic" alt="goodImage" src="./Images/TB2e81JpNxmpuFjSZFNXXXrRXXa_!!749391658.jpg">
    			<label class="goodPrice">￥ 55.0</label>
    			<label class="sellingNum">销量：1000</label>
    			<label class="goodName">夏季薄款中老年休闲男士弹力牛仔裤加肥长裤宽松直筒大码爸爸男裤</label>
    		</td>
    		<td onmouseover="selectGood(this)" onmouseout="unselectGood(this)">
    			<img class="goodPic" alt="goodImage" src="./Images/TB2e81JpNxmpuFjSZFNXXXrRXXa_!!749391658.jpg">
    			<label class="goodPrice">￥ 55.0</label>
    			<label class="sellingNum">销量：1000</label>
    			<label class="goodName">夏季薄款中老年休闲男士弹力牛仔裤加肥长裤宽松直筒大码爸爸男裤</label>
    		</td>
    	</tr>
    	<tr>
    		<td onmouseover="selectGood(this)" onmouseout="unselectGood(this)">
    			<img class="goodPic" alt="goodImage" src="./Images/TB2e81JpNxmpuFjSZFNXXXrRXXa_!!749391658.jpg">
    			<label class="goodPrice">￥ 55.0</label>
    			<label class="sellingNum">销量：1000</label>
    			<label class="goodName">夏季薄款中老年休闲男士弹力牛仔裤加肥长裤宽松直筒大码爸爸男裤</label>
    		</td>
    		<td onmouseover="selectGood(this)" onmouseout="unselectGood(this)">
    			<img class="goodPic" alt="goodImage" src="./Images/TB2e81JpNxmpuFjSZFNXXXrRXXa_!!749391658.jpg">
    			<label class="goodPrice">￥ 55.0</label>
    			<label class="sellingNum">销量：1000</label>
    			<label class="goodName">夏季薄款中老年休闲男士弹力牛仔裤加肥长裤宽松直筒大码爸爸男裤</label>
    		</td>
    		<td onmouseover="selectGood(this)" onmouseout="unselectGood(this)">
    			<img class="goodPic" alt="goodImage" src="./Images/TB2e81JpNxmpuFjSZFNXXXrRXXa_!!749391658.jpg">
    			<label class="goodPrice">￥ 55.0</label>
    			<label class="sellingNum">销量：1000</label>
    			<label class="goodName">夏季薄款中老年休闲男士弹力牛仔裤加肥长裤宽松直筒大码爸爸男裤</label>
    		</td>
    		<td onmouseover="selectGood(this)" onmouseout="unselectGood(this)">
    			<img class="goodPic" alt="goodImage" src="./Images/TB2e81JpNxmpuFjSZFNXXXrRXXa_!!749391658.jpg">
    			<label class="goodPrice">￥ 55.0</label>
    			<label class="sellingNum">销量：1000</label>
    			<label class="goodName">夏季薄款中老年休闲男士弹力牛仔裤加肥长裤宽松直筒大码爸爸男裤</label>
    		</td>
    	</tr>
    </table>
  </body>
</html>
