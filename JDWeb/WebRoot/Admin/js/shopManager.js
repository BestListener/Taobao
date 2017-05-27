		var curOption;  //  当前选中的选项
		var options = new Object();
		options['verify'] = "/JDWeb/servlet/admin/getShopList?state=等待验证";
		options['normal'] = "/JDWeb/servlet/admin/getShopList?state=正在运营";
		options['stop'] = "/JDWeb/servlet/admin/getShopList?state=停止运营";
		//  获取用户总数
		function getShopNum()
		{
			(function($){
			$.ajax({  
               type:"get",//请求方式  
               url:"/JDWeb/servlet/admin/getShopNumber",//发送请求地址  
               timeout:30000,//超时时间：30秒  
               dataType:"text",//设置返回数据的格式  
               //请求成功后的回调函数 data为text格式  
               success:function(data){
               	  document.getElementById("shopRightTitle").innerText = "店铺总数: "+data;
              },
              //请求出错的处理
              error:function(){  
                  alert("服务器出错，请重试！");
              }
            });	
			})(jQuery);
		}
		//  点击选项
		function clickOption(obj)
		{
			if( curOption != obj.id )
			{
				var curBtn = document.getElementById(curOption);
				var view = document.getElementById("shopsList");
				curBtn.style.color = "#adb0b3";
				curBtn.style.borderBottomColor = "#D5D5D5";
				obj.style.color = "black";
				obj.style.borderBottomColor = "#FF4111";
				curOption = obj.id;
				view.src = options[curOption];
			}
		}
		function searchShop()
		{
			var input = document.getElementById("inputText");
			if( input.value != "" )
			{
				var searchVal = input.value;
				//  清空两侧空格
				document.getElementById("shopsList").src = options[curOption]+"&search="+searchVal;
			}
		}
		//  清空查找栏,返回全部数据
		function clearInput()
		{
			var input = document.getElementById("inputText");
			if( input.value != "" )
			{
				input.value = "";
				document.getElementById("shopsList").src = options[curOption];
			}
		}