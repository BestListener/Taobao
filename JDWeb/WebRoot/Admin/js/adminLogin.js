		function toLogin()
		{
			var username = document.getElementById("username");
			var psd = document.getElementById("psd");
			if( username.value != "" && psd.value != "")
			{
				//  检查用户名和密码
				(function($){
				var uval = username.value;
				var upsd = psd.value;
				upsd = $.md5(upsd);
				$.ajax({  
	               type:"get",//请求方式  
	               url:"/JDWeb/servlet/admin/login?username="+uval+"&psd="+upsd,//发送请求地址  
	               timeout:30000,//超时时间：30秒  
	               dataType:"text",//设置返回数据的格式  
	               //请求成功后的回调函数 data为text格式  
	               success:function(data){
	               	  if( data == "true" )
	               	  {
							window.location.href = "/JDWeb/Admin/jsp/managerMainPage.jsp";
	               	  }
	               	  else if( data == "false" )
	               	  {
							alert("用户名或密码不正确！");
	               	  }
	              },
	              //请求出错的处理  
	              error:function(){  
	                  alert("服务器出错，请重试！");
	              }
	            });	
				})(jQuery);
			}
		}
		function clearInput()
		{
			var username = document.getElementById("username");
			var psd = document.getElementById("psd");
			username.value = "";
			psd.value = "";
		}