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
	msg = "不存在相关用户。";
}
else if( session.getAttribute("msg") != null )
{
	msg = session.getAttribute("msg").toString();
	session.removeAttribute("msg");
}
else
	msg = "暂时没有用户。";
String params[] = session.getAttribute("userpageurl").toString().split("\\?");
String url = session.getAttribute("userpageurl").toString()+"&page=";
session.removeAttribute("userpageurl");
String checkurl = "/JDWeb/servlet/admin/getUserInfo?"+params[1]+"&page="+pageBean.getCurPage();
String delurl = "/JDWeb/servlet/admin/recoverUser?"+params[1]+"&page=";
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
	<link rel="stylesheet" type="text/css" href="/JDWeb/css/pageCtrlBox.css">
	<link rel="stylesheet" type="text/css" href="/JDWeb/Admin/css/userListView.css">
	<script type="text/javascript" src="/JDWeb/Admin/js/userListView.js"></script>
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
  			window.parent.location.href = "<%=checkurl%>&uid="+id;
  		}
  		//  点击名字
  		function clickname(id)
  		{
  			window.parent.location.href = "<%=checkurl%>&uid="+id;
  		}
  		//  点击恢复按键
  		function clickRecoverBtn(obj)
  		{
  			var id = obj.parentNode.parentNode.id;
  			var name = document.getElementById("name"+id);
  			if( window.confirm("确定恢复  "+name.innerText+" 用户帐号的使用?") )
  			{
  				window.location.href = "<%=delurl%>&uid="+id;
  			}
  		}
	</script>
  </head>
  
  <body onload="init()">
    <table id="orderTab">
		<tr id="firstTr">
			<th>ID</th>
			<th>头像</th>
			<th>用户名</th>
			<th>手机号</th>
			<th>状态</th>
			<th>操作</th>
		</tr>
		<%
			if( pageBean.getData().size() > 0 )
			{
				for(int i=0;i < pageBean.getData().size(); i++ )
				{
					Map user = (Map)pageBean.getData().get(i);
		 %>
		<tr id="<%=user.get("uid") %>">
			<td class="ID"><%=user.get("uid") %></td>
			<td class="image">
				<img alt="userImage" onclick="clickCheckBtn(this)" src="/JDWeb/<%=user.get("image") %>">
			</td>
			<td id="name<%=user.get("uid") %>" class="name" onclick="clickname(<%=user.get("uid") %>)"><%=user.get("username") %></td>
			<td class="phone"><%=user.get("phone") %></td>
			<td class="stoped"><%=user.get("state") %></td>
			<td class="operation">
				<div class="checkBtn" onclick="clickCheckBtn(this)" onmouseover="inCheckBtn(this)" onmouseout="outCheckBtn(this)">查看</div>
				<div class="recoverBtn" onclick="clickRecoverBtn(this)" onmouseover="inRecoverBtn(this)" onmouseout="outRecoverBtn(this)">恢复</div>
			</td>
		</tr>
		<%
				}
			}
			else{
		 %>
		<tr>
			<td class="Tip" colspan="6">
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
