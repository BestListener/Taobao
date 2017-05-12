<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
  <head>
    <base href="<%=basePath%>">
	<script type="text/javascript">
	
	</script>
	<style type="text/css">
	body
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
	</style>
  </head>
  
  <body>
   		<div id="title">个人资料管理</div>
   		<div id="content">
   			
   		</div>
  </body>
</html>
