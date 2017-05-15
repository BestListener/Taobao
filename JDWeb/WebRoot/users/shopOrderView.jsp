<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<html>
  <head>
    <base href="<%=basePath%>">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
		var curOption;  //  当前选中的选项
		var options = new Object();
		options['undeliver'] = "./users/unDeliverOrder.jsp";
		options['Shipped'] = "./users/deliverOrder.jsp";
		function init()
		{
			curOption = "undeliver";
			var curBtn = document.getElementById(curOption);
			var view = document.getElementById("OrderData");
			curBtn.style.color = "black";
			curBtn.style.borderBottomColor = "#FF4111";
			view.src = options[curOption];
		}
		//  点击选项
		function clickOption(obj)
		{
			if( curOption != obj.id )
			{
				var curBtn = document.getElementById(curOption);
				var view = document.getElementById("OrderData");
				curBtn.style.color = "#adb0b3";
				curBtn.style.borderBottomColor = "#D5D5D5";
				obj.style.color = "black";
				obj.style.borderBottomColor = "#FF4111";
				curOption = obj.id;
				view.src = options[curOption];
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
	#topOption
	{
		position:absolute;
		top:5px;
		left:30px;
		width:95%;
		height:30px;
		border-bottom:#D5D5D5 solid 2px;
	}
	#OrderData
	{
		position:absolute;
		top:40px;
		left:30px;
		width:95%;
		height:700px;
		border:none;
	}
	#undeliver
	{
		position:absolute;
		top:0px;
		left:30px;
		width:100px;
		height:30px;
		color:black;
		text-align:center;
		border-bottom:#D5D5D5 solid 2px;
		cursor:pointer;
	}
	#Shipped
	{
		position:absolute;
		top:0px;
		left:130px;
		width:100px;
		height:30px;
		color:#adb0b3;
		text-align:center;
		border-bottom:#D5D5D5 solid 2px;
		cursor:pointer;
	}
	</style>
  </head>
  
  <body onload="init()">
    	<div id="title">店铺订单管理</div>
   		<div id="content">
   			<div id="topOption">
   				<span id="undeliver" onclick="clickOption(this)">未处理</span>
   				<span id="Shipped" onclick="clickOption(this)">已处理</span>
   			</div>
   			<iframe id="OrderData" src="./users/unDeliverOrder.jsp">	
   			</iframe>
   		</div>
  </body>
</html>
