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
	#goodsDetailInfo
	{
		position:relative;
		top:20px;
		left:0px;
	}
	#goodsDetailInfo li {
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
  <body>
   		<ul id="goodsDetailInfo">
   			<li>品牌: coolboss/酷宝仕</li>
   			<li>型号: CX119</li>
   			<li>形状: 圆形</li>
   			<li>机芯类型: 电子机芯</li>
   			<li>手表种类: 儿童</li>
   			<li>风格: 运动</li>
   			<li>品牌产地: 国内</li>
   			<li>显示方式: 数字式</li>
   			<li>表带材质: 橡胶</li>
   		</ul>
   		<img id="goodsInfoImage" alt="goodsInfoImage" src="./Images/TB2LKuZpHxmpuFjSZJiXXXauVXa_!!845001562.jpg">
  </body>
</html>
