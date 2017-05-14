		//  修改数据
		function changeInfo()
		{
			if( checkInfo() )
			{
				//  执行修改操作
			}
		}
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
			else if( identifyPicSrc.value == "" )
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
		//  边框恢复
		function changeBorderColor(obj)
		{
			obj.style.outlineColor = "blue";
		}