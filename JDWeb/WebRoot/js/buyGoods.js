		//  鼠标选中图像
  		function selectImage(obj)
  		{
  			var bigPic = document.getElementById("bigPic");
  			var curPic = document.getElementById(curSelectPic);
  			curPic.style.borderColor = "white";
  			curSelectPic = obj.id;
  			obj.style.borderColor = "#EE5F00";
  			bigPic.src = obj.src;
  			//  图片放大镜
			$(document).ready(function(){
				$('#bigPicZoom').zoom();
			});
  		}
		//  鼠标移入立即购买按键
  		function inBuyBtn(obj)
  		{
  			obj.style.backgroundColor = "#FFBBFF";
  		}
  		//  鼠标移出立即购买按键
  		function outBuyBtn(obj)
  		{
  			obj.style.backgroundColor = "#FFEEFF";
  		}
  		//  鼠标移入加入购物车按键
  		function inAddBtn(obj)
  		{
  			obj.style.backgroundColor = "#DD2C00";
  		}
  		//  鼠标移出加入购物车按键
  		function outAddBtn(obj)
  		{
  			obj.style.backgroundColor = "#FF3300";
  		}
  		//  选中商品信息
  		function onClickBtn(obj)
  		{
  			if( obj.id != curSelectBtn )
  			{
  				var curSelect = document.getElementById(curSelectBtn);
  				curSelect.style.borderTop = "none";
  				curSelect.style.borderBottom = "none";
  				curSelect.style.color = "black";
  				curSelect.style.backgroundColor = "#EEEEEE";
  				obj.style.borderTop = "#FF4111 solid 2px";
  				obj.style.borderBottom = "white solid 1px";
  				obj.style.color = "#FF4111";
  				obj.style.backgroundColor = "white";
  				curSelectBtn = obj.id;
  			}
  		}
  		//  点击加1
  		function addGoodsNum(obj)
  		{
  			if( goodsBuyNum < goodsSaveNum && goodsBuyNum < 99 )
  			{
  				goodsBuyNum = goodsBuyNum + 1;
  				$('#goodsNum').val(goodsBuyNum);
  				if( goodsBuyNum >= goodsSaveNum )
  				{
  					$('#addOne').css({'cursor':'default'});
  					$('#addOne').css({'color':'#CCCCCC'});
  				}
  			}
  			if( goodsBuyNum > 1 )
  			{
  				$('#subOne').css({'cursor':'pointer'});
  				$('#subOne').css({'color':'black'});
  			}
  		}
  		//  点击减1
  		function subGoodsNum(obj)
  		{
  			if( goodsBuyNum > 1 )
  			{
  				goodsBuyNum = goodsBuyNum - 1;
  				$('#goodsNum').val(goodsBuyNum);
  				if( goodsBuyNum <= 1 )
  				{
  					$('#subOne').css({'cursor':'default'});
  					$('#subOne').css({'color':'#CCCCCC'});
  				}
  			}			
  			if( goodsBuyNum < goodsSaveNum )
  			{
  				$('#addOne').css({'cursor':'pointer'});
  				$('#addOne').css({'color':'black'});
  			}
  		}
  		//  检查用户输入的数额
  		function checkInput(obj)
  		{
  			//  如果输入的不是数字
  			if( event.keyCode < 48 || event.keyCode > 57 )
  			{
  				if( event.keyCode != 8 )
  				{
  					obj.value = "1";
  					goodsBuyNum = obj.value;
  				}
  			}
  			//  如果输入的是数字
  			if( obj.value > goodsSaveNum )
  			{
  				obj.value = goodsSaveNum;
  				goodsBuyNum = obj.value;
  			}
  			if( obj.value == goodsSaveNum )
  			{
  				$('#addOne').css({'cursor':'default'});
  				$('#addOne').css({'color':'#CCCCCC'});
  			}
  			if( obj.value == 1 )
  			{
  				$('#subOne').css({'cursor':'default'});
  				$('#subOne').css({'color':'#CCCCCC'});
  			}
  			if( obj.value > 1 )
  			{
  				$('#subOne').css({'cursor':'pointer'});
  				$('#subOne').css({'color':'black'});
  			}
  			if( obj.value < goodsSaveNum )
			{
  				$('#addOne').css({'cursor':'pointer'});
  				$('#addOne').css({'color':'black'});
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
  		//  用户点击立即购买
  		function buyRightNow()
  		{
  			var val = getValue("mycookie");
  			//  用户未登录
  			if( val == null )
  			{
  				// 提醒用户登录
  				window.open("./userLogin.html");
  			}
  			else //  用户已登录 
  			{
  				var uid = val[0];
				//  获取购买数
				var buyNum = document.getElementById("goodsNum").value;
				var payAmount = parseFloat(price) * parseInt(buyNum);
				payAmount = payAmount.toFixed(2);
				if( window.confirm("需要支付  ￥ "+payAmount+" 金额，确定要购买吗？") )
				{
				//  异步处理后台下单
 				(function($){
					$.ajax({  
		              	type:"get",
						url:"./servlet/placeOrder?uid="+uid+"&pid="+pid+"&sid="+sid+"&amount="+buyNum+"&payAmount="+payAmount,
						dataType:"text",
						success:function(data){
							if( data == "true" )
							{
 								alert("购买成功，请等待店家发货！");
							}
							else if( data == "false" )
							{
								alert("购买失败，可能是余额不足！");
							}
							else{
								alert(data);
							}
						},
						error:function(){
		                  alert("服务器出错，请重试！");
		             	}
		            });	
				})(jQuery);
				}
  			}
  		}
  		//  用户点击加入购物车
  		function addToMyShoppingCart()
  		{
  			var val = getValue("mycookie");
  			//  用户未登录
  			if( val == null )
  			{
  				// 提醒用户登录
  				window.open("./userLogin.html");
  			}
  			else //  用户已登录 
  			{
  				var uid = val[0];  //  获取cookie中的uid值
  				var num = parseInt(val[3]);  //  获取cookie中的购物车物品数
  				if( num == 5 )
  				{
  					alert("加入失败，你的购物车已满，请先购买部分商品!");
  					return;
  				}
  				else{
  					//  获取购买数
  					var buyNum = document.getElementById("goodsNum").value;
  					//  异步加入商品到用户购物车
  					(function($){
						$.ajax({  
			              	type:"get",
							url:"./servlet/addToMyShoppingCart?uid="+uid+"&pid="+pid+"&sid="+sid+"&amount="+buyNum+"&price="+price,
							dataType:"text",
							success:function(data){
								if( data == "true" )
								{
									//  初始化顶部信息
  									initHeader();
  									alert("添加成功，请记得去下单奥！");
								}
								else if( data == "false" )
								{
									alert("添加失败，请稍后重试！");
								}
							},
							error:function(){
			                  alert("服务器出错，请重试！");
			             	}
			            });	
					})(jQuery);
  				}
  			}
  		}