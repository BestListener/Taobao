		function clearInput()
		{
			document.getElementById("admin_name").value = "";
			document.getElementById("admin_psd").value = "";
			document.getElementById("check_psd").value = "";
		}
		function toAddManager()
		{
			var adminInput = document.getElementById("admin_name");
			var adminPsd = document.getElementById("admin_psd");
			var checkPsd = document.getElementById("check_psd");
			if( adminInput.value == "" || adminInput.value.length <= 4 )
			{
				adminInput.focus();
				adminInput.style.outlineColor = "red";
			}
			else if( adminPsd.value == "" || adminPsd.value.length < 6 )
			{
				adminPsd.focus();
				adminPsd.style.outlineColor = "red";
			}
			else if( checkPsd.value == "" || adminPsd.value != checkPsd.value )
			{
				checkPsd.focus();
				checkPsd.style.outlineColor = "red";
				alert("两次输入的密码不一致");
			}
			else
			{
				//  验证成功，到后台添加数据
				(function($){
				var uval = adminInput.value;
				var upsd = adminPsd.value;
				upsd = $.md5(upsd);
				$.ajax({  
	               type:"get",//请求方式  
	               url:"/JDWeb/servlet/admin/addManager?username="+uval+"&psd="+upsd,//发送请求地址  
	               timeout:30000,//超时时间：30秒  
	               dataType:"text",//设置返回数据的格式  
	               //请求成功后的回调函数 data为text格式  
	               success:function(data){
	               	  if( data == "true" )
	               	  {
							alert("添加成功！");
	               	  }
	               	  else if( data == "false" )
	               	  {
							alert("添加失败！");
	               	  }
	               	  else{
	               	  		alert(data);
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
		function recoverColor(obj)
		{
			obj.style.outlineColor = "blue";
		}