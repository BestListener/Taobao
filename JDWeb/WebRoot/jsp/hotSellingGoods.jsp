<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.setCharacterEncoding("utf-8");
List products = (List)request.getAttribute("products");
%>

<html>
  <head>
    <base href="<%=basePath%>">
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
		//  前往产品浏览页面
  		function toBrowseProduct(pid)
  		{
  			window.open("./servlet/browseGoods?pid="+pid);
  		}
	</script>
	<style type="text/css">
		body
		{
			overflow:hidden;
		}
		#goodsData
		{
			position:absolute;
			top:5px;
			left:8px;
			margin:0px;
			padding:0px;
			width:98%;
			border-collapse:separate; 
			border-spacing:5px 5px;
			list-style-type:none;
		}
		#goodsData tr td
		{
			position:relative;
			width:264px;
			height:330px;
			margin:0px;
			padding:0px;
			background-color:white;
			border:white solid 2px;
			font-size:13px;
			font-family:Microsoft YaHei;
			cursor:pointer;
		}
		.goodPic
		{
			position:absolute;
			top:5px;
			left:5px;
			width:210px;
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
			width:190px;
			height:60px;
			color:#5E5E5E;
			display:block;
		}
	</style>
  </head>
  
  <body>
    <table id="goodsData">
    	<tr>
    	<%
    		if( products != null )
    		{
    			if( products.size() > 0 )
				{
					int j;
					if( products.size() > 5 )
					{
						j = 5;
					}else
					{
						j = products.size();
					}
					for(int i=0;i < j; i++ )
					{
						Map product = (Map)products.get(i);
    	 %>
    		<td id="<%=product.get("pid") %>" onclick="toBrowseProduct(<%=product.get("pid") %>)" onmouseover="selectGood(this)" onmouseout="unselectGood(this)">
    			<img class="goodPic" alt="goodImage" src="./<%=product.get("bigImg") %>">
    			<label class="goodPrice">￥ <%=product.get("price") %></label>
    			<label class="sellingNum">销量：<%=product.get("salesAmount") %></label>
    			<label class="goodName"><%=product.get("name") %></label>
    		</td>
   		<%
   					}
   		 %>
    	</tr>
    	<tr>
		<%
					for(int i=j;i < products.size();i++)
					{
						Map product = (Map)products.get(i);
		 %>
    		<td id="<%=product.get("pid") %>" onclick="toBrowseProduct(<%=product.get("pid") %>)" onmouseover="selectGood(this)" onmouseout="unselectGood(this)">
    			<img class="goodPic" alt="goodImage" src="./<%=product.get("bigImg") %>">
    			<label class="goodPrice">￥ <%=product.get("price") %></label>
    			<label class="sellingNum">销量：<%=product.get("salesAmount") %></label>
    			<label class="goodName"><%=product.get("name") %></label>
    		</td>
    	<%
    				}
    			}
    		}
    	 %>
    	 </tr>
    </table>
  </body>
</html>
