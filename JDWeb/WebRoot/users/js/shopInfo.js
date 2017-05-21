		//  检查表单数据
		function checkInfo()
		{
				//  验证手机
			var Expression = /^1[34578]\d{9}$/;
			var TelExp = new RegExp(Expression);
			var shopPhone = document.getElementById("shopPhone");
			var shopName = document.getElementById("shopName");
			var shopowName = document.getElementById("shopowName");
			var identifyPicSrc = document.getElementById("identifyPicSrc");
			if( shopPhone.value == "" || !TelExp.test(shopPhone.value) )
			{
				shopPhone.focus();
				shopPhone.style.outlineColor = "red";
				return false;
			}
			else if( shopName.value == "" )
			{
				shopName.focus();
				shopName.style.outlineColor = "red";
				return false;
			}
			else if( shopowName.value == "" )
			{
				shopowName.focus();
				shopowName.style.outlineColor = "red";
				return false;
			}
			else if( saveSrc.value == "" )
			{
				alert("请上传认证照片！");
				return false;
			}
			else
			{
				//  验证成功
				return true;
			}
		}
		//  修改数据
		function changeInfo()
		{
			if( checkInfo() )
			{
				//  执行修改操作
				$("#shopData").submit();
			}
		}
		//  商店申请
		function toapplyShop()
		{
			if( checkInfo() )
			{
				//  提交表单
				$("#shopData").submit();
			}
		}
		//  边框恢复
		function changeBorderColor(obj)
		{
			obj.style.outlineColor = "blue";
		}
		//  更新图片
		function updatePic()
		{
			var picFileList = $("#identifyPicSrc").get(0).files;
			//html5新对象 封装文件对象
			var formData = new FormData();
			formData.append("file" , picFileList[0]);
			(function($){
				$.ajax({  
	              	type:"POST",
					url:"./servlet/upLoadShopImage",
					data:formData,
					contentType:false,
					dataType:"text",
					processData:false,
					success:function(data){
						$("#saveSrc").val(data);
						$("#identifyPic").attr("src","./"+data);
					},
					error:function(){  
	                  alert("服务器出错，请重试！");
	             	}
	            });	
			})(jQuery);
		}