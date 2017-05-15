<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<html>
  <head>
    <base href="<%=basePath%>">
    <link rel="stylesheet" type="text/css" href="./css/pageCtrlBox.css">
    <link rel="stylesheet" type="text/css" href="./users/css/orderCtrl.css">
	<script type="text/javascript" src="./users/js/orderCtrl.js"></script>
	<script type="text/javascript">

	</script>
	<style type="text/css">
	
	</style>
  </head>
  
  <body>
    <table id="orderTab">
		<tr id="firstTr">
			<th colspan="2">宝贝</th>
			<th>单价</th>
			<th>数量</th>
			<th>应付款</th>
			<th>订单状态</th>
			<th>下单时间</th>
			<th>交易操作</th>
		</tr>
		<tr id="1">
			<td class="pic">
				<img alt="goodsPic" src="./Images/TB2e81JpNxmpuFjSZFNXXXrRXXa_!!749391658.jpg">
			</td>
			<td class="name">宝贝宝贝宝贝宝贝宝贝宝贝宝贝宝贝宝贝宝贝宝贝宝贝宝贝宝贝宝贝宝贝宝贝</td>
			<td class="price">单价</td>
			<td class="num">数量</td>
			<td class="allprice">实付款</td>
			<td class="state">交易状态</td>
			<td class="date">2017-05-12</td>
			<td class="operation">
				<div class="confirmBtn" onclick="clickConBtn(this)" onmouseover="inconfirmBtn(this)" onmouseout="outconfirmBtn(this)">发货</div>
			</td>
		</tr>
		<tr id="1">
			<td class="pic">
				<img alt="goodsPic" src="./Images/TB2e81JpNxmpuFjSZFNXXXrRXXa_!!749391658.jpg">
			</td>
			<td class="name">宝贝宝贝宝贝宝贝宝贝宝贝宝贝宝贝宝贝宝贝宝贝宝贝宝贝宝贝宝贝宝贝宝贝</td>
			<td class="price">单价</td>
			<td class="num">数量</td>
			<td class="allprice">实付款</td>
			<td class="state">交易状态</td>
			<td class="date">2017-05-12</td>
			<td class="operation">
				<div class="deleteBtn" onclick="clickDelBtn(this)" onmouseover="indeleteBtn(this)" onmouseout="outdeleteBtn(this)">删除</div>
				<div class="confirmBtn" onclick="clickConBtn(this)" onmouseover="inconfirmBtn(this)" onmouseout="outconfirmBtn(this)">确认收货</div>
			</td>
		</tr>
		<tr id="1">
			<td class="pic">
				<img alt="goodsPic" src="./Images/TB2e81JpNxmpuFjSZFNXXXrRXXa_!!749391658.jpg">
			</td>
			<td class="name">宝贝宝贝宝贝宝贝宝贝宝贝宝贝宝贝宝贝宝贝宝贝宝贝宝贝宝贝宝贝宝贝宝贝</td>
			<td class="price">单价</td>
			<td class="num">数量</td>
			<td class="allprice">实付款</td>
			<td class="state">交易状态</td>
			<td class="date">2017-05-12</td>
			<td class="operation">
				<div class="deleteBtn" onclick="clickDelBtn(this)" onmouseover="indeleteBtn(this)" onmouseout="outdeleteBtn(this)">删除</div>
				<div class="confirmBtn" onclick="clickConBtn(this)" onmouseover="inconfirmBtn(this)" onmouseout="outconfirmBtn(this)">确认收货</div>
			</td>
		</tr>
		<tr id="1">
			<td class="pic">
				<img alt="goodsPic" src="./Images/TB2e81JpNxmpuFjSZFNXXXrRXXa_!!749391658.jpg">
			</td>
			<td class="name">宝贝宝贝宝贝宝贝宝贝宝贝宝贝宝贝宝贝宝贝宝贝宝贝宝贝宝贝宝贝宝贝宝贝</td>
			<td class="price">单价</td>
			<td class="num">数量</td>
			<td class="allprice">实付款</td>
			<td class="state">交易状态</td>
			<td class="date">2017-05-12</td>
			<td class="operation">
				<div class="deleteBtn" onclick="clickDelBtn(this)" onmouseover="indeleteBtn(this)" onmouseout="outdeleteBtn(this)">删除</div>
				<div class="confirmBtn" onclick="clickConBtn(this)" onmouseover="inconfirmBtn(this)" onmouseout="outconfirmBtn(this)">确认收货</div>
			</td>
		</tr>
		<tr id="1">
			<td class="pic">
				<img alt="goodsPic" src="./Images/TB2e81JpNxmpuFjSZFNXXXrRXXa_!!749391658.jpg">
			</td>
			<td class="name">宝贝宝贝宝贝宝贝宝贝宝贝宝贝宝贝宝贝宝贝宝贝宝贝宝贝宝贝宝贝宝贝宝贝</td>
			<td class="price">单价</td>
			<td class="num">数量</td>
			<td class="allprice">实付款</td>
			<td class="state">交易状态</td>
			<td class="date">2017-05-12</td>
			<td class="operation">
				<div class="deleteBtn" onclick="clickDelBtn(this)" onmouseover="indeleteBtn(this)" onmouseout="outdeleteBtn(this)">删除</div>
				<div class="confirmBtn" onclick="clickConBtn(this)" onmouseover="inconfirmBtn(this)" onmouseout="outconfirmBtn(this)">确认收货</div>
			</td>
		</tr>
		<tr id="1">
			<td class="pic">
				<img alt="goodsPic" src="./Images/TB2e81JpNxmpuFjSZFNXXXrRXXa_!!749391658.jpg">
			</td>
			<td class="name">宝贝宝贝宝贝宝贝宝贝宝贝宝贝宝贝宝贝宝贝宝贝宝贝宝贝宝贝宝贝宝贝宝贝</td>
			<td class="price">单价</td>
			<td class="num">数量</td>
			<td class="allprice">实付款</td>
			<td class="state">交易状态</td>
			<td class="date">2017-05-12</td>
			<td class="operation">
				<div class="deleteBtn" onclick="clickDelBtn(this)" onmouseover="indeleteBtn(this)" onmouseout="outdeleteBtn(this)">删除</div>
				<div class="confirmBtn" onclick="clickConBtn(this)" onmouseover="inconfirmBtn(this)" onmouseout="outconfirmBtn(this)">确认收货</div>
			</td>
		</tr>
		<tr id="1">
			<td class="Tip" colspan="8">
				暂时没有人任何下单。
			</td>
		</tr>
	</table>
	<div id="pagesCtrl" class="UM_pagesCtrl">
	   	<span>
	   		<a href="#">《&nbsp;上一页</a>
	   		<a href="#">1</a>
	   		<a href="#">2</a>
	   		<a href="#">下一页&nbsp;》</a>
	   		<label class="pageCount">共&nbsp;100&nbsp;页</label>
	   	</span>
	</div>
  </body>
</html>
