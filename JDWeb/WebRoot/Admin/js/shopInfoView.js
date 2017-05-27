		function init()
		{
			if( state == "等待验证" )
			{
				document.getElementById("passBtn").style.display = "block";
			}
			else if( state == "正在运营" )
			{
				document.getElementById("stopBtn").style.display = "block";
				document.getElementById("shopstate").style.color = "#4DDC3B";
			}
			else
			{
				document.getElementById("recoverBtn").style.display = "block";
				document.getElementById("shopstate").style.color = "red";
			}	
		}
		//  鼠标移入停用按键
		function instopBtn(obj)
  		{
  			obj.style.backgroundColor = "#FF0000";
  		}
  		//  鼠标移出停用按键
  		function outstopBtn(obj)
  		{
  			obj.style.backgroundColor = "#FF4444";
  		}
  		//  鼠标移入查看按键
  		function inCheckBtn(obj)
  		{
  			obj.style.backgroundColor = "gray";
  		}
  		//  鼠标移出查看按键
  		function outCheckBtn(obj)
  		{
  			obj.style.backgroundColor = "#BBBBBB";
  		}
  		//  鼠标移入恢复按键
		function inRecoverBtn(obj)
  		{
  			obj.style.backgroundColor = "#3AA22D";
  		}
  		//  鼠标移出恢复按键
  		function outRecoverBtn(obj)
  		{
  			obj.style.backgroundColor = "#4DDC3B";
  		}
  		//  点击返回按钮
  		function clickBackBtn()
  		{
  			window.location.href = "/JDWeb/Admin/jsp/shopManager.jsp";
  		}
  		//  点击停用按钮
  		function clickStopBtn(id)
  		{
  			var state = document.getElementById("shopstate").innerText;
  			(function($){
				$.ajax({  
	               type:"get",//请求方式  
	               url:"/JDWeb/servlet/admin/updateShopStateFromInfoPage?sid="+id+"&state="+state,//发送请求地址  
	               timeout:30000,//超时时间：30秒  
	               dataType:"text",//设置返回数据的格式  
	               //请求成功后的回调函数 data为text格式  
	               success:function(data){
	               	  if( data == "true" )
	               	  {
	               	  		document.getElementById("stopBtn").style.display = "none";
	               	  		document.getElementById("recoverBtn").style.display = "block";
	               	  		document.getElementById("shopstate").innerText = "停止运营";
	               	  		document.getElementById("shopstate").style.color = "red";
							alert("停用成功！");
	               	  }
	               	  else if( data == "false" )
	               	  {
							alert("停用失败！");
	               	  }
	              },
	              //请求出错的处理  
	              error:function(){  
	                  alert("服务器出错，请重试！");
	              }
	            });	
				})(jQuery);
  		}	
  		//  点击恢复按钮
  		function clickRecoverBtn(id)
  		{
  			var state = document.getElementById("shopstate").innerText;
  			(function($){
				$.ajax({  
	               type:"get",//请求方式  
	               url:"/JDWeb/servlet/admin/updateShopStateFromInfoPage?sid="+id+"&state="+state,//发送请求地址  
	               timeout:30000,//超时时间：30秒  
	               dataType:"text",//设置返回数据的格式  
	               //请求成功后的回调函数 data为text格式  
	               success:function(data){
	               	  if( data == "true" )
	               	  {
	               	  		document.getElementById("stopBtn").style.display = "block";
	               	  		document.getElementById("recoverBtn").style.display = "none";
	               	  		document.getElementById("shopstate").innerText = "正在运营";
	               	  		document.getElementById("shopstate").style.color = "#4DDC3B";
							alert("恢复成功！");
	               	  }
	               	  else if( data == "false" )
	               	  {
							alert("恢复失败！");
	               	  }
	              },
	              //请求出错的处理  
	              error:function(){  
	                  alert("服务器出错，请重试！");
	              }
	            });	
				})(jQuery);
  		}
  		//  点击通过按钮
  		function clickPassBtn(id)
  		{
  			var state = document.getElementById("shopstate").innerText;
  			(function($){
				$.ajax({  
	               type:"get",//请求方式  
	               url:"/JDWeb/servlet/admin/checkPassShop?sid="+id+"&state="+state,//发送请求地址  
	               timeout:30000,//超时时间：30秒  
	               dataType:"text",//设置返回数据的格式  
	               //请求成功后的回调函数 data为text格式  
	               success:function(data){
	               	  if( data == "true" )
	               	  {
	               	  		document.getElementById("stopBtn").style.display = "block";
	               	  		document.getElementById("passBtn").style.display = "none";
	               	  		document.getElementById("shopstate").innerText = "正在运营";
	               	  		document.getElementById("shopstate").style.color = "#4DDC3B";
							alert("验证通过成功！");
	               	  }
	               	  else if( data == "false" )
	               	  {
							alert("验证通过失败！");
	               	  }
	              },
	              //请求出错的处理  
	              error:function(){  
	                  alert("服务器出错，请重试！");
	              }
	            });	
				})(jQuery);
  		}