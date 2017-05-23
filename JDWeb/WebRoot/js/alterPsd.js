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
				return;
			}
			else
			{
				var inputList = $("#userInfoTab").find("input");
				for(var index = 0; index < inputList.length; index++)
				{
					if( inputList[index].value == "" && inputList[index].id != "saveSrc" && inputList[index].id != "userImageSrc" )
					{
						alert("请完善所需信息");
						return;
					}
				}
				if( $("#newPsd").val().length < 6 )
				{
					alert("密码长度不能小于6");
					return;
				}
				else if( $("#newPsd").val() != $("#confirmPsd").val() )
				{
					alert("两次输入的密码不一致");
					return;
				}
				//  验证成功
				//  提交信息到服务器，修改密码
				(function($){
				var phone = $("#phoneNum").val();
				var psd = $("#newPsd").val();
				psd = $.md5(psd);   //  用md5加密密码
				//  异步检查验证码是否正确
				$.ajax({  
	               type:"get",//请求方式  
	                url:"./servlet/alterPassword?phone="+phone+"&psd="+psd,//发送请求地址  
	               timeout:30000,//超时时间：30秒  
	               dataType:"text",//设置返回数据的格式  
	               //请求成功后的回调函数 data为text格式  
	               success:function(data){
	               	   if( data == "true" )	//  修改成功
	               	   {
	               	   		alert("修改成功，请前往登录！");
	               	   		window.location.href = "./userLogin.html";
	               	   }
	               	   else if( data == "false" )	//  如果修改失败
	               	   {
	               	  		alert("修改密码失败，请稍后重试！");
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
		//  边框恢复
		function changeBorderColor(obj)
		{
			obj.style.outlineColor = "blue";
		}