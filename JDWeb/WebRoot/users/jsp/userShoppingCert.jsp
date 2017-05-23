<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="cn.edu.zhku.she.Model.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.setCharacterEncoding("utf-8");
List sc = null;
sc = (List)request.getAttribute("sc");
%>

<html>
  <head>
    <base href="<%=basePath%>">
    <link rel="stylesheet" type="text/css" href="./users/css/shoppingCart.css">
    <script type="text/javascript" src="./js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="./users/js/shoppingCart.js"></script>
  </head>
  
  <body>
   	<div id="title">我的购物车</div>
   		<div id="content">
   			<div id="countSum">
   				<label id="countSumTip">合计:</label>
   				<label id="countSumNum">0.00</label>
   				<div id="top_set_account">结算</div>
   			</div>
   			<ul id="orderData">
   				<li class="firstLi">
   					<input id="topAllSelect" type="checkbox" name="top_all_sel" onclick="checkAll(this)">
   					<label id="topCountTip">全选</label>
   					<label id="shopInfoTil">宝贝信息</label>
   					<label id="shopNameTil">店铺</label>
   					<label id="unit-price">单价</label>
   					<label id="buyNum">数量</label>
   					<label id="moneySum">金额</label>
   					<label id="operation">操作</label>
   				</li>
   			<%
   				if( !sc.isEmpty() )
   				{
   					for(int i = 0; i < sc.size(); i++ )
   					{
	   					Map data = new HashMap();
						data = (HashMap)sc.get(i);
   			 %>
   				<li id=<%=data.get("scid") %> class="unit_goods">
   					<label id="shop<%=data.get("scid") %>" style="display:none"><%=data.get("sid") %></label>
   					<label id="p<%=data.get("scid") %>" style="display:none"><%=data.get("pid") %></label>
   					<input class="goodsSelect" type="checkbox" name="good_checkbox" onclick="selectThis(this)" value=<%=data.get("scid") %>>
   					<img id=<%=data.get("scid") %> onclick="browse(<%=data.get("pid") %>)" class="goodsPics" alt="goodsPic" src="./<%=data.get("bigImg") %>">
   					<a id="name<%=data.get("scid") %>" onclick="browse(<%=data.get("pid") %>)" class="goodsName"><%=data.get("name") %></a>
   					<label class="shopName"><%=data.get("shopname") %></label>
   					<label id="un<%=data.get("scid") %>" class="unit_price_num">￥<%=data.get("price") %></label>
   					<div id="s<%=data.get("scid") %>" class="sub" onclick="subGoodsNum(this)">-</div>
   					<input id="i<%=data.get("scid") %>" class="numInput" onkeyup="checkInput(this)" type="text" value=<%=data.get("wBuyNum") %> maxlength="2"/>
   					<div id="a<%=data.get("scid") %>" class="add" onclick="addGoodsNum(this)">+</div>
   					<label id="ma<%=data.get("scid") %>" class="moneyAmount">￥<%=data.get("payAmount") %></label>
   					<label class="delete" onclick="clickDelete(this)">删除</label>
   				</li>
   			<% 
   					}
   				}
   				else
   				{
   			%>
   				<li class="tipTr">
   					<label id="Tip">您暂时没有选购过任何物品。</label>
   				</li>
   			<% 
   				}
   			%>
   			</ul>
   			<div id="bottomCount">
   				<input id="btmAllSelect" type="checkbox" name="btm_all_sel" onclick="checkAll(this)">
   				<label id="btmCountTip">全选</label>
   				<label id="btmGoodsLab">已选商品&nbsp;<label id="goodsNum">0</label>&nbsp;件</label>
   				<label id="btm_cSumNum">合计:</label>
   				<label id="btm_SumNum">0.00</label>
   				<div id="btm_set_account" onclick="settlement()">结算</div>
   			</div>
   		</div>
  </body>
</html>
