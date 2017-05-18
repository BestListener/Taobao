<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
  <head>
    <base href="<%=basePath%>">
    <script type="text/javascript" src="./js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="./plugs/citySelect/js/cityselect.js"></script>
	<script type="text/javascript">
		//  检查表单数据
		function checkInfo()
		{
				//  验证手机
			var Expression = /^1[34578]\d{9}$/;
			var TelExp = new RegExp(Expression);
			var phoneNum = document.getElementById("phoneNum");
			if( phoneNum.value == "" || !TelExp.test(phoneNum.value) )
			{
				phoneNum.focus();
				phoneNum.style.outlineColor = "red";
			}
			else
			{
				//  验证成功
			}
		}
		//  边框恢复
		function changeBorderColor(obj)
		{
			obj.style.outlineColor = "blue";
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
	#userInfoTab
	{
		position:absolute;
		top:20px;
		left:30px;
		width:80%;
		border-collapse:separate; 
		border-spacing:15px 20px;
	}
	#userInfoTab tr td img
	{
		width:100px;
		height:100px;
	}
	#upload
	{
		position:relative;
		left:18px;
		width:70px;
		z-indent:-1;
	}
	#userImageSrc
	{
		position:relative;
		left:-56px;
		width:70px;
		opacity:0;
	}
	#address
	{
		width:200px;
	}
	#save
	{
		position:relative;
		left:18px;
		width:70px;
		cursor:pointer;
	}
	</style>
  </head>
  
  <body>
   		<div id="title">个人资料管理</div>
   		<div id="content">
   			<form action="" method="post" enctype="multipart/form-data">
   			<table id="userInfoTab">
   				<tr>
   					<td>当前头像:</td>
   					<td>
   						<img id="userImage" alt="用户头像" src="./Images/profle.png">
   					</td>
				</tr>
   				<tr>
   					<td></td>
   					<td>
   				   		<input id="upload" type="button" value="上传图片">
   						<input id="userImageSrc" name="userImageSrc" type="file" accept="image/gif,image/jpeg,image/jpg,image/png,image/svg" maxlength="80">
   					</td>
   				</tr>		
   				<tr>
   					<td>昵称:</td>
   					<td><input id="subName" name="subName" type="text" maxlength="10"></td>
   				</tr>
   				<tr>
   					<td>真实姓名:</td>
   					<td><input id="trueName" name="subName" type="text" maxlength="10"></td>
   				</tr>
   				<tr>
   					<td>性别:</td>
   					<td><input id="man" name="sex" type="radio" value="0" checked>男
   					<input id="woman" name="sex" type="radio" value="1">女</td>
   				</tr>
   				<tr>
   					<td>生日:</td>
   					<td><select id="Year" name="Year">
                                <option selected="selected">年</option>
                                <option value="1940">1940</option>
                                <option value="1941">1941</option>
                                <option value="1942">1942</option>
                                <option value="1943">1943</option>
                                <option value="1944">1944</option>
                                <option value="1945">1945</option>
                                <option value="1946">1946</option>
                                <option value="1947">1947</option>
                                <option value="1948">1948</option>
                                <option value="1949">1949</option>
                                <option value="1950">1950</option>
                                <option value="1951">1951</option>
                                <option value="1952">1952</option>
                                <option value="1953">1953</option>
                                <option value="1954">1954</option>
                                <option value="1955">1955</option>
                                <option value="1956">1956</option>
                                <option value="1957">1957</option>
                                <option value="1958">1958</option>
                                <option value="1959">1959</option>
                                <option value="1960">1960</option>
                                <option value="1961">1961</option>
                                <option value="1962">1962</option>
                                <option value="1963">1963</option>
                                <option value="1964">1964</option>
                                <option value="1965">1965</option>
                                <option value="1966">1966</option>
                                <option value="1967">1967</option>
                                <option value="1968">1968</option>
                                <option value="1969">1969</option>
                                <option value="1970">1970</option>
                                <option value="1971">1971</option>
                                <option value="1972">1972</option>
                                <option value="1973">1973</option>
                                <option value="1974">1974</option>
                                <option value="1975">1975</option>
                                <option value="1976">1976</option>
                                <option value="1977">1977</option>
                                <option value="1978">1978</option>
                                <option value="1979">1979</option>
                                <option value="1980">1980</option>
                                <option value="1981">1981</option>
                                <option value="1982">1982</option>
                                <option value="1983">1983</option>
                                <option value="1984">1984</option>
                                <option value="1985">1985</option>
                                <option value="1986">1986</option>
                                <option value="1987">1987</option>
                                <option value="1988">1988</option>
                                <option value="1989">1989</option>
                                <option value="1990">1990</option>
                                <option value="1991">1991</option>
                                <option value="1992">1992</option>
                                <option value="1993">1993</option>
                                <option value="1994">1994</option>
                                <option value="1995">1995</option>
                                <option value="1996">1996</option>
                                <option value="1997">1997</option>
                                <option value="1998">1998</option>
                                <option value="1999">1999</option>
                                <option value="2000">2000</option>
                                <option value="2001">2001</option>
                                <option value="2002">2002</option>
                                <option value="2003">2003</option>
                                <option value="2004">2004</option>
                                <option value="2005">2005</option>
                                <option value="2006">2006</option>
                                <option value="2007">2007</option>
                                <option value="2008">2008</option>
                                <option value="2009">2009</option>
                                <option value="2010">2010</option>
                                <option value="2011">2011</option>
                                <option value="2012">2012</option>
                                <option value="2013">2013</option>
                                <option value="2014">2014</option>
                                <option value="2015">2015</option>
                                <option value="2016">2016</option>
                                <option value="2017">2017</option>
                        </select>
                        
						<select id="Month" name="Month">
                                <option selected="selected">月</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>
                                <option value="8">8</option>
                                <option value="9">9</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                        </select>
                        
						<select id="Date" name="Date">
                                <option selected="selected">日</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>
                                <option value="8">8</option>
                                <option value="9">9</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                                <option value="13">13</option>
                                <option value="14">14</option>
                                <option value="15">15</option>
                                <option value="16">16</option>
                                <option value="17">17</option>
                                <option value="18">18</option>
                                <option value="19">19</option>
                                <option value="20">20</option>
                                <option value="21">21</option>
                                <option value="22">22</option>
                                <option value="23">23</option>
                                <option value="24">24</option>
                                <option value="25">25</option>
                                <option value="26">26</option>
                                <option value="27">27</option>
                                <option value="28">28</option>
                                <option value="29">29</option>
                                <option value="30">30</option>
                                <option value="31">31</option>
                        </select>
					</td>
   				</tr>
   				<tr>
   					<td>手机号码:</td>
   					<td><input id="phoneNum" name="phoneNum" onfocus="changeBorderColor(this)" placeholder="手机号码不能为空" type="text" maxlength="11"></td>
   				</tr>
   				<tr>
   					<td>收货地址:</td>
   					<td><select id="province" name="province"></select>  
						<select id="city" name="city"></select>
						<input id="address" name="address" type="text" placeholder="街道小区门牌" maxlength="20">
					</td>
   				</tr>
   				<script>
   				$(document).ready(function(){
			        var pHtmlStr = '';  
			        for(var name in pc){  
			            pHtmlStr = pHtmlStr + '<option>'+name+'</option>';  
			        }  
			        $("#province").html(pHtmlStr);  
			        $("#province").change(function(){  
			            var pname = $("#province option:selected").text();  
			            var pHtmlStr = '';
			            var cityList = pc[pname];  
			            for(var index in cityList){  
			                pHtmlStr = pHtmlStr + '<option>'+cityList[index]+'</option>';  
			            }  
			            $("#city").html(pHtmlStr);  
			        });  
			        $("#province").change();  
			     });
				</script>
   				<tr>
   					<td></td>
   					<td><input id="save" type="button" onclick="checkInfo()" value="保存"></td>
   				</tr>
   			</table>
   			</form>
   		</div>
  </body>
</html>
