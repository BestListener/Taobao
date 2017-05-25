<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="cn.edu.zhku.she.Util.PageBean" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String pagebtn = "";
String tip = "";
String url = session.getAttribute("pageurl").toString();
PageBean pageBean = (PageBean)request.getAttribute("pageBean");
if( request.getAttribute("search") != null )
	tip = "没有相关的产品。";
else
	tip = "暂时没有该类产品。";
url = url + "&page=";
//  添加上一页按钮
if( pageBean.getCurPage() != 1 )
{
	int pre =  pageBean.getCurPage()-1;
	pagebtn = pagebtn + "<a href=\""+url+pre+"\">《&nbsp;上一页</a>&nbsp;";
}else{
	pagebtn = pagebtn + "<a>《&nbsp;上一页</a>&nbsp;";
}
//  如果页数小于7
if( pageBean.getTotalPages() < 7 )
{
	//  按钮全部显示
	for(int i=0;i < pageBean.getTotalPages(); i++ )
	{
		int t = i + 1;
		if( t != pageBean.getCurPage() )
		{
			pagebtn = pagebtn + "<a href=\""+url+t+"\">"+t+"</a>&nbsp;";
		}
		else{
			pagebtn = pagebtn + "<a class=\"curPageSty\">"+t+"</a>&nbsp;";
		}
	}
}
else if( pageBean.getCurPage() <= 7 )	//  如果当前页面小于7
{
	//  显示1~7...
	for( int i=0;i<7;i++)
	{
		int t = i + 1;
		if( t != pageBean.getCurPage() )
		{
			pagebtn = pagebtn + "<a href=\""+url+t+"\">"+t+"</a>&nbsp;";
		}
		else{
			pagebtn = pagebtn + "<a class=\"curPageSty\">"+t+"</a>&nbsp;";
		}
	}
	pagebtn = pagebtn + "...";
}
else if( pageBean.getCurPage() > 7 )	//  如果当前页大于7
{
	pagebtn = pagebtn + "<a href=\""+url+"1\">"+1+"</a>&nbsp;";
	pagebtn = pagebtn + "<a href=\""+url+"2\">"+2+"</a>&nbsp;";
	pagebtn = pagebtn + "...";
	//  当前页+2小于总页数
	//  显示 1 2 ... cur-2 cur-1 cur cur+1 cur+2...
	if( pageBean.getCurPage() + 2 < pageBean.getTotalPages() )
	{
		for(int i = pageBean.getCurPage() -2; i < i+5; i++ )
		{
			if( i != pageBean.getCurPage() )
			{
				pagebtn = pagebtn + "<a href=\""+url+i+"\">"+i+"</a>&nbsp;";
			}
			else{
				pagebtn = pagebtn + "<a class=\"curPageSty\">"+i+"</a>&nbsp;";
			}
		}
		pagebtn = pagebtn + "...";
	}
	else		//  当前页+2小于总页数    显示 1 2 ... tol-4 tol-3 tol-2 tol-1 tol
	{
		for(int i = pageBean.getTotalPages() - 4; i <= pageBean.getTotalPages(); i++ )
		{
			if( i != pageBean.getCurPage() )
			{
				pagebtn = pagebtn + "<a href=\""+url+i+"\">"+i+"</a>&nbsp;";
			}
			else{
				pagebtn = pagebtn + "<a class=\"curPageSty\">"+i+"</a>&nbsp;";
			}
		}
	}
}
//  添加下一页按钮
if( pageBean.getCurPage() != pageBean.getTotalPages() )
{
	int next = pageBean.getCurPage()+1;
	pagebtn = pagebtn + "<a href=\""+url+next+"\">《&nbsp;下一页</a>";
}else{
	pagebtn = pagebtn + "<a>《&nbsp;下一页</a>";
}
%>

<html>
  <head>
    <base href="<%=basePath%>">
	<link rel="stylesheet" type="text/css" href="./css/pageCtrlBox.css">
	<link rel="stylesheet" type="text/css" href="./css/bookDetail.css">
	<script type="text/javascript" src="./js/bookDetail.js"></script>
  </head>
  
  <body>
    <table id="goodsData">
    	<tr>
    	<%
			if( pageBean.getData().size() > 0 )
			{
				for(int i=0;i < pageBean.getData().size(); i++ )
				{
					Map product = (Map)pageBean.getData().get(i);
		 %>
    		<td id="<%= product.get("pid") %>" onclick="toBrowseProduct(<%= product.get("pid") %>)" style="cursor:pointer" onmouseover="selectGood(this)" onmouseout="unselectGood(this)">
    			<img class="goodPic" alt="goodImage" src="./<%= product.get("bigImg") %>">
    			<label class="goodPrice">￥ <%= product.get("price") %></label>
    			<label class="sellingNum">销量：<%= product.get("salesAmount") %></label>
    			<img class="shopPic" alt="shopPicture" src="./pics/supermarket22.png">
    			<label class="shopName" id="shopName"><%= product.get("shopname") %></label>
    			<label class="goodName"><%= product.get("name") %></label>
    		</td>
    	<%
    				if( ( i + 1 ) % 4 == 0 )
    				{
    	%>
    		</tr>
    		<tr>
    	<%
					}
				}
				if( pageBean.getData().size() % 4 != 0 )
   				{
   					int i = pageBean.getData().size();
   					while( i % 4 != 0)
   					{
   						i++;
   		%>
   					<td></td>
   		<% 
   					}
   				}
			}
			else{
		 %>
		 	<tr style="width:90%">
	 			<td class="Tip" style="font-size:24px">
					<% out.print(tip); %>
	 			</td>
	 		</tr>
		 <%
 			}
 		 %>
		</tr>
    </table>
    <%
		if( pageBean.getTotalPages() > 1 )
		{
	 %>
    <div id="pagesCtrl" class="pagesCtrl">
    	<span>
    		<% out.print(pagebtn); %>
    		<label class="pageCount">共&nbsp;<%=pageBean.getTotalPages() %>&nbsp;页</label>
    	</span>
    </div>
     <%
    	}
     %>
  </body>
</html>
