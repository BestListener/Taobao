<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
  <head>
    <base href="<%=basePath%>">
    <script type="text/javascript" src="./js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="./plugs/classSelect/js/classSelect.js"></script>
	<script type="text/javascript">
		//  鼠标移入确定键
		function mouseOverCon(obj)
		{
			obj.style.backgroundColor = "#EE5F00";
		}
		//  鼠标移出确定键
		function mouseOutCon(obj)
		{
			obj.style.backgroundColor = "#FF7011";
		}
		//  鼠标移入取消键
		function mouseOverCan(obj)
		{
			obj.style.backgroundColor = "#BBBBBB";
		}
		//  鼠标移出取消键
		function mouseOutCan(obj)
		{
			obj.style.backgroundColor = "#D5D5D5";
		}
		//  点击确认按钮
		function checkInfo()
		{
			var inputList = $("#goodsInfoTab").find("input");
			for(var index = 0; index < inputList.length; index++)
			{
				if( inputList[index].value == "" )
				{
					alert("请完整你的商品信息");
					return;
				}
			}
			var option1=$("#firstClass option:selected");
			inputList = null;
			if( option1.val() == "种类" )
			{
				alert("请选择你的商品种类");
				return;
			}
			else if( option1.val() == "书" )
			{
				var inputList = $("#booksInfo").find("input");
			}
			else if( option1.val() == "美妆" )
			{
				var inputList = $("#cosmeticsInfo").find("input");
			}
			else if( option1.val() == "手表" )
			{
				var inputList = $("#watchInfo").find("input");
			}
			for(var index = 0; index < inputList.length; index++)
			{
				if( inputList[index].value == "" )
				{
					alert("请完整你的商品信息");
					return;
				}
			}
			var option2=$("#secondClass option:selected");
			var option3=$("#brank option:selected");
			if( option2.val() == "类别")
			{
				alert("请选择你的商品类别");
				return;
			}
			if( option1.val() != "书" && option3.val() == "品牌")
			{
				alert("请选择你的商品品牌");
				return;
			}
			//  添加成功
			alert("添加成功！");
		}
		//  点击了取消按钮
		function comeback()
		{
			window.location.href = "./users/shopGoodsView.jsp";
		}
	</script>
	<style type="text/css">
	body,input,select
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
	#content
	{
		position:absolute;
		top:40px;
		left:0px;
		width:100%;
	}
	#goodsInfoTab
	{
		position:absolute;
		top:20px;
		left:30px;
		width:90%;
		border-collapse:separate; 
		border-spacing:15px 20px;
	}
	#showImage
	{
		width:150px;
		height:150px;
	}
	.uploadBtn
	{
		position:relative;
		left:36px;
		width:70px;
		z-indent:-1;
	}
	.showImageSrc
	{
		position:relative;
		left:-39px;
		width:70px;
		opacity:0;
	}
	#goodsName
	{
		width:400px;
	}
	#imageInter
	{
		position:relative;
		left:10px;
	}
	#infoImage
	{
		height:130px;
		width:130px;
	}
	.leftTd
	{
		text-indent:70px;
		width:20%;
	}
	.midTd
	{
		width:25%;
	}
	.rightTd
	{
		width:10%;
		text-align:left;
	}
	.selectTd
	{
		width:45%;
	}
	.bottomInfo
	{
		position:absolute;
		top:610px;
		left:30px;
		width:90%;
		height:150px;
		border-top:#CCCCCC solid 1px;
		display:none;
	}
	.goodsDetailInfo
	{
		position:relative;
		top:20px;
		left:45px;
		list-style-type:none;
		list-style:none;
		margin:0px;
 		padding:0px;
	}
	.goodsDetailInfo li {
	    display: inline;
	    float: left;
	    width: 256px;
	    height: 30px;
	    margin-right: 20px;
	    overflow: hidden;
	    text-align: right;
	    line-height: 30px;
	    white-space: nowrap;
	    text-overflow: ellipsis;
	    font-family:Microsoft YaHei;
	}
	.booksDetailInfo
	{
		position:relative;
		top:20px;
		left:-75px;
		list-style-type:none;
		list-style:none;
		margin:0px;
 		padding:0px;
	}
	.booksDetailInfo li {
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
	#watchInfo
	{
		display:none;
	}
	#cosmeticsInfo
	{
		display:none;
	}
	.nameInput
	{
		width:200px;
	}
	#confirmAdd,#cancel
	{
		position:absolute;
		top:780px;
		left:500px;
		width:100px;
		height:31px;
		background-color:#D5D5D5;
		text-align:center;
		padding-top:7px;
		color:gray;
		font-size:16px;
		font-family:Microsoft YaHei;
		-moz-border-radius: 2px;
    	-webkit-border-radius: 2px;
    	border-radius: 2px;
    	cursor:pointer;
	}
	#confirmAdd
	{
		left:250px;
		color:white;
		background-color:#FF7011;
	}
	</style>
  </head>
  
  <body>
   	<div id="title">添加商品</div>
   		<div id="content">
   			<form action="" method="post" enctype="multipart/form-data">
   			<table id="goodsInfoTab">
   				<tr>
   					<td class="leftTd">封面图:</td>
   					<td class="midTd">
   						<img id="showImage" alt="封面图" src="./users/pics/photos.png">
   					</td>
				</tr>
   				<tr>
   					<td></td>
   					<td class="midTd">
   				   		<input id="upload" type="button" class="uploadBtn" value="上传图片">
   						<input id="showImageSrc" name="showImageSrc" class="showImageSrc" type="file" accept="image/gif,image/jpeg,image/jpg,image/png,image/svg" maxlength="80">
   					</td>
   				</tr>		
   				<tr>
   					<td class="leftTd">商品名:</td>
   					<td  class="midTd" colspan="3">
   					<input id="goodsName" name="goodsName" type="text" maxlength="20">
   					</td>
   				</tr>
   				<tr>
   					<td class="leftTd">商品价格:</td>
   					<td class="midTd">
   					<input id="goodsPrice" name="goodsPrice" type="text" maxlength="10">
   					</td>
   					<td class="rightTd">商品分类:</td>
   					<td class="selectTd">
	   					<select id="firstClass" name="firstClass"></select>
	   					<select id="secondClass" name="secondClass"></select>
	   					<select id="brank" name="brank"></select>
   					</td>
   				</tr>
   				<script>
					$(document).ready(function(){
					    var pHtmlStr = '';
					    pHtmlStr = pHtmlStr + '<option value='+"种类"+'>'+"种类"+'</option>';
					    for(var name in goodsclass){  
					        pHtmlStr = pHtmlStr + '<option value='+name+'>'+name+'</option>';  
					    }
					    $("#firstClass").html(pHtmlStr);
					    $("#firstClass").change(function(){  
					        var pname = $("#firstClass option:selected").text();  
					        var pHtmlStr = '';
					        if( pname == "种类" )
					        {
					        	$("#cosmeticsInfo").css({'display':'none'});
					        	$("#watchInfo").css({'display':'none'});
					        	$("#booksInfo").css({'display':'none'});
					        }
					        else if( pname == "书" )
					        {
					        	$("#brank").css({'display':'none'});
					        	$("#cosmeticsInfo").css({'display':'none'});
					        	$("#watchInfo").css({'display':'none'});
					        	$("#booksInfo").css({'display':'block'});
					        	var classList = goodsclass[pname];
					            for(var index in classList){  
					                pHtmlStr = pHtmlStr + '<option value='+classList[index]+'>'+classList[index]+'</option>';  
					            }  
					            $("#secondClass").html(pHtmlStr);
					        }
					        else
					        {
					        	$("#booksInfo").css({'display':'none'});
					        	if( pname == "美妆" )
					        	{
					        		$("#cosmeticsInfo").css({'display':'block'});
					            	$("#watchInfo").css({'display':'none'});
					        	}else if( pname == "手表" )
					        	{
					        		$("#cosmeticsInfo").css({'display':'none'});
					            	$("#watchInfo").css({'display':'block'});
					        	}
					        	$("#brank").css({'display':'block'});
					        	var classList = goodsclass[pname];
					            for(var index in classList){  
					                pHtmlStr = pHtmlStr + '<option value='+classList[index]+'>'+classList[index]+'</option>';  
					            }  
					            $("#secondClass").html(pHtmlStr);
					            var pHtmlStr = '';
					            var brankList = brank[pname];
					            for(var index in brankList){  
					                pHtmlStr = pHtmlStr + '<option value='+brankList[index]+'>'+brankList[index]+'</option>';  
					            }  
					            $("#brank").html(pHtmlStr);
					        }
					    });
					    $("#firstClass").change();
					 });
				</script>
   				<tr>
   					<td class="leftTd">库存:</td>
   					<td class="midTd"><input id="goodsNum" name="goodsNum" type="text" maxlength="6"></td>
   				</tr>
   				<tr>
   					<td class="leftTd">详细图片:</td>
   					<td class="midTd">
   						<img id="imageInter" alt="详细图片" src="./users/pics/photos.png">
   					</td>
   					<td class="rightTd">介绍图片:</td>
   					<td>
   						<img id="infoImage" alt="介绍图片" src="./users/pics/photos.png">
   					</td>
				</tr>
   				<tr>
   					<td></td>
   					<td class="midTd">
   				   		<input id="upload" type="button" class="uploadBtn" value="上传图片">
   						<input id="interImageSrc" name="interImageSrc" class="showImageSrc" type="file" accept="image/gif,image/jpeg,image/jpg,image/png,image/svg" maxlength="80">
   					</td>
   					<td></td>
   					<td>
   				   		<input id="upload" type="button" class="uploadBtn" value="上传图片">
   						<input id="interImageSrc" name="interImageSrc" class="showImageSrc" type="file" accept="image/gif,image/jpeg,image/jpg,image/png,image/svg" maxlength="80">
   					</td>
   				</tr>
   			</table>
   			<div id="booksInfo" class="bottomInfo">
   				<ul class="booksDetailInfo">
		   			<li>书名：<input name="bookName" type="text"/></li>
		   			<li>出版社名称：<input name="publishName" type="text"/></li>
		   			<li>出版时间：<input name="publishDate" type="text"/></li>
		   			<li>作者：<input name="author" type="text"/></li>
		   			<li>开本：<input name="bookPage" type="text"/></li>
		   		</ul>
   			</div>
   			<div id="cosmeticsInfo" class="bottomInfo">
   				<ul class="goodsDetailInfo">
		   			<li>规格类型：<input name="cosSize" type="text"/></li>
		   			<li>月份：<input name="cosMonth" type="text"/></li>
		   			<li>适合肤质：<input name="fitSkin" type="text"/></li>
		   			<li>功效：<input name="cosEffect" type="text"/></li>
		   			<li>保质期：<input name="period" type="text"/></li>
		   			<li>产地：<input name="proAddress" type="text"/></li>
		   		</ul>
   			</div>
   			<div id="watchInfo" class="bottomInfo">
   				<ul class="goodsDetailInfo">
		   			<li>型号：<input name="watchNo" type="text"/></li>
		   			<li>形状：<input name="watchApp" type="text"/></li>
		   			<li>机芯类型：<input name="watchMove" type="text"/></li>
		   			<li>风格：<input name="watchStyle" type="text"/></li>
		   			<li>品牌产地：<input name="watchProduce" type="text"/></li>
		   			<li>显示方式：<input name="watchDisplay" type="text"/></li>
		   			<li>表带材质：<input name="watchStrap" type="text"/></li>
		   		</ul>
   			</div>
   			<div id="confirmAdd" onclick="checkInfo()" onmouseover="mouseOverCon(this)" onmouseout="mouseOutCon(this)">确定</div>
   			<div id="cancel" onclick="comeback()" onmouseover="mouseOverCan(this)" onmouseout="mouseOutCan(this)">取消</div>
   			</form>
   		</div>
  </body>
</html>
