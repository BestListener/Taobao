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
		//  鼠标移入删除按键
		function indeleteBtn(obj)
  		{
  			obj.style.backgroundColor = "#FF0000";
  		}
  		//  鼠标移出删除按键
  		function outdeleteBtn(obj)
  		{
  			obj.style.backgroundColor = "#FF4444";
  		}
  		//  鼠标移入修改按键
  		function inconfirmBtn(obj)
  		{
  			obj.style.backgroundColor = "#AAAAAA";
  		}
  		//  鼠标移出修改按键
  		function outconfirmBtn(obj)
  		{
  			obj.style.backgroundColor = "#CCCCCC";
  		}
  		//  点击删除按钮
  		function clickDelBtn(obj)
  		{
  			var tr = obj.parentNode.parentNode;
  			if( window.confirm("你确定要下架该商品吗？") )
  			{
				//  确定删除操作
  			}
  		}
  		//  点击修改按钮
  		function clickConBtn(obj)
  		{
  			//   
  		}
	</script>
	<style type="text/css">
	body,input,select
	{
		font-family:Microsoft YaHei;
	}
	#orderTab
	{
		position:absolute;
		top:0px;
		left:0px;
		width:100%;
		border-collapse:collapse; 
	}
	#firstTr
	{
		background-color:#F1F1F1;
		height:35px;
	}
	#orderTab tr th
	{
		border-left:#F1F1F1 solid 1px;	
		border-right:#F1F1F1 solid 1px;	
	}
	#orderTab tr td
	{
		border:#CCCCCC solid 1px;
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
		vertical-align:center;
	}
	.num
	{
		width:10%;
		text-align:center;
		vertical-align:center;
	}
	.className
	{
		width:20%;
		text-align:center;
		vertical-align:center;
	}
	.state
	{
		width:10%;
		text-align:center;
		vertical-align:center;
	}
	.operation
	{
		width:20%;
		text-align:center;
		vertical-align:top;
	}
	.deleteBtn
	{
		position:relative;
		top:15px;
		left:98px;
		width:80px;
		height:25px;
		color:white;
		background-color:#FF4444;
		cursor:pointer;
		padding-top:4px;
		-moz-border-radius: 2px;
    	-webkit-border-radius: 2px;
    	border-radius: 2px;
	}
	.confirmBtn
	{
		position:relative;
		top:-14px;
		left:8px;
		width:80px;
		height:25px;
		color:white;
		background-color:#CCCCCC;
		cursor:pointer;
		padding-top:4px;
		-moz-border-radius: 2px;
    	-webkit-border-radius: 2px;
    	border-radius: 2px;
	}
	.Tip
	{
		text-align:center;
		vertical-align:top;
	}
	</style>
  </head>
  
  <body>
    <table id="orderTab">
		<tr id="firstTr">
			<th colspan="2">宝贝</th>
			<th>售价</th>
			<th>库存</th>
			<th>分类</th>
			<th>商品状态</th>
			<th>操作</th>
		</tr>
		<tr id="1">
			<td class="pic">
				<img alt="goodsPic" src="./Images/TB2e81JpNxmpuFjSZFNXXXrRXXa_!!749391658.jpg">
			</td>
			<td class="name">宝贝宝贝宝贝宝贝宝贝宝贝宝贝宝贝宝贝宝贝宝贝宝贝宝贝宝贝宝贝宝贝宝贝</td>
			<td class="price">售价</td>
			<td class="num">库存</td>
			<td class="className">分类</td>
			<td class="state">商品状态</td>
			<td class="operation">
				<div class="deleteBtn" onclick="clickDelBtn(this)" onmouseover="indeleteBtn(this)" onmouseout="outdeleteBtn(this)">下架</div>
				<div class="confirmBtn" onclick="clickConBtn(this)" onmouseover="inconfirmBtn(this)" onmouseout="outconfirmBtn(this)">修改</div>
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
