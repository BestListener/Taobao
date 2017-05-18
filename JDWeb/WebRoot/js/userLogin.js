		var loginErrorInputIsnull = "请输入用户名和密码";
		var loginErrorUsernameIsnull = "请输入用户名";
		var loginErrorPsdIsnull = "请输入密码";
		var loginErrorLoginfail = "你输入的密码和账户名不匹配，是否忘记密码或忘记会员名";
		//  前往淘宝首页
		function toMainPage()
		{
			window.location.href = "http://localhost:8080/JDWeb/mainPage.html";
		}
		function init()
		{
			var pic = document.getElementById("del_img");
			pic.style.display = "none";
		}
		function changeUserBorder(obj)
		{
			var input = obj.parentNode;
			input.style.borderColor = "#4BB3F9";
			if( inputFlag == 0 )
			{
				obj.style.color = "black";
				obj.value = "";
			}
		}
		function backUserBorder(obj)
		{
			var input = obj.parentNode;
			input.style.borderColor = "#D5D5D5";
		}
		function showInputTip(obj)
		{
			var pic = document.getElementById("del_img");
			if( event.keyCode == 8 )
			{
				if( obj.value == "" )
				{
					pic.style.display = "none";
				}
			}
		}
		function clearTip(obj)
		{
			var pic = document.getElementById("del_img");
			if( event.keyCode != 8 )
			{
				pic.style.display = "block";
			}
		}
		function changeBorder(obj)
		{
			var input = obj.parentNode;
			input.style.borderColor = "#4BB3F9";
		}
		function changback(obj)
		{
			var input = obj.parentNode;
			input.style.borderColor = "#D5D5D5";
		}
		function changebtn(obj)
		{
			obj.style.borderColor = "#EE5F00";
			obj.style.backgroundColor = "#EE5F00";
		}
		function changebackbtn(obj)
		{
			obj.style.borderColor = "#FF7011";
			obj.style.backgroundColor = "#FF7011";
		}
		function showtip()
		{
			var obj = document.getElementById("tip");
			obj.style.display = "block";
		}
		function hiddentip()
		{
			var obj = document.getElementById("tip");
			obj.style.display = "none";
		}
		function clearInput()
		{
			var obj = document.getElementById("username");
			var input = obj.parentNode;
			var pic = document.getElementById("del_img");
			obj.value = "";
			pic.style.display = "none";
			obj.focus();
			input.style.borderColor = "#4BB3F9";
		}
		//  点击登录
		function clickLogin()
		{
			var username = document.getElementById("username");
			var psd = document.getElementById("psd");
			var tip = document.getElementById("tiptext");
			tip.innerText = "";
			//  如果用户名和密码为空
			if( username.value == "" && psd.value == "" )
			{
				tip.innerText = loginErrorInputIsnull;
				showtip();
			}
			else if( username.value == "" )// 如果用户名为空
			{
				tip.innerText = loginErrorUsernameIsnull;
				showtip();
			}
			else if( psd.value == "" ) //  如果密码为空
			{
				tip.innerText = loginErrorPsdIsnull;
				showtip();
			}else
			{
				//  检查用户名和密码
				(function($){
				var uval = username.value;
				var upsd = psd.value;
				upsd = $.md5(upsd);
				//  异步检查手机号码是否注册
				$.ajax({  
	               type:"get",//请求方式  
	               url:"./servlet/checkUserPsd?username="+uval+"&psd="+upsd,//发送请求地址  
	               timeout:30000,//超时时间：30秒  
	               dataType:"text",//设置返回数据的格式  
	               //请求成功后的回调函数 data为text格式  
	               success:function(data){
	               	  if( data == "true" )
	               	  {
							window.location.href = "./mainPage.html";
	               	  }
	               	  else if( data == "false" )
	               	  {
							tip.innerText = loginErrorLoginfail;
							showtip();
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