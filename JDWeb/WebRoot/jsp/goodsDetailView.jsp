<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.setCharacterEncoding("utf-8");
String msg = "";
String firstClass = null;
String secondClass = null;
String image = null;
//  如果获取的数据不为空
if( request.getAttribute("productDetail") != null )
{
	//  获取分类属性，获取图像路径
	firstClass = request.getAttribute("firstClass").toString();
	secondClass = request.getAttribute("secondClass").toString();
	image = request.getAttribute("image").toString();
}
else
{
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
	</script>
	<style type="text/css">
	.goodsDetailInfo
	{
		position:relative;
		top:20px;
		left:0px;
	}
	.goodsDetailInfo li {
	    display: inline;
	    float: left;
	    width: 256px;
	    height: 24px;
	    margin-right: 20px;
	    overflow: hidden;
	    text-indent: 5px;
	    line-height: 24px;
	    white-space: nowrap;
	    text-overflow: ellipsis;
	    font-family:Microsoft YaHei;
	}
	.booksDetailInfo
	{
		position:relative;
		top:20px;
		left:0px;
	}
	.booksDetailInfo li{
	    display: inline;
	    float: left;
	    width: 380px;
	    height: 30px;
	    margin-right: 20px;
	    overflow: hidden;
	    text-align: right;
	    line-height: 30px;
	    white-space: nowrap;
	    text-overflow: ellipsis;
	    font-family:Microsoft YaHei;
	}
	#goodsInfoImage
	{
		position:relative;
		top:50px;
		width:100%;
		margin:0 aut;
		max-height:700px;
	}
	</style>
  </head>
  <body onload="init()">
   			<%
   				if( firstClass.equals("书") )
   				{
   			 %>
   			 <ul class="booksDetailInfo">
   			 	<li>类别：&nbsp;<%=secondClass %></li>
   			 	<li>书名：&nbsp;${productDetail.bookName }</li>
	   			<li>出版社名称：&nbsp;${productDetail.publishName }</li>
	   			<li>出版时间：&nbsp;${productDetail.publishDate }</li>
	   			<li>作者：&nbsp;${productDetail.author }</li>
	   			<li>开本：&nbsp;${productDetail.bookPage }</li>
	   		</ul>
   			 <%
   			 	}
   			 	else if( firstClass.equals("美妆") )
   			 	{
   			  %>
   			  <ul class="goodsDetailInfo">
   			  	<li>类别：&nbsp;<%=secondClass %></li>
   			  	<li>品牌：&nbsp;${productDetail.brank }</li>
   			  	<li>规格类型：&nbsp;${productDetail.cosSize }</li>
	   			<li>月份：&nbsp;${productDetail.cosMonth }</li>
	   			<li>适合肤质：&nbsp;${productDetail.fitSkin }</li>
	   			<li>功效：&nbsp;${productDetail.cosEffect }</li>
	   			<li>保质期：&nbsp;${productDetail.period }</li>
	   			<li>产地：&nbsp;${productDetail.proAddress }</li>
	   		  </ul>
   			  <%
   			  	}
   			  	else if( firstClass.equals("手表") )
   			  	{
   			   %>
   			 <ul class="goodsDetailInfo">
   				<li>类别：&nbsp;<%=secondClass %></li>
	   			<li>品牌：&nbsp;${productDetail.brank }</li>
	   			<li>型号：&nbsp;${productDetail.watchNo }</li>
	   			<li>形状：&nbsp;${productDetail.watchApp }</li>
	   			<li>机芯类型：&nbsp;${productDetail.watchMove }</li>
	   			<li>风格：&nbsp;${productDetail.watchStyle }</li>
	   			<li>品牌产地：&nbsp;${productDetail.watchProduce }</li>
	   			<li>显示方式：&nbsp;${productDetail.watchDisplay }</li>
	   			<li>表带材质：&nbsp;${productDetail.watchStrap }</li>
	   		</ul>
   			<%
   				}
   			%>
   		<img id="goodsInfoImage" alt="goodsInfoImage" src="./<%=image %>">
  </body>
</html>
