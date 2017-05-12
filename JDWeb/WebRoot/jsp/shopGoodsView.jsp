<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
  <head>
    <base href="<%=basePath%>">
	<script type="text/javascript">
			var pageSize = 7; //  该页面最大容纳数
			//  鼠标选中
			function selectGood(obj)
			{
				obj.style.borderColor = "#FF4111";
			}
			//  鼠标移出
			function unselectGood(obj)
			{
				obj.style.borderColor = "white";
			}
	</script>
	<style type="text/css">
		#shopGoodsData
		{
			position:absolute;
			top:0px;
			left:0px;
			width:200px;
			list-style-type:none;
			border-collapse:separate; 
			border-spacing:0px 10px;
		}
		#shopGoodsData td
		{
			width:200px;
			height:150px;
			border:white solid 1px;
		}
		#shopGoodsData td img
		{
			position:relative;
			top:2px;
			left:2px;
			width:187px;
			height:120px;
		}
		#shopGoodsData td label
		{
			position:relative;
			top:2px;
			left:55px;
			width:190px;
			text-align:center;
			color:#FF4111;
			font-weight:bold;
			font-size:18px;
			font-family:Microsoft YaHei;
		}
	</style>
  </head>
  
  <body>
   <table id="shopGoodsData">
   		<tr>
   			<td onclick="" onmouseover="selectGood(this)" onmouseout="unselectGood(this)">
   			<img alt="goodsPic" src="./Images/TB2e81JpNxmpuFjSZFNXXXrRXXa_!!749391658.jpg">
   			<label id="goodsPrices">￥&nbsp;134.0</label>
   			</td>
   		</tr>
   		<tr>
   			<td onclick="" onmouseover="selectGood(this)" onmouseout="unselectGood(this)">
   			<img alt="goodsPic" src="./Images/TB2e81JpNxmpuFjSZFNXXXrRXXa_!!749391658.jpg">
   			<label id="goodsPrices">￥&nbsp;134.0</label>
   			</td>
   		</tr>
   		<tr>
   			<td onclick="" onmouseover="selectGood(this)" onmouseout="unselectGood(this)">
   			<img alt="goodsPic" src="./Images/TB2e81JpNxmpuFjSZFNXXXrRXXa_!!749391658.jpg">
   			<label id="goodsPrices">￥&nbsp;134.0</label>
   			</td>
   		</tr>
   		<tr>
   			<td onclick="" onmouseover="selectGood(this)" onmouseout="unselectGood(this)">
   			<img alt="goodsPic" src="./Images/TB2e81JpNxmpuFjSZFNXXXrRXXa_!!749391658.jpg">
   			<label id="goodsPrices">￥&nbsp;134.0</label>
   			</td>
   		</tr>
   		<tr>
   			<td onclick="" onmouseover="selectGood(this)" onmouseout="unselectGood(this)">
   			<img alt="goodsPic" src="./Images/TB2e81JpNxmpuFjSZFNXXXrRXXa_!!749391658.jpg">
   			<label id="goodsPrices">￥&nbsp;134.0</label>
   			</td>
   		</tr>
   		<tr>
   			<td onclick="" onmouseover="selectGood(this)" onmouseout="unselectGood(this)">
   			<img alt="goodsPic" src="./Images/TB2e81JpNxmpuFjSZFNXXXrRXXa_!!749391658.jpg">
   			<label id="goodsPrices">￥&nbsp;134.0</label>
   			</td>
   		</tr>
   		<tr>
   			<td onclick="" onmouseover="selectGood(this)" onmouseout="unselectGood(this)">
   			<img alt="goodsPic" src="./Images/TB2e81JpNxmpuFjSZFNXXXrRXXa_!!749391658.jpg">
   			<label id="goodsPrices">￥&nbsp;134.0</label>
   			</td>
   		</tr>
   </table>
  </body>
</html>
