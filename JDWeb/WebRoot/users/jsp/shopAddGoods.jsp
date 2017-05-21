<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
  <head>
    <base href="<%=basePath%>">
    <link rel="stylesheet" type="text/css" href="./users/css/GoodsView.css">
    <script type="text/javascript" src="./js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="./plugs/classSelect/js/classSelect.js"></script>
    <script type="text/javascript" src="./users/js/GoodsView.js"></script>
    <script type="text/javascript">
    	function init()
    	{
    		var msg = "${msg}";
    		if( msg != "" )
    			alert(msg);
    	}
    </script>
  </head>
  
  <body onload="init()">
   	<div id="title">添加商品</div>
   		<div id="content">
   			<form id="productData" action="./servlet/addProduct" method="get" enctype="multipart/form-data">
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
   						<input id="showImageSrc" name="showImageSrc" onchange="updateShowPic()" class="showImageSrc" type="file" accept="image/gif,image/jpeg,image/jpg,image/png,image/svg" maxlength="80">
   						<input id="saveShowImage" name="saveShowImage" type="text" style="display:none">
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
   						<img id="imageInter" name="imageInter" alt="详细图片" src="./users/pics/photos.png">
   					</td>
   					<td class="rightTd">介绍图片:</td>
   					<td>
   						<img id="infoImage" name="infoImage" alt="介绍图片" src="./users/pics/photos.png">
   					</td>
				</tr>
   				<tr>
   					<td></td>
   					<td class="midTd">
   				   		<input id="upload" type="button" class="uploadBtn" value="上传图片">
   						<input id="interImageSrc" name="interImageSrc" onchange="updateInterPic()" class="showImageSrc" type="file" accept="image/gif,image/jpeg,image/jpg,image/png,image/svg" maxlength="80">
   						<input id="saveInterImage" name="saveInterImage"  type="text" style="display:none">
   					</td>
   					<td></td>
   					<td>
   				   		<input id="upload" type="button" class="uploadBtn" value="上传图片">
   						<input id="infoImageSrc" name="infoImageSrc" onchange="updateInfoPic()" class="showImageSrc" type="file" accept="image/gif,image/jpeg,image/jpg,image/png,image/svg" maxlength="80">
   						<input id="saveInfoImage" name="saveInfoImage"  type="text" style="display:none">
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
