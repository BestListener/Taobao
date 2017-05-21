<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="cn.edu.zhku.she.Util.PageBean" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String search = null;
if( request.getAttribute("search") != null )
	search = request.getAttribute("search").toString();
PageBean pageBean = (PageBean)request.getAttribute("pageBean");
String pagebtn = "";	
String url = "./servlet/getProductInfo?";
String delurl = "./servlet/delProduct?";
//  如果搜索值不为空
if( search != null && search.length() > 0 )
{
	url = url + "search=" + search + "&page=";
	delurl = delurl + "search=" + search + "&page=";
}
else{
	url = url + "page=";
	delurl = delurl + "page=";
}
if( pageBean.getDataSize() % pageBean.getPageSize() == 1)
{
	int p = pageBean.getCurPage() - 1;
	if( p < 1 )
		p = 1;
	delurl = delurl+p;
}
else{
	int p = pageBean.getCurPage();
	delurl = delurl+p;
}
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
			pagebtn = pagebtn + "<a href=\""+url+i+"\">"+i+"</a>&nbsp;";
		}
		pagebtn = pagebtn + "...";
	}
	else		//  当前页+2小于总页数    显示 1 2 ... tol-4 tol-3 tol-2 tol-1 tol
	{
		for(int i = pageBean.getTotalPages() - 4; i <= pageBean.getTotalPages(); i++ )
		{
			pagebtn = pagebtn + "<a href=\""+url+i+"\">"+i+"</a>&nbsp;";
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
    <script type="text/javascript" src="./js/jquery-3.2.1.min.js"></script>
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
			var td = $("#"+tr.id).find("td");
  			if( window.confirm("你确定要下架  "+td[1].innerText+" 商品吗？") )
  			{
				//  确定删除操作
				var url = "<%=delurl%>&pid="+tr.id;
	            window.location.href = url;
  			}
  		}
  		//  点击修改按钮
  		function clickConBtn(obj)
  		{
  			var id = obj.parentNode.parentNode.id;
  			window.parent.location.href = "./servlet/getProduct?pid="+id;
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
		<%
			if( pageBean.getData().size() > 0 )
			{
				for(int i=0;i < pageBean.getData().size(); i++ )
				{
					Map product = (Map)pageBean.getData().get(i);
		 %>
		<tr id=<%= product.get("pid") %>>
			<td class="pic">
				<img alt="goodsPic" src="./<%= product.get("bigImg") %>">
			</td>
			<td class="name"><%= product.get("name") %></td>
			<td class="price"><%= product.get("price") %></td>
			<td class="num"><%= product.get("saveNum") %></td>
			<td class="className"><%= product.get("firstClass") %>/<%= product.get("secondClass") %></td>
			<td class="state"><%= product.get("goodsState") %></td>
			<td class="operation">
				<div class="deleteBtn" onclick="clickDelBtn(this)" onmouseover="indeleteBtn(this)" onmouseout="outdeleteBtn(this)">下架</div>
				<div class="confirmBtn" onclick="clickConBtn(this)" onmouseover="inconfirmBtn(this)" onmouseout="outconfirmBtn(this)">修改</div>
			</td>
		</tr>
		<%
				}
			}
			else{
		 %>
			<tr>
	 			<td class="Tip" colspan="7">
					您暂时没有上架任何商品。
	 			</td>
	 		</tr>
		 <%
 			}
 		 %>
	</table>
	<%
		if( pageBean.getTotalPages() > 1 )
		{
	 %>
    <div id="pagesCtrl" class="UM_pagesCtrl">
   		<span>
		<% out.print(pagebtn); %>
    	<label class="pageCount">共&nbsp;<%=pageBean.getPageSize() %>&nbsp;页</label>
    	</span>
    </div>
    <%
    	}
     %>
  </body>
</html>
