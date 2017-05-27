<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="cn.edu.zhku.she.Util.PageBean" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
PageBean pageBean = (PageBean)request.getAttribute("pageBean");
String pagebtn = "";
String msg = "";
if( request.getAttribute("search") != null )
{
	msg = "不存在相关店铺。";
}
else if( session.getAttribute("shopmsg") != null )
{
	msg = session.getAttribute("shopmsg").toString();
	session.removeAttribute("shopmsg");
}
else
	msg = "暂时没有店铺申请。";
String params[] = session.getAttribute("shoppageurl").toString().split("\\?");
String url = session.getAttribute("shoppageurl").toString()+"&page=";
session.removeAttribute("shoppageurl");
String checkurl = "/JDWeb/servlet/admin/getShopInfo?"+params[1]+"&page="+pageBean.getCurPage();
String delurl = "/JDWeb/servlet/admin/updateShopState?"+params[1]+"&page=";
if( pageBean.getDataSize() % pageBean.getPageSize() == 1 && pageBean.getCurPage() == pageBean.getTotalPages())
{
	//  处于最后一页
	int p = pageBean.getCurPage() - 1;
	if( p < 1 )
		p = 1;
	delurl = delurl+p;
	checkurl = checkurl + "&afterPage="+p;
}
else
{
	int p = pageBean.getCurPage();
	delurl = delurl+p;
	checkurl = checkurl + "&afterPage="+p;
}
//  添加上一页按钮
if( pageBean.getCurPage() != 1 )
{
	int pre =  pageBean.getCurPage()-1;
	pagebtn = pagebtn + "<a href=\""+url+pre+"\">《&nbsp;上一页</a>&nbsp;";
}else{
	pagebtn = pagebtn + "<a>《&nbsp;上一页</a>&nbsp;";
}
//  如果页数小于等于7
if( pageBean.getTotalPages() <= 7 )
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
	<link rel="stylesheet" type="text/css" href="/JDWeb/Admin/css/shopListView.css">
	<link rel="stylesheet" type="text/css" href="/JDWeb/css/pageCtrlBox.css">
	<script type="text/javascript" src="/JDWeb/Admin/js/shopListView.js"></script>
	<script type="text/javascript">
		function init()
		{
			var msg = "${msg}";
			if( msg != "" )
				alert(msg);
		}
		//  点击查看按钮
  		function clickCheckBtn(obj)
  		{
  			var id = obj.parentNode.parentNode.id;
  			window.parent.location.href = "<%=checkurl%>&sid="+id;
  		}
  		//  点击名字
  		function clickname(id)
  		{
  			window.parent.location.href = "<%=checkurl%>&sid="+id;
  		}
  		//  点击通过按键
  		function clickPassBtn(obj)
  		{
  			var id = obj.parentNode.parentNode.id;
  			var name = document.getElementById("name"+id);
  			if( window.confirm("确定店铺  "+name.innerText+" 验证通过?") )
  			{
  				window.location.href = "<%=delurl%>&sid="+id;
  			}
  		}
	</script>
  </head>
  
  <body onload="init()">
    <table id="orderTab">
		<tr id="firstTr">
			<th>ID</th>
			<th>店铺名</th>
			<th>掌柜名</th>
			<th>所属用户</th>
			<th>联系方式</th>
			<th>状态</th>
			<th>操作</th>
		</tr>
		<%
			if( pageBean.getData().size() > 0 )
			{
				for(int i=0;i < pageBean.getData().size(); i++ )
				{
					Map shop = (Map)pageBean.getData().get(i);
		 %>
		<tr id="<%=shop.get("sid") %>">
			<td class="ID"><%=shop.get("sid") %></td>
			<td id="name<%=shop.get("sid") %>" onclick="clickname(<%=shop.get("sid") %>)" class="shopname"><%=shop.get("shopname") %></td>
			<td class="name"><%=shop.get("ownername") %></td>
			<td class="username"><%=shop.get("username") %></td>
			<td class="phone"><%=shop.get("phoneNumber") %></td>
			<td class="stoped"><%=shop.get("shopstate") %></td>
			<td class="operation">
				<div class="checkBtn" onclick="clickCheckBtn(this)" onmouseover="inCheckBtn(this)" onmouseout="outCheckBtn(this)">查看</div>
				<div class="passBtn" onclick="clickPassBtn(this)" onmouseover="inPassBtn(this)" onmouseout="outPassBtn(this)">通过</div>
			</td>
		</tr>
		<%
				}
			}
			else{
		 %>
		<tr>
			<td class="Tip" colspan="7">
				<% out.print(msg); %>
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
	    <div id="pagesCtrl" class="M_pagesCtrl">
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
