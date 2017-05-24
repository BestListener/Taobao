<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="cn.edu.zhku.she.Util.PageBean" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
PageBean pageBean = (PageBean)request.getAttribute("orders");
String pagebtn = "";
String url = "./servlet/getUserOrderInfo?page=";
String delurl = "./servlet/deleteUserOrder?page=";
if( pageBean.getDataSize() % pageBean.getPageSize() == 1 && pageBean.getCurPage() == pageBean.getTotalPages())
{
	//  处于最后一页
	int p = pageBean.getCurPage() - 1;
	if( p < 1 )
		p = 1;
	delurl = delurl+p;
}
else
{
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
    <link rel="stylesheet" type="text/css" href="./users/css/userOrderView.css">
    <script type="text/javascript" src="./js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="./users/js/userOrderView.js"></script>
	<script type="text/javascript">
		function init()
		{
			var msg = "${msg}";
			if( msg != "" )
				alert(msg);
		}
  		//  点击删除按钮
  		function clickDelBtn(obj)
  		{
  			var tr = obj.parentNode.parentNode.id;
  			var name = document.getElementById("name"+tr);
  			if( window.confirm("你确定要删除：" + name.innerText + " 的订单吗？删除之后不可恢复！") )
  			{
				//  确定删除操作
				window.location.href = "<%=delurl%>&oid="+tr;
  			}
  		}
	</script>
  </head>
  
  <body onload="init()">
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
   				<%
					if( pageBean.getData().size() > 0 )
					{
						for(int i=0;i < pageBean.getData().size(); i++ )
						{
							Map product = (Map)pageBean.getData().get(i);
				 %>
   				<tr id="<%= product.get("oid") %>">
   					<td class="pic">
   						<img alt="goodsPic" onclick="browse(<%=product.get("pid") %>)" src="./<%= product.get("bigImg") %>">
   					</td>
   					<td id="name<%= product.get("oid") %>" onclick="browse(<%=product.get("pid") %>)" class="name"><%= product.get("name") %></td>
   					<td class="price"><%= product.get("price") %></td>
   					<td class="num"><%= product.get("buyNum") %></td>
   					<td class="allprice"><%= product.get("payAmount") %></td>
   					<td id="state<%= product.get("oid") %>" class="state"><%= product.get("ostate") %></td>
   					<td class="date"><%= product.get("odate") %></td>
   					<td class="operation">
   						<div id="del<%= product.get("oid") %>" class="deleteBtn" onclick="clickDelBtn(this)" onmouseover="indeleteBtn(this)" onmouseout="outdeleteBtn(this)">删除</div>
   						<div id="con<%= product.get("oid") %>" class="confirmBtn" onclick="clickConBtn(this,<%=product.get("pid") %>,<%= product.get("buyNum") %>)" onmouseover="inconfirmBtn(this)" onmouseout="outconfirmBtn(this)">确认收货</div>
   					<%
   							if( product.get("ostate").toString().equals("交易成功") )
   							{
   					 %>
   							<script type="text/javascript">
   								showBtn("del"+<%= product.get("oid") %>);
   							</script>
   					<%
   							}
   							else if( product.get("ostate").toString().equals("正在运送") ){
   					 %>
   							<script type="text/javascript">
   								showBtn("con"+<%= product.get("oid") %>);
   							</script>
   					<%
   							}
   					 %>
   					</td>
   				</tr>
   				<%
						}
					}
					else{
				 %>
					<tr>
			 			<td class="Tip" colspan="8">
							您暂时没有任何订单信息。
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
		    	<label class="pageCount">共&nbsp;<%=pageBean.getTotalPages() %>&nbsp;页</label>
		    	</span>
		    </div>
		    <%
		    	}
		     %>
   		</div>
  </body>
</html>
