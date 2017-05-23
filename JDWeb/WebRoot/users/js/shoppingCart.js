		var setAmountFlag = 0;
		//  ajax更新数据库
  		function updateDataBase(obj,id,amount)
  		{
  			(function($){
				$.ajax({  
	               type:"get",//请求方式  
	               url:"./servlet/updateShoppingCartNum?num="+obj+"&id="+id+"&payAmount="+amount,//发送请求地址  
	               timeout:30000,//超时时间：30秒  
	               dataType:"text",//设置返回数据的格式  
	               //请求成功后的回调函数 data为text格式  
	               success:function(data){
	              },
	              error:function(){  
	                  alert("服务器出错，请重试！");
	              }
	            });	
			})(jQuery);
  		}
		//  点击加1
  		function addGoodsNum(obj)
  		{		
			var id = obj.parentNode.id;
			var subid = "s" + id;
			var inputid = "i" + id;
			var unId = "un" + id;
			var maId = "ma" + id;
			var subBtn = document.getElementById(subid);
			var input = document.getElementById(inputid);
			var unit_Num = document.getElementById(unId);
			var money_Acc = document.getElementById(maId);
			var uNum = unit_Num.innerText.substring(1,unit_Num.length);
			var amount = money_Acc.innerText.substring(1,money_Acc.length);
			amount = parseFloat(amount);
			uNum = parseFloat(uNum);
			var value = parseInt(input.value);
			if( value < 99 )
			{	
				value = value + 1;
				input.value = value;
				amount = returnFloat(uNum * value);
				money_Acc.innerText = "￥"+amount;
				getSum();
  				updateDataBase(input.value,id,amount);
			}
  			if( value > 1 )
  			{
  				subBtn.style.cursor = "pointer";
  				subBtn.style.color = "black";
  			}
  		}
  		//  点击减1
  		function subGoodsNum(obj)
  		{
  			var id = obj.parentNode.id;
			var subid = "s" + id;
			var inputid = "i" + id;
			var unId = "un" + id;
			var maId = "ma" + id;
			var subBtn = document.getElementById(subid);
			var input = document.getElementById(inputid);
			var value = parseInt(input.value);
			var unit_Num = document.getElementById(unId);
			var money_Acc = document.getElementById(maId);
			var uNum = unit_Num.innerText.substring(1,unit_Num.length);
			var amount = money_Acc.innerText.substring(1,money_Acc.length);
			amount = parseFloat(amount);
			uNum = parseFloat(uNum);
  			if( value > 1 )
  			{
  				value = value - 1;
  				input.value = value;
  				amount = returnFloat(uNum * value);
				money_Acc.innerText = "￥"+amount;
				getSum();
  				updateDataBase(input.value,id,amount);
  			} 
  			if( value == 1 )
  			{
  				subBtn.style.cursor = "default";
  				subBtn.style.color = "#CCCCCC";
  			}
  		}
  		//  检查用户输入的数额
  		function checkInput(obj)
  		{
  			var id = obj.parentNode.id;
			var subid = "s" + id;
			var addtid = "a" + id;
			var subBtn = document.getElementById(subid);
			var addBtn = document.getElementById(addtid);
  			//  如果输入的不是数字
  			if( event.keyCode < 48 || event.keyCode > 57 )
  			{
  				obj.value = "1";
  				goodsBuyNum = obj.value;
  			}
  			//  如果输入的是数字
  			if( obj.value == 99 )
  			{
  				addBtn.style.cursor = "default";
  				addBtn.style.color = "#CCCCCC";
  			}
  			if( obj.value == 1 )
  			{
  				subBtn.style.cursor = "default";
  				subBtn.style.color = "#CCCCCC";
  			}
  			if( obj.value > 1 )
  			{
  				subBtn.style.cursor = "pointer";
  				subBtn.style.color = "black";
  			}
  			if( obj.value < 99 )
			{
  				addBtn.style.cursor = "pointer";
  				addBtn.style.color = "black";
  			}
  		}
  		//   删除商品
  		function clickDelete(obj)
  		{
  			var id = obj.parentNode.id;
  			var nameLab = document.getElementById("name"+id);
  			if( window.confirm("您确定要删除 "+nameLab.innerText+" 商品么？") )
  			{
  				//  异步删除
  				(function($){
					$.ajax({  
		               type:"get",//请求方式  
		               url:"./servlet/deleteGoodsFromSC?scid="+id,//发送请求地址  
		               timeout:30000,//超时时间：30秒  
		               dataType:"text",//设置返回数据的格式  
		               //请求成功后的回调函数 data为text格式  
		               success:function(data){
		               		if( data == "true" )
		               		{
		               			//  调用父页面方法更新顶部信息
		               			window.parent.initHeader();
		               			//  删除该行元素
		               			var delobj = document.getElementById(id);
								delobj.parentNode.removeChild(delobj);
		               			alert("删除成功！");
		               		}
		               		else if( data == "false" )
		               		{
		               			alert("删除失败，请稍后重试！");
		               		}
		              },
		              error:function(){  
		                  alert("服务器出错，请重试！");
		              }
		            });	
				})(jQuery);
  			}
  		}
  		//   保留一位小数
  		function returnFloat(value)
  		{
		 	var value=Math.round(parseFloat(value)*100)/100;
		 	var xsd=value.toString().split(".");
		    if(xsd.length==1){
		 		value=value.toString()+".0";
			}
			return value;
		}
		//   保留两位小数
  		function returnFloat2(value)
  		{
		 	var value=Math.round(parseFloat(value)*100)/100;
		 	var xsd=value.toString().split(".");
		    if(xsd.length == 1){
		 		value=value.toString()+".00";
			}
			else if(xsd[1].length < 2)
			{
				value=value.toString()+"0";
			}
			return value;
		}
		//  求选中个数
		function getGoodsSum()
		{
			var sum = 0;
			var goods = document.getElementsByName("good_checkbox");
			for(var i = 0;i < goods.length; i++)
			{
				if( goods[i].checked )
				{
					sum = sum + 1;
				}
			}
			document.getElementById("goodsNum").innerText = sum;
		}
		//  求总价
		function getSum()
		{
			var sum = 0;
			var goods = document.getElementsByName("good_checkbox");
			for(var i = 0;i < goods.length; i++)
			{
				if( goods[i].checked )
				{
					var id = goods[i].value;
					var maId = "ma" + id;
					var money_Acc = document.getElementById(maId);
					var amount = money_Acc.innerText.substring(1,money_Acc.length);
					amount = parseFloat(amount);
					sum = sum + amount;
				}
			}
			sum = returnFloat2(sum);
			document.getElementById("countSumNum").innerText = sum;
			document.getElementById("btm_SumNum").innerText = sum;
		}
		//  判断是否选中物品并显示结算
		function checkSelect()
		{
			setAmountFlag = 0;
			var top = document.getElementById("top_set_account");
			var btm = document.getElementById("btm_set_account");
			var goods = document.getElementsByName("good_checkbox");
			for(var i = 0;i < goods.length; i++)
			{
				if( goods[i].checked )
				{
					
					top.style.backgroundColor = "#FF4400";
					btm.style.backgroundColor = "#FF4400";
					top.style.cursor = "pointer";
					btm.style.cursor = "pointer";
					setAmountFlag = 1;
					return;
				}
			}
			top.style.backgroundColor = "#AAAAAA";
			btm.style.backgroundColor = "#AAAAAA";
			top.style.cursor = "default";
			btm.style.cursor = "default";
		}
		//  全选
		function checkAll(obj)
		{
			var topsel = document.getElementsByName("top_all_sel");
			var btmsel = document.getElementsByName("btm_all_sel");
			var goods = document.getElementsByName("good_checkbox");
			var flag = obj.checked;
			topsel[0].checked = flag;
			btmsel[0].checked = flag;
			for(var i = 0;i < goods.length; i++)
			{
				goods[i].checked = flag;
				if( flag == false )
					setAmountFlag = 0;
			}
			getSum();
			getGoodsSum();
			checkSelect();
		}
		//  选中此物品
		function selectThis(obj)
		{
			if( !obj.checked )
			{
				var topsel = document.getElementsByName("top_all_sel");
				var btmsel = document.getElementsByName("btm_all_sel");
				topsel[0].checked = false;
				btmsel[0].checked = false;
			}
			getSum();
			getGoodsSum();
			checkSelect();
		}
		//  前往查看物品
		function browse(obj)
		{
			window.open("./servlet/browseGoods?pid="+obj);
		}
		//  结算购物车
		function settlement()
		{
			checkSelect();
			if( setAmountFlag == 1 )
			{
				if( window.confirm("确定要购买当前选中产品么？")  )
				{
					var datas = {orders:[]};
					var checkbox = document.getElementsByName("good_checkbox"); 
					for(var i =0;i<checkbox.length;i++)
					{
						if( checkbox[i].checked )
						{
							var scid = checkbox[i].value;
							var pid = document.getElementById("p"+scid).innerText;
							var sid = document.getElementById("shop"+scid).innerText;
							var num = document.getElementById("i"+scid).value;
							var payAmount = document.getElementById("ma"+scid).innerText;
							payAmount = payAmount.replace("￥","");
							var row = {scid:scid,
									   pid:pid,
									   sid:sid,
									   number:num,
									   payAmount:payAmount
									  };
							datas.orders.push(row);
						}
					}
					var jsondata = JSON.stringify(datas);
					//  异步处理订单信息
					$.ajax({
		                  type: "post",
		                  url: "./servlet/placeOrderFromSC",//页面地址和传递的URL参数                     
		                  contentType: "application/json; charset=UTF-8",
		                  dataType: "json",
		                  data: jsondata,
		                  success: function(data){
		                  		if( data.flag == "true" )
		                  		{
		                  			//  调用父页面方法更新顶部信息
		               				window.parent.initHeader();
		               				alert("购买成功，请等待店家发货。");
		                  			window.location.reload();
		                  		}
		                  		else if( data.flag == "false" )
		                  		{
		                  			alert("购买失败，请稍后重试。");
		                  		}
		                  },
		                 //请求出错的处理  
			              error:function(){  
			                   alert("请求出错");  
			              }  
		            });
				}
			}		
		}