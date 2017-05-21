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
						alert("请完善你的个人信息");
						return;
					}
				}
				var year=$("#Year option:selected");
				var month=$("#Month option:selected");
				var day=$("#Date option:selected");
				if( year.val() == "年" || month.val() == "月" || day.val() == "日" )
				{
					alert("请选择你的生日日期");
					return;
				}
				//  验证成功
				$("#userData").submit();
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
			var picFileList = $("#userImageSrc").get(0).files;
			//html5新对象 封装文件对象
			var formData = new FormData();
			formData.append("file" , picFileList[0]);
			(function($){
				$.ajax({  
	              	type:"POST",
					url:"./servlet/upLoadImage",
					data:formData,
					contentType:false,
					dataType:"text",
					processData:false,
					success:function(data){
						$("#saveSrc").val(data);
						$("#userImage").attr("src","./"+data);
					},
					error:function(){
	                  alert("服务器出错，请重试！");
	             	}
	            });	
			})(jQuery);
		}