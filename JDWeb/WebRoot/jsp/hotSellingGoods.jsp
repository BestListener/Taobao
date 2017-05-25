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
	<link rel="stylesheet" type="text/css" href="./css/hotSelling.css">
	<script type="text/javascript" src="./js/hotSelling.js"></script>
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
