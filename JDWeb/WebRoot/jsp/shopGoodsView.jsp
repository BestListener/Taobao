<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.setCharacterEncoding("utf-8");
String msg = "";
List products = null;
//  如果获取的数据不为空
if( request.getAttribute("products") != null )
{
	products = (List)request.getAttribute("products");
}
else{
	msg = "服务器出错，请稍后重试";
}
%>

<html>
  <head>
    <base href="<%=basePath%>">
	<script type="text/javascript">
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
	  		}
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
			//  前往产品浏览页面
	  		function toBrowseProduct(obj)
	  		{
	  			var id = obj.parentNode.id;
	  			window.open("./servlet/browseGoods?pid="+id);
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
  
  <body onload="init()">
   <table id="shopGoodsData">
   		<%
   			if( products.size() > 0 )
   			{
   				//  最大显示数
   				int num = 7;
   				if( products.size() < 7 )
   				{
   					num = products.size();
   				}
   				for(int i=0;i < num; i++)
   				{
   					Map product = (Map)products.get(i);
   					String price = product.get("price").toString();
   					String[] apart = price.split("\\.");
   					if( apart.length == 1 )
   					{
   						price = price + ".0";
   					}
   		 %>
   		 <tr id="<%=product.get("pid") %>">
   			<td onclick="toBrowseProduct(this)" onmouseover="selectGood(this)" onmouseout="unselectGood(this)">
   			<img alt="goodsPic" src="./<%=product.get("bigImg") %>">
   			<label id="goodsPrices">￥&nbsp;<%=price %></label>
   			</td>
   		</tr>
   		<%
   				}
   			}
   		 %>
   </table>
  </body>
</html>
