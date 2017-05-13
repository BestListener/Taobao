<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
  <head>
    <base href="<%=basePath%>">
    <link rel="stylesheet" type="text/css" href="./css/pageCtrlBox.css">
	<script type="text/javascript">
		function indeleteBtn(obj)
  		{
  			obj.style.backgroundColor = "#FF0000";
  		}
  		//  鼠标移出立即购买按键
  		function outdeleteBtn(obj)
  		{
  			obj.style.backgroundColor = "#FF4444";
  		}
  		//  鼠标移入加入购物车按键
  		function inconfirmBtn(obj)
  		{
  			obj.style.backgroundColor = "#DD2C00";
  		}
  		//  鼠标移出加入购物车按键
  		function outconfirmBtn(obj)
  		{
  			obj.style.backgroundColor = "#FF3300";
  		}
  		//  点击删除按钮
  		function clickDelBtn(obj)
  		{
  			var tr = obj.parentNode.parentNode;
  			if( window.confirm("你确定要删除订单号为：" + tr.id + " 的订单吗？") )
  			{
				//  确定删除操作
  			}
  		}
  		//  点击确认按钮
  		function clickConBtn(obj)
  		{
  			//   扩展：弹出评论界面，用户可选择评论或者取消
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
	#orderTab
	{
		position:absolute;
		top:20px;
		left:30px;
		width:95%;
		border-collapse:separate; 
		border-spacing:0px 10px;
	}
	#firstTr
	{
		background-color:#F1F1F1;
		height:35px;
	}
	#orderTab tr td
	{
		border:gray solid 1px;
		font-size:15px;
	}
	.pic img
	{
		width:80px;
		height:60px;
	}
	.name
	{
		width:28%;
		text-align:center;
		vertical-align:top;
	}
	.price
	{
		width:10%;
		text-align:center;
		vertical-align:top;
	}
	.num
	{
		width:10%;
		text-align:center;
		vertical-align:top;
	}
	.allprice
	{
		width:10%;
		text-align:center;
		vertical-align:top;
	}
	.state
	{
		width:10%;
		text-align:center;
		vertical-align:top;
	}
	.operation
	{
		width:10%;
		text-align:center;
		vertical-align:top;
	}
	.date
	{
		width:15%;
		text-align:center;
		vertical-align:top;
	}
	.deleteBtn
	{
		position:relative;
		top:10px;
		left:8px;
		width:80px;
		height:27px;
		color:white;
		background-color:#FF4444;
		cursor:pointer;
		padding-top:2px;
		-moz-border-radius: 2px;
    	-webkit-border-radius: 2px;
    	border-radius: 2px;
	}
	.confirmBtn
	{
		position:relative;
		top:10px;
		left:8px;
		width:80px;
		height:27px;
		color:white;
		background-color:#FF3300;
		cursor:pointer;
		padding-top:2px;
		-moz-border-radius: 2px;
    	-webkit-border-radius: 2px;
    	border-radius: 2px;
	}
	</style>
  </head>
  
  <body>
   	   	<div id="title">订单管理</div>
   		<div id="content">
   			<table id="orderTab">
   				<tr id="firstTr">
   					<th colspan="2">宝贝</th>
   					<th>单价</th>
   					<th>数量</th>
   					<th>实付款</th>
   					<th>交易状态</th>
   					<th>交易时间</th>
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
   		</div>
  </body>
</html>
