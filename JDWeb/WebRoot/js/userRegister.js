		var isChecked = 0;		//  是否认证
		var isLegal = 0;		//  是否合法
		var isUsernameLegal = 0;  //  用户名是否通过
		var isPsdLegal = 0; 	  //  登录密码是否通过
		var isCheckPsdLegal = 0; 	  //  确认密码是否通过
		var isCheckCodeLegal = 0;     //  验证码是否正确
		var successRegister = 0;	  //  是否注册成功
		var userPhone;      //   用户手机
		var userName;		//   用户会员名
		var userPsd;        //   用户密码
		var phoneIsExist = "你的手机号码已经注册";
		var phoneErrorIllegal = "手机号码格式不正确，请重新输入";
		var phoneIsNull = "请输入你的手机号码";
		var usernameIsNull = "请输入会员名";
		var usernameIsExist = "该会员名已存在";
		var usernameIllegal = "该会员名不合法，请重新输入";
		var usernameIsNotLong = "会员名不够长";
		var psdIsNull = "请输入登录密码";
		var psdIllegal = "密码格式不正确，请重新输入";
		var psdIsNotLong = "密码必须为6-16位之间";
		var checkPsdIsNull = "请确认密码";
		var checkPsdIsError = "两次密码输入不一致，请检查";
		var checkCodeIsNull = "请输入验证码";
		var checkCodeIsError = "验证码错误，请重新输入";
		var successRegisterText = "注册成功！立即去商城逛逛吧。";
		var failedRegisterText = "非常抱歉，注册失败！请稍后重试。";
		//  验证手机
		var Expression = /^1[34578]\d{9}$/;
		var TelExp = new RegExp(Expression);
		//  验证会员名
		var ExpressionName = /^[a-zA-Z]{1}([a-zA-Z0-9]|[._]){4,19}$/; 
		var userNameExp = new RegExp(ExpressionName);
		// 验证密码
		//弱  
	    var Expressionweek = /^([a-zA-Z]){6,16}$|^(\d){6,16}$|^((?=[\x21-\x7e]+)[^A-Za-z0-9]){6,16}$|^(?!\2+$)(?!\1+$)[\2\1]{6,7}$|^(?!\3+$)(?!\1+$)[\3\1]{6,7}$|^(?!\3+$)(?!\2+$)[\2\3]{6,7}$|^(?=.*\3)(?=.*\1)(?=.*\2)[a-zA-Z\x21-\x7e\d]{6,7}$/;  
	    //中：字母+数字  
	    var Expressionmiddle1 = /^(?!\d+$)(?![a-zA-Z]+$)[\dA-Za-z]{8,16}$/;  
	    //中：字母+字符  
	    var Expressionmiddle2 = /^(?!((?=[\x21-\x7e]+)[^A-Za-z0-9])+$)(?![a-zA-Z]+$)[^\u4e00-\u9fa5\d]{8,16}$/;  
	    //中：数字+字符  
	    var Expressionmiddle3 = /^(?!((?=[\x21-\x7e]+)[^A-Za-z0-9])+$)(?!\d+$)[^\u4e00-\u9fa5a-zA-Z]{8,16}$/;  
	    //强  
	    var Expressionstrong = /^(?=.*((?=[\x21-\x7e]+)[^A-Za-z0-9]))(?=.*[a-zA-Z])(?=.*[0-9])[^\u4e00-\u9fa5]{8,16}$/;
	    var psdWeek = new RegExp(Expressionweek);
	    var psdMid1 = new RegExp(Expressionmiddle1);
	    var psdMid2 = new RegExp(Expressionmiddle2);
	    var psdMid3 = new RegExp(Expressionmiddle3);
	    var psdStrong = new RegExp(Expressionstrong);
		function btnselect(obj)
		{
			if( isChecked == 1 )
				obj.style.backgroundColor = "#EE5F00";
		}
		function btnNotselect(obj)
		{
			if( isChecked == 1 )
				obj.style.backgroundColor = "#FF7011";
		}
		function step23BtnSelect(obj)
		{
			obj.style.backgroundColor = "#EE5F00";
		}
		function step23BtnNotselect(obj)
		{
			obj.style.backgroundColor = "#FF7011";
		}
		//  校验手机号
		function checkPhone(obj)
		{
			isLegal = 0;
			if( obj.value == "" )	//  为空
			{
				(function($){
				$('#phoneTip_ok').css({'display':'none'});
				$('#phoneTip').css({'display':'block'});
				$('#phoneTip_Text').text(phoneIsNull);
				$('#phonenum').css({'borderColor':'#FF3300'});
				})(jQuery);
			}
			else if( TelExp.test( obj.value ) == false )	//  不合法
			{
				(function($){
				$('#phoneTip_ok').css({'display':'none'});
				$('#phoneTip').css({'display':'block'});
				$('#phoneTip_Text').text(phoneErrorIllegal);
				$('#phonenum').css({'borderColor':'#FF3300'});
				})(jQuery);
			}
			else
			{
				(function($){
				var val = $('#phonenum').val();
				//  异步检查手机号码是否注册
				$.ajax({  
	               type:"get",//请求方式  
	               url:"./servlet/checkUserPhone?phone="+val,//发送请求地址  
	               timeout:30000,//超时时间：30秒  
	               dataType:"text",//设置返回数据的格式  
	               //请求成功后的回调函数 data为text格式  
	               success:function(data){
	               	  if( data == "true" )
	               	  {
	               	  	$('#phoneTip_error').css({'display':'none'});
						$('#phoneTip_ok').css({'display':'block'});
						$('#phoneTip').css({'display':'block'});
						$('#phoneTip_Text').text('');
						userPhone = val;
						isLegal = 1;
	               	  }
	               	  else if( data == "false" )
	               	  {
	               	  	$('#phoneTip_ok').css({'display':'none'});
	               	  	$('#phoneTip_error').css({'display':'block'});
						$('#phoneTip').css({'display':'block'});
						$('#phoneTip_Text').text(phoneIsExist);
						$('#phonenum').css({'borderColor':'#FF3300'});
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
		function changBorder(obj)
		{
			(function($){
			$('#phonenum').css({'border':''});
			})(jQuery);
		}
		function goNext()
		{
			if( isLegal == 1 && isChecked == 1 )
			{
				//  手机填入成功，进入下一步
				(function($){
				$('#step1_title').css({'borderBottomColor':'#D5D5D5'});
				$('#step2_title').css({'borderBottomColor':'#FF4111'});
				$('#step1_text').css({'color':'#adb0b3'});
				$('#step2_text').css({'color':'black'});
				$('#one').css({'backgroundColor':'#adb0b3'});
				$('#two').css({'backgroundColor':'#FF4111'});
				// 隐藏第一步
				$('#step1_input').css({'display':'none'});
				// 显示第二步
				$('#step2_input').css({'display':'block'});
				})(jQuery);
			}
		}
		//  刷新验证码
		function reloadcode()
		{
			(function($){
			$('#checkCode_pic').attr("src","./jsp/makeCheckCodeImg.jsp?"+Math.random()); 
			$('#checkCode').val("");
			})(jQuery);
		}
		//  校验用户名
		function checkUsername(obj)
		{
			//  初始化
			(function($){
			$('#usernameTip_error').css({'display':'none'});
			$('#usernameTip_ok').css({'display':'none'});
			$('#usernameTip_text').text('');
			})(jQuery);
			isUsernameLegal = 0;
			//  用户名为空
			if( obj.value == "" )
			{
				obj.style.borderColor = "#FF3300";
				(function($){
				$('#usernameTip_error').css({'display':'block'});
				$('#usernameTip_text').text(usernameIsNull);
				})(jQuery);
			}
			else if( obj.value.length < 5 )	//  用户名不够长
			{
				obj.style.borderColor = "#FF3300";
				(function($){
				$('#usernameTip_error').css({'display':'block'});
				$('#usernameTip_text').text(usernameIsNotLong);
				})(jQuery);
			}
			else if( !userNameExp.test(obj.value) )	// 用户名不合法
			{
				obj.style.borderColor = "#FF3300";
				(function($){
				$('#usernameTip_error').css({'display':'block'});
				$('#usernameTip_text').text(usernameIllegal);
				})(jQuery);
			}
			else
			{
				(function($){
				var val = obj.value;
				//  异步查询用户名是否已经存在
				$.ajax({  
	               type:"get",//请求方式  
	               url:"./servlet/checkUserName?username="+val,//发送请求地址  
	               timeout:30000,//超时时间：30秒  
	               dataType:"text",//设置返回数据的格式  
	               //请求成功后的回调函数 data为text格式  
	               success:function(data){
	               	  if( data == "true" )
	               	  {
	               	  	// 用户名通过
						obj.style.borderColor = "gray";
						$('#usernameTip_text').text('');
						$('#usernameTip_error').css({'display':'none'});
						$('#usernameTip_ok').css({'display':'block'});
						isUsernameLegal = 1;
						userName = val;
	               	  }
	               	  else if( data == "false" )
	               	  {
	               	  	obj.style.borderColor = "#FF3300";
						$('#usernameTip_error').css({'display':'block'});
						$('#usernameTip_text').text(usernameIsExist);
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
		//  判断密码是否合法
		function tojudgePsd(string)
		{
			if( psdWeek.test(string) || psdMid1.test(string) || psdMid2.test(string) || psdMid3.test(string) || psdStrong.test(string) )
			{
				return true;
			}
			return false;
		}
		//  校验密码
		function tocheckPsd(obj)
		{
			//  初始化
			(function($){
			$('#psdTip_error').css({'display':'none'});
			$('#psdTip_ok').css({'display':'none'});
			$('#psdTip_text').text('');
			})(jQuery);
			isPsdLegal = 0;
			//  密码为空
			if( obj.value == "" )
			{
				obj.style.borderColor = "#FF3300";
				(function($){
				$('#psdTip_error').css({'display':'block'});
				$('#psdTip_text').text(psdIsNull);
				})(jQuery);
			}
			else if( obj.value.length < 6 )	//  密码不够长
			{
				obj.style.borderColor = "#FF3300";
				(function($){
				$('#psdTip_error').css({'display':'block'});
				$('#psdTip_text').text(psdIsNotLong);
				})(jQuery);
			}
			else if( !tojudgePsd(obj.value) )	// 密码不合法
			{
				obj.style.borderColor = "#FF3300";
				(function($){
				$('#psdTip_error').css({'display':'block'});
				$('#psdTip_text').text(psdIllegal);
				})(jQuery);
			}
			else
			{
				// 密码通过
				obj.style.borderColor = "gray";
				$('#psdTip_text').text('');
				$('#psdTip_error').css({'display':'none'});
				$('#psdTip_ok').css({'display':'block'});
				isPsdLegal = 1;
			}
		}
		// 判断密码等级
		function tojudgeLevel(obj)
		{
			//  初始化
			$('#low').css({'backgroundColor':'#FFCCAA'});
			$('#mid').css({'backgroundColor':'#FFCCAA'});
			$('#high').css({'backgroundColor':'#FFCCAA'});
			if( psdWeek.test(obj.value) )  //  弱
			{
				$('#low').css({'backgroundColor':'#FF6600'});
			}
			//中
			else if( psdMid1.test(obj.value) || psdMid2.test(obj.value) || psdMid3.test(obj.value) )
			{
				$('#low').css({'backgroundColor':'#FF6600'});
				$('#mid').css({'backgroundColor':'#FF6600'});
			}
			//强
			else if( psdStrong.test(obj.value) )
			{
				$('#low').css({'backgroundColor':'#FF6600'});
				$('#mid').css({'backgroundColor':'#FF6600'});
				$('#high').css({'backgroundColor':'#FF6600'});
			}
		}
		// 判断两次输入的密码是否一致
		function tocheckPsdSame(obj)
		{
			//  初始化
			(function($){
			$('#checkPsdTip_error').css({'display':'none'});
			$('#checkPsdTip_ok').css({'display':'none'});
			$('#checkPsdTip_text').text('');
			})(jQuery);
			var psd = document.getElementById("psd");
			isCheckPsdLegal = 0;
			if( obj.value == "" )	// 为空
			{
				obj.style.borderColor = "#FF3300";
				(function($){
				$('#checkPsdTip_error').css({'display':'block'});
				$('#checkPsdTip_text').text(checkPsdIsNull);
				})(jQuery);
			}
			else if( obj.value != psd.value ) // 两次输入不一致
			{
				obj.style.borderColor = "#FF3300";
				(function($){
				$('#checkPsdTip_error').css({'display':'block'});
				$('#checkPsdTip_text').text(checkPsdIsError);
				})(jQuery);
			}
			else
			{
				// 两次输入一致
				obj.style.borderColor = "gray";
				$('#checkPsdTip_text').text('');
				$('#checkPsdTip_error').css({'display':'none'});
				$('#checkPsdTip_ok').css({'display':'block'});
				isCheckPsdLegal = 1;
			}
		}
		// 校验验证码
		function tocheckCode(obj)
		{
			//  初始化
			(function($){
			$('#checkCode_error').css({'display':'none'});
			$('#checkCode_ok').css({'display':'none'});
			$('#checkCodeTip_text').text('');
			})(jQuery);
			isCheckCodeLegal = 0;
			if( obj.value == "" ) //  验证码为空
			{
				obj.style.borderColor = "#FF3300";
				(function($){
				$('#checkCode_error').css({'display':'block'});
				$('#checkCodeTip_text').text(checkCodeIsNull);
				})(jQuery);
			}
			else
			{
				(function($){
				var val = obj.value;
				//  异步检查验证码是否正确
				$.ajax({  
	               type:"get",//请求方式  
	               url:"./jsp/checkCheckCode.jsp?ckCode="+val,//发送请求地址  
	               timeout:30000,//超时时间：30秒  
	               dataType:"text",//设置返回数据的格式  
	               //请求成功后的回调函数 data为text格式  
	               success:function(data){
	               	  data = data.trim();
	               	  if( data == "true" )
	               	  {
			            // 验证码正确
						obj.style.borderColor = "gray";
						$('#checkCodeTip_text').text('');
						$('#checkCode_error').css({'display':'none'});
						$('#checkCode_ok').css({'display':'block'});
						isCheckCodeLegal = 1;
	               	  }
	               	  else if( data == "false" )
	               	  {
	               	  	obj.style.borderColor = "#FF3300";
						$('#checkCode_error').css({'display':'block'});
						$('#checkCodeTip_text').text(checkCodeIsError);
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
		//  确定注册
		function toRegister()
		{
			//  合法填入信息
			if( isUsernameLegal == 1 && isPsdLegal == 1 && isCheckPsdLegal == 1 && isCheckCodeLegal == 1 )
			{
				//  信息填入成功，发送数据到服务器
				(function($){
				userPsd = $('#psd').val();	//  获取密码值
				userPsd = $.md5(userPsd);   //  用md5加密密码
				//  保存数据到数据库
				$.ajax({  
	               type:"get",//请求方式  
	               url:"./servlet/userRegister?phone="+userPhone+"&username="+userName+"&psd="+userPsd,//发送请求地址  
	               timeout:30000,//超时时间：30秒  
	               dataType:"text",//设置返回数据的格式  
	               //请求成功后的回调函数 data为text格式  
	               success:function(data){
	               	  //  进入下一步
						$('#step2_title').css({'borderBottomColor':'#D5D5D5'});
						$('#step3_title').css({'borderBottomColor':'#FF4111'});
						$('#step2_text').css({'color':'#adb0b3'});
						$('#step3_text').css({'color':'black'});
						$('#two').css({'backgroundColor':'#adb0b3'});
						$('#three').attr({'src':'./pics/check_alt(1).png'});
						// 隐藏第二步
						$('#step2_input').css({'display':'none'});
						// 显示第三步
						$('#step3_input').css({'display':'block'});
	               	  if( data == "true" )	//  注册成功
	               	  {
			           	$('#Register_suc').css({'display':'block'});
						$('#step3_goToBtn').css({'display':'block'});
						$('#result_text').text(successRegisterText);
	               	  }
	               	  else if( data == "false" )	//  如果注册失败
	               	  {
	               	  	 //  显示按键、图片及提示
						$('#Register_failed').css({'display':'block'});
						$('#step3_refreshBtn').css({'display':'block'});
						$('#result_text').text(failedRegisterText);
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
		//  前往主页
		function toMainPage()
		{
			window.location.href = "./mainPage.html";
		}
		//  重新注册,刷新本页
		function reRegister()
		{
			location.replace("http://localhost:8080/JDWeb/userRegister.html");
		}